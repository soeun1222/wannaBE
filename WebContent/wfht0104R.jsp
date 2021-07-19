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
	
	HtDBBean db = HtDBBean.getinstance();
	int re = db.deleteHtBoard(ht_num);
	
	if(re == 1) {
%>
		<script language="JavaScript">
			alert("삭제되었습니다.");
		</script>
<%
		response.sendRedirect("wfht0101R.jsp?u_id=" + u_id);
	} else if(re == -1) {
%>
		<script language="JavaScript">
			alert("삭제에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
	
%>