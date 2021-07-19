<%@page import="homeTip.HtDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String u_id = "";
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	} else {
		response.sendRedirect("wfht0101R.jsp");
	}
	
	int ht_num = 0;
	
	if (request.getParameter("ht_num") != null) {
		ht_num = Integer.parseInt(request.getParameter("ht_num"));
	}
	
	/*--pageNum값 받기--*/
	String pageNum = request.getParameter("pageNum");
	
	
	int comm_num = 0;
	
	if(request.getParameter("comm_num") != null) {
		comm_num = Integer.parseInt(request.getParameter("comm_num"));
	}
	
	HtDBBean db = HtDBBean.getinstance();
	int re = db.deleteComment(comm_num);
	
	if(re == 1) {
%>
		<script language="JavaScript">
			alert("댓글이 삭제되었습니다.");
		</script>
<%
		response.sendRedirect("wfht0105R.jsp?ht_num=" + ht_num + "&u_id=" +  u_id + "&pageNum=" + pageNum);
	} else if(re == -1) {
%>
		<script language="JavaScript">
			alert("댓글 삭제에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
	
%>