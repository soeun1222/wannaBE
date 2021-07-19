package nonFace;

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

public class NfDBBean {
	private static NfDBBean instance = new NfDBBean();
	
	public static NfDBBean getinstance() {
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
	public int insertNfBoard(NfBean board, String u_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int number;
		int re = -1;
		
		board.setNf_date(new Timestamp(System.currentTimeMillis()));
		
		try {
			
			con = getConnection();
			sql = "select max(nf_num) from non_face";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1;
			}
			
			
			sql = "insert into non_face(nf_num, nf_title, nf_content,nf_date,user_tbl_u_id) "
					+ "values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, HanConv.tokor(board.getNf_title()));
			pstmt.setString(3, HanConv.tokor(board.getNf_content()));
			pstmt.setTimestamp(4, board.getNf_date());
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
	public ArrayList<NfBean> listNfBoard(String pageNumber) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		/*--페이징 처리 부분--*/
		ResultSet pageSet = null;
		int dbCount = 0;
		int absoultePage = 1;
		
		ArrayList<NfBean> nfList = new ArrayList<NfBean>();
		
		try {
			
			con = getConnection();
			
			/*--페이징 처리 부분--*/
			stmt = con.createStatement();
			pageSet = stmt.executeQuery("select count(nf_num) from non_face");
			/*-- 삭제된 회원 글 제외하고 페이징 처리 
			pageSet = stmt.executeQuery("select count(*) from non_face n join user_tbl u on n.user_tbl_u_id = u.u_id");
			--*/
			
			if(pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}
			
			if(dbCount % NfBean.pageSize == 0) {
				NfBean.pageCount = dbCount / NfBean.pageSize;
			} else {
				NfBean.pageCount = dbCount / NfBean.pageSize + 1;
			}
			
			if(pageNumber != null) {
				NfBean.pageNum = Integer.parseInt(pageNumber);
				absoultePage = (NfBean.pageNum - 1) * NfBean.pageSize + 1;
			}
			
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			String sql = "select n.* "
					+ "from non_face n join user_tbl u "
					+ "on n.user_tbl_u_id = u.u_id "
					+ "order by u.u_manager desc, n.nf_num desc";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				rs.absolute(absoultePage);
				int count = 0;
				
				while(count < NfBean.pageSize) {
					NfBean nb = new NfBean();
					nb.setNf_num(rs.getInt(1));
					nb.setNf_title(rs.getString(2));
					nb.setNf_content(rs.getString(3));
					nb.setNf_date(rs.getTimestamp(4));
					nb.setNf_hit(rs.getInt(5));
					nb.setU_id(rs.getString(6));
					
					nfList.add(nb);
					
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
		
		return nfList;
		
	}
	
	/*--게시글 보기--*/
	public NfBean getNfBoard(int nf_num, boolean hitadd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		NfBean board = new NfBean();
		
		try {
			
			con = getConnection();
			
			/*--조회수 증가--*/
			if(hitadd == true) {
				sql = "update non_face set nf_hit = nf_hit + 1 where nf_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, nf_num);
				pstmt.executeUpdate();
				pstmt.close();
			}
			
			sql = "select * from non_face where nf_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nf_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board.setNf_num(rs.getInt(1));
				board.setNf_title(rs.getString(2));
				board.setNf_content(rs.getString(3));
				board.setNf_date(rs.getTimestamp(4));
				board.setNf_hit(rs.getInt(5));
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
	public int editNfBoard(NfBean board) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int re = -1;
		
		try {
			
			con = getConnection();
			sql = "update non_face set nf_title = ?, nf_content = ? where nf_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, HanConv.tokor(board.getNf_title()));
			pstmt.setString(2, HanConv.tokor(board.getNf_content()));
			pstmt.setInt(3, board.getNf_num());
			
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
	public int deleteNfBoard(int nf_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		int re = -1;
		
		try {
			
			con = getConnection();
			sql = "delete non_face where nf_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nf_num);
			
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
			pstmt.setString(2, "non_face");
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
					+ "where comm_table = 'non_face' and table_num = ? "
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




































