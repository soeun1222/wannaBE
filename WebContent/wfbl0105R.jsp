<%@page import="bucketList.*"%>
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
	
	String bl_title = "";
	
	if (request.getParameter("bl_title") != null) {
		bl_title = request.getParameter("bl_title");
	}
	
	/*--pageNum�� �ޱ�--*/
	String pageNum = request.getParameter("pageNum");
	
	BlDBBean db = BlDBBean.getinstance();
	int re = db.likeBlBoard(bl_num);
	int re2 = db.inputlike(u_id, bl_num, bl_title);
	System.out.println("@#@#!#!@#!@#!@#!@##!@#"+bl_num);
	System.out.println("@#@#!#!@#!@#!@#!@##!@#"+re2);
	if(re == 1 && re2 == 1) {
		response.sendRedirect("wfbl0101R.jsp?bl_num=" + bl_num + "&u_id=" +  u_id + "&pageNum=" + pageNum);
	} else if(re == -1) {
%>
		<script language="JavaScript">
			alert("���ƿ信 �����Ͽ����ϴ�.");
			history.go(-1);
		</script>
<%
	}
	
%>