package homeTip;

import java.sql.Timestamp;

public class HtBean {
	private int ht_num;
	private String ht_title;
	private String ht_content;
	private Timestamp ht_date;
	private int ht_hit;
	
	private String u_id;
	
	/*--페이징 처리 부분--*/
	public static int pageSize = 10;
	public static int pageCount = 1;
	public static int pageNum = 1;
	
	public static String pageNumber(int limit, String u_id) {
		String str = "";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		
		if((startPage - limit) > 0) {
			str = "<span class='butt'><a href='wfht0101R.jsp?u_id=" + u_id + "&pageNum=" + (startPage - 1) + "'><< <span class='font-size_13'>이전</span></a></span>&nbsp;&nbsp;";
		}
		
		for (int i = startPage; i < (startPage + limit); i++) {
			if(i == pageNum) {
				str += i + "&nbsp;&nbsp;";
			} else {
				str += "<a href='wfht0101R.jsp?u_id=" + u_id + "&pageNum=" + i + "'>" + i + "</a>&nbsp;&nbsp;";
			}
			
			if(i >= pageCount) {
				break;
			}
		}
		
		if((startPage + limit) <= pageCount) {
			str += "<span class='butt'><a href='wfht0101R.jsp?u_id=" + u_id + "&pageNum=" + (startPage + limit) + "'><span class='font-size_13'>다음</span> >></a></span>";
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

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
	
	
	
}
