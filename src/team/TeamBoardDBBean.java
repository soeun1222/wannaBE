package team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class TeamBoardDBBean {
	private static TeamBoardDBBean instance=new TeamBoardDBBean();
	public static TeamBoardDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Context ctx=new InitialContext();
		DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	public ArrayList<TeamBoard> userListBoard(String pageNumber) {
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		ResultSet pageSet=null;
		int dbCount=0;
		int absolutePage=1;
		
		ArrayList<TeamBoard> userList=new ArrayList<TeamBoard>();
		try {
			con = getConnection();
			stmt = con.createStatement();
			pageSet = stmt.executeQuery("select count(u_id) from user_tbl");
			
			if(pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				stmt.close();
			}

			if(dbCount % TeamBoard.pageSize == 0) {
				TeamBoard.pageCount = dbCount / TeamBoard.pageSize;
			}else {
				TeamBoard.pageCount = dbCount / TeamBoard.pageSize + 1; //pageCount = 페이지 개수	
			}
			
			if(pageNumber != null) {
				TeamBoard.pageNum = Integer.parseInt(pageNumber);
				absolutePage = (TeamBoard.pageNum-1) * TeamBoard.pageSize + 1;
			}
			
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sql="select * from user_tbl";
			rs=stmt.executeQuery(sql);
			
			if(rs.next()) {
				rs.absolute(absolutePage);
				int count = 0;
				while (count < TeamBoard.pageSize) {
					TeamBoard Board=new TeamBoard();
					Board.setU_id(rs.getString(1));
					Board.setU_pwd(rs.getString(2));
					Board.setU_name(rs.getString(3));
					Board.setU_email(rs.getString(4));
					Board.setU_phone(rs.getInt(5));
					Board.setU_birth(rs.getInt(6));
					Board.setU_sex(rs.getString(7));
					
					userList.add(Board);
					
					if (rs.isLast()) {
						break;
					}else {
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
		return userList;
	}
	// 비대면 쪽 수정했으니 해보고 안되면 수정 되면 이대로 홈팁도 할것
	public ArrayList<TeamBoard> nfListBoard(String user_tbl_u_id, String pageNumber, int page) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ResultSet pageSet=null;
		int dbCount=0;
		int absolutePage=1;
		String sql="";
		
		ArrayList<TeamBoard> nfList=new ArrayList<TeamBoard>();
		
		try {
			con = getConnection();
			sql="select count(nf_num) from non_face where user_tbl_u_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_tbl_u_id);
			pageSet = pstmt.executeQuery();
			
			if(pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				pstmt.close();
			}
			
			if(page == 10) {
				if(dbCount % TeamBoard.pageSize == 0) {
					TeamBoard.pageCount = dbCount / TeamBoard.pageSize;
				}else {
					TeamBoard.pageCount = dbCount / TeamBoard.pageSize + 1; //pageCount = 페이지 개수	
				}
				
				if(pageNumber != null) {
					TeamBoard.pageNum = Integer.parseInt(pageNumber);
					absolutePage = (TeamBoard.pageNum-1) * TeamBoard.pageSize + 1;
				}
	//			pstmt = (PreparedStatement) con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				sql="select * from non_face where user_tbl_u_id=? order by nf_num desc";
				pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, user_tbl_u_id);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					rs.absolute(absolutePage);
					int count = 0;
					while (count < TeamBoard.pageSize) {
						TeamBoard Board=new TeamBoard();
						Board.setNf_num(rs.getInt(1));
						Board.setNf_title(rs.getString(2));
						Board.setNf_content(rs.getString(3));
						Board.setNf_date(rs.getTimestamp(4));
						Board.setNf_hit(rs.getInt(5));
						
						nfList.add(Board);
						
						if (rs.isLast()) {
							break;
						}else {
							rs.next();
						}
						count++;
					}
				}
			} else if (page == 5) {
				if(dbCount % TeamBoard.pageSize2 == 0) {
					TeamBoard.pageCount = dbCount / TeamBoard.pageSize2;
				}else {
					TeamBoard.pageCount = dbCount / TeamBoard.pageSize2 + 1; //pageCount = 페이지 개수	
				}
				
				if(pageNumber != null) {
					TeamBoard.pageNum = Integer.parseInt(pageNumber);
					absolutePage = (TeamBoard.pageNum-1) * TeamBoard.pageSize2 + 1;
				}
	//			pstmt = (PreparedStatement) con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				sql="select * from non_face where user_tbl_u_id=? order by nf_num desc";
				pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, user_tbl_u_id);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					rs.absolute(absolutePage);
					int count = 0;
					while (count < TeamBoard.pageSize2) {
						TeamBoard Board=new TeamBoard();
						Board.setNf_num(rs.getInt(1));
						Board.setNf_title(rs.getString(2));
						Board.setNf_content(rs.getString(3));
						Board.setNf_date(rs.getTimestamp(4));
						Board.setNf_hit(rs.getInt(5));
						
						nfList.add(Board);
						
						if (rs.isLast()) {
							break;
						}else {
							rs.next();
						}
						count++;
					}
				}
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
		return nfList;
	}
	
	public ArrayList<TeamBoard> htListBoard(String user_tbl_u_id, String pageNumber, int page) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ResultSet pageSet=null;
		int dbCount=0;
		int absolutePage=1;
		
		ArrayList<TeamBoard> htList=new ArrayList<TeamBoard>();
		
		try {
			con = getConnection();
			String sql="select count(ht_num) from home_tip where user_tbl_u_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_tbl_u_id);
			pageSet = pstmt.executeQuery();
			
			if(pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				pstmt.close();
			}
			
			if(page == 10) {
				if(dbCount % TeamBoard.pageSize == 0) {
					TeamBoard.pageCount = dbCount / TeamBoard.pageSize;
				}else {
					TeamBoard.pageCount = dbCount / TeamBoard.pageSize + 1;
				}
				
				if(pageNumber != null) {
					TeamBoard.pageNum = Integer.parseInt(pageNumber);
					absolutePage = (TeamBoard.pageNum-1) * TeamBoard.pageSize + 1;
				}
				
				sql="select * from home_tip where user_tbl_u_id=? order by ht_num desc";
				pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, user_tbl_u_id);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					rs.absolute(absolutePage);
					int count = 0;
					while (count < TeamBoard.pageSize) {
						TeamBoard Board=new TeamBoard();
						Board.setHt_num(rs.getInt(1));
						Board.setHt_title(rs.getString(2));
						Board.setHt_content(rs.getString(3));
						Board.setHt_date(rs.getTimestamp(4));
						Board.setHt_hit(rs.getInt(5));
						
						htList.add(Board);
						if(rs.isLast()) {
							break;
						}else {
							rs.next();
						}
						count++;
					}				
				}
			} else if(page == 5) {
				if(dbCount % TeamBoard.pageSize == 0) {
					TeamBoard.pageCount = dbCount / TeamBoard.pageSize;
				}else {
					TeamBoard.pageCount = dbCount / TeamBoard.pageSize + 1;
				}
				
				if(pageNumber != null) {
					TeamBoard.pageNum = Integer.parseInt(pageNumber);
					absolutePage = (TeamBoard.pageNum-1) * TeamBoard.pageSize + 1;
				}
				
				sql="select * from home_tip where user_tbl_u_id=? order by ht_num desc";
				pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, user_tbl_u_id);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					rs.absolute(absolutePage);
					int count = 0;
					while (count < TeamBoard.pageSize2) {
						TeamBoard Board=new TeamBoard();
						Board.setHt_num(rs.getInt(1));
						Board.setHt_title(rs.getString(2));
						Board.setHt_content(rs.getString(3));
						Board.setHt_date(rs.getTimestamp(4));
						Board.setHt_hit(rs.getInt(5));
						
						htList.add(Board);
						if(rs.isLast()) {
							break;
						}else {
							rs.next();
						}
						count++;
					}				
				}
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
		return htList;
	}
	
//	blDBBean쪽에 있음
//	public int inputlike(String u_id, int bl_num, String bl_title) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		String sql = "";
//		int re = -1;
//		
//		try {
//			con = getConnection();
//			sql = "update like_list set like_num=?, like_title=? where user_tbl_u_id = ?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, bl_num);
//			pstmt.setString(2, bl_title);
//			pstmt.setString(3, u_id);
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if(pstmt != null) pstmt.close();
//				if(con != null) con.close();
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
//		}
//		return re;
//	}
	
	public ArrayList<TeamBoard> likeListBoard(String user_tbl_u_id, String pageNumber, int page) {
		Connection con=null;
		Statement stmt=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ResultSet pageSet=null;
		int dbCount=0;
		int absolutePage=1;
		TeamBoard board=new TeamBoard();
		
		ArrayList<TeamBoard> likeList=new ArrayList<TeamBoard>();
		
		try {
			con = getConnection();
			String sql="select count(like_num) from like_list where user_tbl_u_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_tbl_u_id);
			pageSet = pstmt.executeQuery();
			if(pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				pstmt.close();
			}
			
			if(page == 10) {
				if(dbCount % TeamBoard.pageSize == 0) {
					TeamBoard.pageCount = dbCount / TeamBoard.pageSize;
				}else {
					TeamBoard.pageCount = dbCount / TeamBoard.pageSize + 1; //pageCount = 페이지 개수	
				}
				
				if(pageNumber != null) {
					TeamBoard.pageNum = Integer.parseInt(pageNumber);
					absolutePage = (TeamBoard.pageNum-1) * TeamBoard.pageSize + 1;
				}
				
				sql="select b.bl_num, b.bl_title, b.bl_like from bucket_list b, like_list l where b.bl_num = l.like_num and l.user_tbl_u_id=?";
				pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, user_tbl_u_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					rs.absolute(absolutePage);
					int count = 0;
					while (count < TeamBoard.pageSize) {
						TeamBoard Board=new TeamBoard();
						Board.setBl_num(rs.getInt(1));
						Board.setBl_title(rs.getString(2));
						Board.setBl_like(rs.getInt(3));
						
						likeList.add(Board);
						
						if(rs.isLast()) {
							break;
						}else {
							rs.next();
						}
						count++;
					}
				}
			} else if (page == 5) {
				if(dbCount % TeamBoard.pageSize2 == 0) {
					TeamBoard.pageCount = dbCount / TeamBoard.pageSize2;
				}else {
					TeamBoard.pageCount = dbCount / TeamBoard.pageSize2 + 1; //pageCount = 페이지 개수	
				}
				
				if(pageNumber != null) {
					TeamBoard.pageNum = Integer.parseInt(pageNumber);
					absolutePage = (TeamBoard.pageNum-1) * TeamBoard.pageSize2 + 1;
				}
				
				sql="select b.bl_num, b.bl_title, b.bl_like from bucket_list b, like_list l where b.bl_num = l.like_num and l.user_tbl_u_id=?";
				pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, user_tbl_u_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					rs.absolute(absolutePage);
					int count = 0;
					while (count < TeamBoard.pageSize2) {
						TeamBoard Board=new TeamBoard();
						Board.setBl_num(rs.getInt(1));
						Board.setBl_title(rs.getString(2));
						Board.setBl_like(rs.getInt(3));
						
						likeList.add(Board);
						
						if(rs.isLast()) {
							break;
						}else {
							rs.next();
						}
						count++;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return likeList;
	}
	
	public ArrayList<TeamBoard> commListBoard(String user_tbl_u_id, String pageNumber, int page) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ResultSet pageSet=null;
		int dbCount=0;
		int absolutePage=1;
		TeamBoard board=new TeamBoard();
		
		ArrayList<TeamBoard> commList=new ArrayList<TeamBoard>();
		
		try {
			con = getConnection();
			String sql="select count(comm_num) from comment_tbl where user_tbl_u_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_tbl_u_id);
			pageSet = pstmt.executeQuery();
			
			if(pageSet.next()) {
				dbCount = pageSet.getInt(1);
				pageSet.close();
				pstmt.close();
			}
			
			if(page == 10) {
				if(dbCount % TeamBoard.pageSize == 0) {
					TeamBoard.pageCount = dbCount / TeamBoard.pageSize;
				}else {
					TeamBoard.pageCount = dbCount / TeamBoard.pageSize + 1; //pageCount = 페이지 개수	
				}
				
				if(pageNumber != null) {
					TeamBoard.pageNum = Integer.parseInt(pageNumber);
					absolutePage = (TeamBoard.pageNum-1) * TeamBoard.pageSize + 1;
				}
				
				sql="select * from comment_tbl where user_tbl_u_id=?";
				pstmt = con.prepareCall(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, user_tbl_u_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					rs.absolute(absolutePage);
					int count = 0;		
					while (count < TeamBoard.pageSize) {
						TeamBoard Board=new TeamBoard();
						Board.setComm_num(rs.getInt(1));
						Board.setComm_table(rs.getString(2));
						Board.setComm_content(rs.getString(3));
						Board.setComm_table_num(rs.getInt(7));
						
						commList.add(Board);
						if(rs.isLast()) {
							break;
						}else {
							rs.next();
						}
						count++;
					}
				}
			} else if(page == 5) {
				if(dbCount % TeamBoard.pageSize2 == 0) {
					TeamBoard.pageCount = dbCount / TeamBoard.pageSize2;
				}else {
					TeamBoard.pageCount = dbCount / TeamBoard.pageSize2 + 1; //pageCount = 페이지 개수	
				}
				
				if(pageNumber != null) {
					TeamBoard.pageNum = Integer.parseInt(pageNumber);
					absolutePage = (TeamBoard.pageNum-1) * TeamBoard.pageSize2 + 1;
				}
				
				sql="select * from comment_tbl where user_tbl_u_id=?";
				pstmt = con.prepareCall(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, user_tbl_u_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					rs.absolute(absolutePage);
					int count = 0;		
					while (count < TeamBoard.pageSize2) {
						TeamBoard Board=new TeamBoard();
						Board.setComm_num(rs.getInt(1));
						Board.setComm_table(rs.getString(2));
						Board.setComm_content(rs.getString(3));
						
						commList.add(Board);
						if(rs.isLast()) {
							break;
						}else {
							rs.next();
						}
						count++;
					}
				}
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
		return commList;
	}
	
	public TeamBoard getBoard(String uid) {
		Connection con=null;
		PreparedStatement pstmtUp=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		TeamBoard board=null;
		
		try {
			con = getConnection();
			
			sql = "select * from user_tbl where u_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board = new TeamBoard();
				board.setU_id(rs.getString(1));
				board.setU_pwd(rs.getString(2));
				board.setU_name(rs.getString(3));
				board.setU_email(rs.getString(4));
				board.setU_phone(rs.getInt(5));
				board.setU_birth(rs.getInt(6));
				board.setU_sex(rs.getString(7));
				board.setU_manager(rs.getInt(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return board;
	}
	
	public int idDelete(String u_id, String u_pwd) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int result=-1;
		String pwd="";
		
		try {
			con = getConnection();
			sql = "select u_pwd from user_tbl where u_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(u_pwd)) {
					result=0;
				}else {
					/*--0521-박소은--*/
//					sql="delete user_tbl where u_id=?";
					sql="update user_tbl set u_delete = 'Y' where u_id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, u_id);
					pstmt.executeUpdate();
					result=1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	public int idDelete2(String mem_id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int result=-1;
		
		try {
			con = getConnection();
			/*--0521-박소은--*/
//			sql="delete user_tbl where u_id=?";
			sql="update user_tbl set u_delete = 'Y' where u_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.executeUpdate();
			result=1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	
	public int editID(String u_id, TeamBoard board, String u_pwd) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		String pwd="";
		
		try {
			con = getConnection();
			sql = "select u_pwd from user_tbl where u_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pwd = rs.getString(1);
				
				if (!pwd.equals(u_pwd)) {
					re=0;
				}else {
					sql="update user_tbl set u_name=?, u_email=?, u_phone=? where u_id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, HanConv.tokor(board.getU_name()));
					pstmt.setString(2, board.getU_email());
					pstmt.setInt(3, board.getU_phone());
					pstmt.setString(4, u_id);
					pstmt.executeUpdate();
					System.out.println("@@@@@@@@#########"+HanConv.tokor(board.getU_name())+" @#@@#"+board.getU_email()+"@#@#@#"+u_id);
					re=1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	public int memeditID(String mem_id, TeamBoard board) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;
		
		try {
			con = getConnection();
			sql="update user_tbl set u_name=?, u_email=?, u_phone=? where u_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, HanConv.tokor(board.getU_name()));
			pstmt.setString(2, board.getU_email());
			pstmt.setInt(3, board.getU_phone());
			pstmt.setString(4, mem_id);
			pstmt.executeUpdate();
			System.out.println("@@@@@@@@#########"+HanConv.tokor(board.getU_name())+" @#@@#"+board.getU_email()+"@#@#@#"+mem_id);
			re=1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}
	
	public int comment_count(int nf_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;
		
		try {
			con = getConnection();
			sql = "select count(*) from comment_tbl where comm_table='non_face' and table_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nf_num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return count;
	}
	public int comment_count2(int ht_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int count = 0;
		
		try {
			con = getConnection();
			sql = "select count(*) from comment_tbl where comm_table='home_tip' and table_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ht_num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return count;
	}
}
