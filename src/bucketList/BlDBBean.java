package bucketList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import comment.ComBean;
import myUtil.HanConv;

public class BlDBBean {
	private static BlDBBean instance = new BlDBBean();
	
	public static BlDBBean getinstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	/*--관리자와 사용자 구분--*/
	public int confirmManager(String u_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = 0;
		
		try {
			
			con = getConnection();
			sql = "select u_manager from user_tbl where u_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			
			/*--관리자 : re = 1, 사용자 : re = 0--*/
			if(rs.next()) {
				re = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return re;
	}
	
	/*--글 작성 insert--*/
	public int insertBlBoard(BlBean board, String u_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int number;
		int re = -1;

		try {
			
			con = getConnection();
			sql = "select max(bl_num) from bucket_list";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}
			
			
			sql = "insert into bucket_list(bl_num, bl_title, user_tbl_u_id) "
					+ "values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, HanConv.tokor(board.getBl_title()));
			pstmt.setString(3, u_id);
			pstmt.executeUpdate();
			
			re = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	/*--게시글 리스트--*/
	public ArrayList<BlBean> listBlBoard(String pageNumber) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		/*--페이징 처리 부분--*/
		ResultSet pageSet = null;
		int dbCount = 0;
		int absoultePage = 1;
		
		ArrayList<BlBean> blList = new ArrayList<BlBean>();
		
		try {
			
			con = getConnection();
			
			/*--페이징 처리 부분--*/
			stmt = con.createStatement();
			pageSet = stmt.executeQuery("select count(bl_num) from bucket_list");
			
			if(pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if(dbCount % BlBean.pageSize == 0) {
				BlBean.pageCount = dbCount / BlBean.pageSize;
			} else {
				BlBean.pageCount = dbCount / BlBean.pageSize + 1;
			}
			
			if(pageNumber != null) {
				BlBean.pageNum = Integer.parseInt(pageNumber);
				absoultePage = (BlBean.pageNum - 1) * BlBean.pageSize + 1;
			}
			
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sql = "select b.* "
					+ "from bucket_list b join user_tbl u "
					+ "on b.user_tbl_u_id = u.u_id "
					+ "order by u.u_manager desc, b.bl_like desc";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				rs.absolute(absoultePage);
				int count = 0;
				
				while(count < BlBean.pageSize) {
					BlBean bb = new BlBean();
					bb.setBl_num(rs.getInt(1));
					bb.setBl_title(rs.getString(2));
					bb.setBl_like(rs.getInt(3));
					bb.setU_id(rs.getString(4));
					
					blList.add(bb);
					
					if(rs.isLast()) {
						break;
					} else {
						rs.next();
					}
					count++;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return blList;
		
	}
	
	/*--게시글 보기--*/
	public BlBean getBlBoard(int bl_num, boolean hitadd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		BlBean board = new BlBean();
		
		try {
			
			con = getConnection();
			sql = "select * from bucket_list where bl_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bl_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board.setBl_num(rs.getInt(1));
				board.setBl_title(rs.getString(2));
				board.setBl_like(rs.getInt(3));
				board.setU_id(rs.getString(4));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	
		return board;
	}
	
	/*--게시글 수정--*/
	public int editBlBoard(BlBean board) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		try {
			
			con = getConnection();
			sql = "update bucket_list set bl_title = ? where bl_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, HanConv.tokor(board.getBl_title()));
			pstmt.setInt(2, board.getBl_num());
			
			pstmt.executeUpdate();
			
			re = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return re;
	}
	
	/*--게시글 삭제--*/
	public int deleteBlBoard(int bl_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1;
		
		try {
			
			con = getConnection();
			sql = "delete bucket_list where bl_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bl_num);
			
			pstmt.executeUpdate();
			
			re = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	/*--좋아요 누르기--*/
	public int likeBlBoard(int bl_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1;
		
		try {
			
			con = getConnection();
			sql = "update bucket_list set bl_like = bl_like + 1 where bl_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bl_num);
			pstmt.executeUpdate();
			
			re = 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	
		return re;
	}
	/* 좋아요 번호 입력 */
	public int inputlike(String u_id, int bl_num, String bl_title) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1;
		
		try {
			con = getConnection();
			sql = "insert into like_list values(?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bl_num);
			pstmt.setString(2, u_id);
			pstmt.executeUpdate();
			
			re=1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	/*--좋아요 중복 막기--*/
	
	public ArrayList<Integer> userLikeList(String u_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<Integer> listNum = new ArrayList<Integer>();
		
		try {
			con = getConnection();
			sql = "select like_num from like_list where user_tbl_u_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				listNum.add(rs.getInt(1));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return listNum;
	}
}




































