package team;

import java.sql.Timestamp;

public class TeamBoard {
	private String u_id;
	private String u_pwd;
	private String u_name;
	private String u_email;
	private int u_phone;
	private int u_birth;
	private String u_sex;
	private int u_manager;
	private int u_like;

	private int nf_num;
	private String nf_title;
	private String nf_content;
	private Timestamp nf_date;
	private int nf_hit;
	
	private int ht_num;
	private String ht_title;
	private String ht_content;
	private Timestamp ht_date;
	private int ht_hit;
	
	private int comm_num;
	private String comm_table;
	private String comm_content;
	private int comm_ref;
	private int comm_step;
	private int comm_level;
	private int comm_table_num;
	
	private int bl_num;
	private String bl_title;
	private int bl_like;
	private int like_num;
	
	public static int pageSize2 = 5;
	public static int pageSize = 10;
	public static int pageCount = 1;
	public static int pageCount2 = 1;
	public static int pageNum = 1;
	public static int pageNum2 = 1;
	
	
	public int getComm_table_num() {
		return comm_table_num;
	}
	public void setComm_table_num(int comm_table_num) {
		this.comm_table_num = comm_table_num;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public int getU_like() {
		return u_like;
	}
	public void setU_like(int u_like) {
		this.u_like = u_like;
	}
	public String getU_sex() {
		return u_sex;
	}
	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}
	public static String pageNumber(String u_id, int limit) {
		String str="";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		
//여기 list.jsp 구현해야함 바꿔서구현 u_id 매개변수 추가해서 유지시켜줘야함
		if((startPage - limit) > 0) {
			str="<a href='wfmp0104R.jsp?u_id=" + u_id + "&pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;";
		}
		
		for (int i = startPage; i < startPage+limit; i++) {
			if (i == pageNum) {
				str+="["+i+"]&nbsp;&nbsp;";
			} else {
				str+="<a href='wfmp0104R.jsp?u_id=" + u_id +"&pageNum="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			
			if (i >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='wfmp0104R.jsp?u_id=" + u_id + "&pageNum="+(startPage+limit)+"'>[다음]</a>";
		}
		
		return str;
	}
	
	public static String pageNumber2(String u_id, int limit) {
		String str="";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		if((startPage - limit) > 0) {
			str="<a href='wfmp0105R.jsp?u_id=" + u_id + "&pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;";
		}
		
		for (int j = startPage; j < startPage+limit; j++) {
			if (j == pageNum) {
				str+="["+j+"]&nbsp;&nbsp;";
			} else {
				str+="<a href='wfmp0105R.jsp?u_id=" + u_id +"&pageNum="+j+"'>["+j+"]</a>&nbsp;&nbsp;";
			}
			
			if (j >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='wfmp0105R.jsp?u_id=" + u_id + "&pageNum="+(startPage+limit)+"'>[다음]</a>";
		}
		
		return str;
	}
	public static String pageNumber3(String u_id, int limit) {
		String str="";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		if((startPage - limit) > 0) {
			str="<a href='wfmp0107R.jsp?u_id=" + u_id + "&pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;";
		}
		
		for (int j = startPage; j < startPage+limit; j++) {
			if (j == pageNum) {
				str+="["+j+"]&nbsp;&nbsp;";
			} else {
				str+="<a href='wfmp0107R.jsp?u_id=" + u_id +"&pageNum="+j+"'>["+j+"]</a>&nbsp;&nbsp;";
			}
			
			if (j >= pageCount) {
				break;
			}
		}
		
		if ((startPage + limit) <= pageCount) {
			str += "<a href='wfmp0107R.jsp?u_id=" + u_id + "&pageNum="+(startPage+limit)+"'>[다음]</a>";
		}
		
		return str;
	}
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
	public int getComm_num() {
		return comm_num;
	}
	public void setComm_num(int comm_num) {
		this.comm_num = comm_num;
	}
	public String getComm_table() {
		return comm_table;
	}
	public void setComm_table(String comm_table) {
		this.comm_table = comm_table;
	}
	public String getComm_content() {
		return comm_content;
	}
	public void setComm_content(String comm_content) {
		this.comm_content = comm_content;
	}
	public int getComm_ref() {
		return comm_ref;
	}
	public void setComm_ref(int comm_ref) {
		this.comm_ref = comm_ref;
	}
	public int getComm_step() {
		return comm_step;
	}
	public void setComm_step(int comm_step) {
		this.comm_step = comm_step;
	}
	public int getComm_level() {
		return comm_level;
	}
	public void setComm_level(int comm_level) {
		this.comm_level = comm_level;
	}
	public int getBl_num() {
		return bl_num;
	}
	public void setBl_num(int bl_num) {
		this.bl_num = bl_num;
	}
	public String getBl_title() {
		return bl_title;
	}
	public void setBl_title(String bl_title) {
		this.bl_title = bl_title;
	}
	public int getBl_like() {
		return bl_like;
	}
	public void setBl_like(int bl_like) {
		this.bl_like = bl_like;
	}
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
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pwd() {
		return u_pwd;
	}
	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public int getU_phone() {
		return u_phone;
	}
	public void setU_phone(int u_phone) {
		this.u_phone = u_phone;
	}
	public int getU_birth() {
		return u_birth;
	}
	public void setU_birth(int u_birth) {
		this.u_birth = u_birth;
	}
	public int getU_manager() {
		return u_manager;
	}
	public void setU_manager(int u_manager) {
		this.u_manager = u_manager;
	}
}
