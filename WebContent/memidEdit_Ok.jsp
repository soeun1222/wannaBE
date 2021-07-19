<%@page import="team.TeamBoard"%>
<%@page import="team.TeamBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="board" class="team.TeamBoard"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	String u_id = null;
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	}
	String mem_id = null;
	if (request.getParameter("mem_id") != null) {
		mem_id = request.getParameter("mem_id");
	}
	TeamBoardDBBean db = TeamBoardDBBean.getInstance();
	db.getBoard(mem_id);
	System.out.println("!!!!!!!!!!!!!!!"+u_id);
	System.out.println("!!!!!!!!!!!!!!!"+mem_id);
	int re = db.memeditID(mem_id, board);
	
	if(re==1){
		response.sendRedirect("wfmp0101R.jsp?u_id="+u_id);
		System.out.println("&&&&&&&&&&&&&7&&&&"+u_id);
	}else{
%>
		<script language="JavaScript">
			alert("수정에 실패하였습니다.");
			history.go(-1);
		</script>		
<%		
	}
%>