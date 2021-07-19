package main_bucket;

import java.sql.Timestamp;

public class NonFace {
	private int nf_num;
	private String nf_title;
	private String nf_content;
	private Timestamp nf_date;
	private int nf_hit;
	private String user_tbl_u_id;
	public int getNf_num() {
		return nf_num;
	}
	public void setNf_num(int nf_num) {
		this.nf_num = nf_num;
	}
	public String getNf_title() {
		return nf_title;
	}
	public void setNf_title(String nf_title) {
		this.nf_title = nf_title;
	}
	public String getNf_content() {
		return nf_content;
	}
	public void setNf_content(String nf_content) {
		this.nf_content = nf_content;
	}
	public Timestamp getNf_date() {
		return nf_date;
	}
	public void setNf_date(Timestamp nf_date) {
		this.nf_date = nf_date;
	}
	public int getNf_hit() {
		return nf_hit;
	}
	public void setNf_hit(int nf_hit) {
		this.nf_hit = nf_hit;
	}
	public String getUser_tbl_u_id() {
		return user_tbl_u_id;
	}
	public void setUser_tbl_u_id(String user_tbl_u_id) {
		this.user_tbl_u_id = user_tbl_u_id;
	}
	
	
}
