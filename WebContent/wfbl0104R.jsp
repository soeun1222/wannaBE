<%@page import="bucketList.BlDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String u_id = "";
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	} else {
		response.sendRedirect("wfbl0101R.jsp");
	}
	
	int bl_num = 0;
	
	if (request.getParameter("bl_num") != null) {
		bl_num = Integer.parseInt(request.getParameter("bl_num"));
	}
	
	BlDBBean db = BlDBBean.getinstance();
	int re = db.deleteBlBoard(bl_num);
	
	if(re == 1) {
%>
		<script language="JavaScript">
			alert("�����Ǿ����ϴ�.");
		</script>
<%
		response.sendRedirect("wfbl0101R.jsp?u_id=" + u_id);
	} else if(re == -1) {
%>
		<script language="JavaScript">
			alert("������ �����Ͽ����ϴ�.");
			history.go(-1);
		</script>
<%
	}
	
%>