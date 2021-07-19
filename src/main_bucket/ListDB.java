package main_bucket;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class ListDB {
private static ListDB instance=new ListDB();
	
	public static ListDB getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx=new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public ArrayList<Bucket> listBucket(){
		Connection con=null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql ="";
		
		ArrayList<Bucket> bucketList = new ArrayList<Bucket>();
		
		try {
			con = getConnection();
			stmt = con.createStatement();
			sql = "select * from bucket_list order by bl_like desc";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
			
					Bucket bucket = new Bucket();
					
					bucket.setBl_num(rs.getInt(1));
					bucket.setBl_title(rs.getString(2));
					bucket.setBl_like(rs.getInt(3));
					bucket.setUser_tbl_u_id(rs.getString(4));
					
					bucketList.add(bucket);
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs!= null) {
					rs.close();
				}
				if (stmt!= null) {
					stmt.close();
				}
				if (con!= null) {
					con.close();
				}
			} catch (Exception e2) {
				 e2.printStackTrace();
			}
		}
		
		return bucketList;
	}
	
	
	public ArrayList<NonFace> listNonFace(){
		Connection con=null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql ="";
		
		ArrayList<NonFace> nonfaceList = new ArrayList<NonFace>();
		
		try {
			con = getConnection();
			stmt = con.createStatement();
			sql = "select * from non_face order by nf_num desc";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				
				NonFace nonface = new NonFace();
				
				nonface.setNf_num(rs.getInt(1));
				nonface.setNf_title(rs.getString(2));
				nonface.setNf_content(rs.getString(3));
				nonface.setNf_date(rs.getTimestamp(4));
				nonface.setNf_hit(rs.getInt(5));
				nonface.setUser_tbl_u_id(rs.getString(6));
				
				nonfaceList.add(nonface);
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs!= null) {
					rs.close();
				}
				if (stmt!= null) {
					stmt.close();
				}
				if (con!= null) {
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return nonfaceList;
	}
	
	public ArrayList<HomeTip> listHomeTip(){
		Connection con=null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql ="";
		
		ArrayList<HomeTip> hometipList = new ArrayList<HomeTip>();
		
		try {
			con = getConnection();
			stmt = con.createStatement();
			sql = "select * from home_tip order by ht_num desc";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				
				HomeTip HomeTip = new HomeTip();
				
				HomeTip.setHt_num(rs.getInt(1));
				HomeTip.setHt_title(rs.getString(2));
				HomeTip.setHt_content(rs.getString(3));
				HomeTip.setHt_date(rs.getTimestamp(4));
				HomeTip.setHt_hit(rs.getInt(5));
				HomeTip.setUser_tbl_u_id(rs.getString(6));
				
				hometipList.add(HomeTip);
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs!= null) {
					rs.close();
				}
				if (stmt!= null) {
					stmt.close();
				}
				if (con!= null) {
					con.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return hometipList;
	}
	
//	public int comment() {
//		
//	}
	
	
}
