package homeTip;

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

public class HtDBBean {
	private static HtDBBean instance = new HtDBBean();
	
	public static HtDBBean getinstance() {
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
	public int insertHtBoard(HtBean board, String u_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int number;
		int re = -1;
		
		board.setHt_date(new Timestamp(System.currentTimeMillis()));
		
		try {
			
			con = getConnection();
			sql = "select max(ht_num) from home_tip";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}
			
			
			sql = "insert into home_tip(ht_num, ht_title, ht_content, ht_date, user_tbl_u_id) "
					+ "values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, HanConv.tokor(board.getHt_title()));
			pstmt.setString(3, HanConv.tokor(board.getHt_content()));
			pstmt.setTimestamp(4, board.getHt_date());
			pstmt.setString(5, u_id);
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
	public ArrayList<HtBean> listHtBoard(String pageNumber) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		/*--페이징 처리 부분--*/
		ResultSet pageSet = null;
		int dbCount = 0;
		int absoultePage = 1;
		
		ArrayList<HtBean> htList = new ArrayList<HtBean>();
		
		try {
			
			con = getConnection();
			
			/*--페이징 처리 부분--*/
			stmt = con.createStatement();
			pageSet = stmt.executeQuery("select count(ht_num) from home_tip");
			
			if(pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if(dbCount % HtBean.pageSize == 0) {
				HtBean.pageCount = dbCount / HtBean.pageSize;
			} else {
				HtBean.pageCount = dbCount / HtBean.pageSize + 1;
			}
			
			if(pageNumber != null) {
				HtBean.pageNum = Integer.parseInt(pageNumber);
				absoultePage = (HtBean.pageNum - 1) * HtBean.pageSize + 1;
			}
			
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sql = "select h.* "
					+ "from home_tip h join user_tbl u "
					+ "on h.user_tbl_u_id = u.u_id "
					+ "order by u.u_manager desc, h.ht_num desc";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				rs.absolute(absoultePage);
				int count = 0;
				
				while(count < HtBean.pageSize) {
					HtBean hb = new HtBean();
					hb.setHt_num(rs.getInt(1));
					hb.setHt_title(rs.getString(2));
					hb.setHt_content(rs.getString(3));
					hb.setHt_date(rs.getTimestamp(4));
					hb.setHt_hit(rs.getInt(5));
					hb.setU_id(rs.getString(6));
					
					htList.add(hb);
					
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
		
		return htList;
		
	}
	
	/*--게시글 보기--*/
	public HtBean getHtBoard(int ht_num, boolean hitadd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		HtBean board = new HtBean();
		
		try {
			
			con = getConnection();
			
			/*--조회수 증가--*/
			if(hitadd == true) {
				sql = "update home_tip set ht_hit = ht_hit + 1 where ht_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ht_num);
				pstmt.executeUpdate();
				pstmt.close();
			}
			
			sql = "select * from home_tip where ht_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ht_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board.setHt_num(rs.getInt(1));
				board.setHt_title(rs.getString(2));
				board.setHt_content(rs.getString(3));
				board.setHt_date(rs.getTimestamp(4));
				board.setHt_hit(rs.getInt(5));
				board.setU_id(rs.getString(6));
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
	public int editHtBoard(HtBean board) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		try {
			
			con = getConnection();
			sql = "update home_tip set ht_title = ?, ht_content = ? where ht_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, HanConv.tokor(board.getHt_title()));
			pstmt.setString(2, HanConv.tokor(board.getHt_content()));
			pstmt.setInt(3, board.getHt_num());
			
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
	public int deleteHtBoard(int ht_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1;
		
		try {
			
			con = getConnection();
			sql = "delete home_tip where ht_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ht_num);
			
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
	
	/*--댓글 작성 insert--*/
	public int insertComment(ComBean comBoard) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int number;
		
		int ref = comBoard.getComm_ref();
		int step = comBoard.getComm_step();
		int level = comBoard.getComm_level();
		
		try {
			con = getConnection();
			sql = "select max(comm_num) from comment_tbl";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}
			
			if(step > 0) {
				sql = "update comment_tbl set comm_step = comm_step + 1 where comm_ref=? and comm_step > ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				pstmt.executeUpdate();
				
				step = step + 1;
				level = level + 1;
			} else {
				ref = number;
				step = 0;
				level = 0;
			}
			
			sql = "insert into comment_tbl values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, "home_tip");
			pstmt.setString(3, HanConv.tokor(comBoard.getComm_content()));
			pstmt.setInt(4, ref);
			pstmt.setInt(5, step);
			pstmt.setInt(6, level);
			pstmt.setInt(7, comBoard.getTable_num());
			pstmt.setString(8, comBoard.getU_id());
			
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 1;
	}
	
	/*--댓글 리스트--*/
	public ArrayList<ComBean> listComment(int table_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<ComBean> comList = new ArrayList<ComBean>();
		
		try {
			
			con = getConnection();
			sql = "select * from comment_tbl "
					+ "where comm_table = 'home_tip' and table_num = ? "
					+ "order by comm_ref desc, comm_level asc, comm_num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, table_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ComBean cb = new ComBean();
				cb.setComm_num(rs.getInt(1));
				cb.setComm_table(rs.getString(2));
				cb.setComm_content(rs.getString(3));
				cb.setComm_ref(rs.getInt(4));
				cb.setComm_step(rs.getInt(5));
				cb.setComm_level(rs.getInt(6));
				cb.setTable_num(rs.getInt(7));
				cb.setU_id(rs.getString(8));
				
				comList.add(cb);
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
		
		
		return comList;
	}
	
	/*--댓글 삭제--*/
	public int deleteComment(int comm_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1;
		
		try {
			
			con = getConnection();
			sql = "delete comment_tbl where comm_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comm_num);
			
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
}




































