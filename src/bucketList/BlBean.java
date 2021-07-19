package bucketList;

import java.sql.Timestamp;

public class BlBean {
	private int bl_num;
	private String bl_title;
	private int bl_like;
	
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
			str = "<span class='butt'><a href='wfbl0101R.jsp?u_id=" + u_id + "&pageNum=" + (startPage - 1) + "'><< <span class='font-size_13'>이전</span></a></span>&nbsp;&nbsp;";
		}
		
		for (int i = startPage; i < (startPage + limit); i++) {
			if(i == pageNum) {
				str += i + "&nbsp;&nbsp;";
			} else {
				str += "<a href='wfbl0101R.jsp?u_id=" + u_id + "&pageNum=" + i + "'>" + i + "</a>&nbsp;&nbsp;";
			}
			
			if(i >= pageCount) {
				break;
			}
		}
		
		if((startPage + limit) <= pageCount) {
			str += "<span class='butt'><a href='wfbl0101R.jsp?u_id=" + u_id + "&pageNum=" + (startPage + limit) + "'><span class='font-size_13'>다음</span> >></a></span>";
		}
		
		return str;
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

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
	
}
