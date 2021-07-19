package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import myUtil.HanConv;

public class WannaBeDB {
	private static WannaBeDB instance = new WannaBeDB();
	
	public static WannaBeDB getInstance() {
		return instance;
	}
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertMember(WannaBe member) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		/*--0521-박소은--*/
//		String sql = "insert into user_tbl values(?,?,?,?,?,?,?,?,?)";
		String sql = "insert into user_tbl values(?,?,?,?,?,?,?,?,?,?)";
		int re = -1;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getU_id());
			pstmt.setString(2, member.getU_pwd());
			pstmt.setString(3, HanConv.tokor(member.getU_name()));
			pstmt.setString(4, member.getU_email());
			pstmt.setInt(5, member.getU_phone());
			pstmt.setInt(6, member.getU_birth());
			pstmt.setString(7, member.getU_sex());
			pstmt.setInt(8, member.getU_manager());
			pstmt.setInt(9,member.getU_like());
			/*--0521-박소은--*/
			pstmt.setString(10, "N");
			
			pstmt.executeUpdate();
			re=1;
			
			pstmt.close();
			con.close();
			System.out.println("추가 성공");
		} catch (Exception e) {
			System.out.println("추가 실패");
			e.printStackTrace();
		}
		return re;
	}
	
	
	public String findId(String email) {
		  String id = null;
		  Connection con = null;
		  PreparedStatement pstmt = null;
		  ResultSet rs = null;

			try {
				con = getConnection();
				  String sql= "SELECT u_id FROM user_tbl WHERE u_email =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setNString(1, email);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					id = rs.getString("u_id");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(pstmt!=null) pstmt.close();
					if(rs!=null) rs.close();
					if(con!=null) con.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			return id;
			}

	public String findPwd(String id, String email){
		  String pwd = null;
		  Connection con = null;
		  PreparedStatement pstmt = null;
		  ResultSet rs = null;
		  
		  try{
			  con = getConnection();
			  String sql = "select u_pwd from user_tbl where u_id=? and u_email=?";
			  pstmt = con.prepareStatement(sql);
			  pstmt.setString(1,id);
			  pstmt.setString(2,email);
		
			  rs = pstmt.executeQuery();
		   
			  while(rs.next()){
				  pwd = rs.getString("u_pwd");
			  }
			  
			  rs.close();
			  pstmt.close();
			  con.close();
		  } catch(Exception e) {
			  e.printStackTrace();
		  }
		  return pwd;
		 }
	
	public int confirmID(String id) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select u_id from user_tbl where u_id=?";
		int re = -1;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				re=1;
			} else {
				re=-1;
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return re;
	}
	
	public int userCheck(String id, String pwd) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select u_pwd from user_tbl where u_id=?";
		String db_u_pwd;
		int re = -1;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				db_u_pwd = rs.getString("u_pwd");
				
				if (db_u_pwd.equals(pwd)) {
					re = 1;
				}else {
					re = 0;
				}
			} else {
				re = -1;
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
	public WannaBe getMember(String id) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		/*--0521-박소은--*/
//		String sql="select * from user_tbl where u_id=?";
		String sql="select * from user_tbl where u_id=? and u_delete = 'N'";
		WannaBe member = null;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new WannaBe();
				member.setU_id(rs.getString("u_id"));
				member.setU_pwd(rs.getString("u_pwd"));
				member.setU_name(rs.getString("u_name"));
				member.setU_email(rs.getString("u_email"));
				member.setU_phone(rs.getInt("u_phone"));
				member.setU_birth(rs.getInt("u_birth"));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
}
