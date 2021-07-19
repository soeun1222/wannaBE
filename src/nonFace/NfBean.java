package nonFace;

import java.sql.Timestamp;

public class NfBean {
	private int nf_num;
	private String nf_title;
	private String nf_content;
	private Timestamp nf_date;
	private int nf_hit;
	
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
			str = "<span class='butt'><a href='wfns0101R.jsp?u_id=" + u_id + "&pageNum=" + (startPage - 1) + "'><< <span class='font-size_13'>이전</span></a></span>&nbsp;&nbsp;";
		}
		
		for (int i = startPage; i < (startPage + limit); i++) {
			if(i == pageNum) {
				str += i + "&nbsp;&nbsp;";
			} else {
				str += "<a href='wfns0101R.jsp?u_id=" + u_id + "&pageNum=" + i + "'>" + i + "</a>&nbsp;&nbsp;";
			}
			
			if(i >= pageCount) {
				break;
			}
		}
		
		if((startPage + limit) <= pageCount) {
			str += "<span class='butt'><a href='wfns0101R.jsp?u_id=" + u_id + "&pageNum=" + (startPage + limit) + "'><span class='font-size_13'>다음</span> >></a></span>";
		}
		
		return str;
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
	
	
}
