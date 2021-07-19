package main_bucket;

import java.sql.Timestamp;

public class HomeTip {
	private int ht_num;
	private String ht_title;
	private String ht_content;
	private Timestamp ht_date;
	private int ht_hit;
	private String user_tbl_u_id;
	public int getHt_num() {
		return ht_num;
	}
	public void setHt_num(int ht_num) {
		this.ht_num = ht_num;
	}
	public String getHt_title() {
		return ht_title;
	}
	public void setHt_title(String ht_title) {
		this.ht_title = ht_title;
	}
	public String getHt_content() {
		return ht_content;
	}
	public void setHt_content(String ht_content) {
		this.ht_content = ht_content;
	}
	public Timestamp getHt_date() {
		return ht_date;
	}
	public void setHt_date(Timestamp ht_date) {
		this.ht_date = ht_date;
	}
	public int getHt_hit() {
		return ht_hit;
	}
	public void setHt_hit(int ht_hit) {
		this.ht_hit = ht_hit;
	}
	public String getUser_tbl_u_id() {
		return user_tbl_u_id;
	}
	public void setUser_tbl_u_id(String user_tbl_u_id) {
		this.user_tbl_u_id = user_tbl_u_id;
	}
	
	
	
}
