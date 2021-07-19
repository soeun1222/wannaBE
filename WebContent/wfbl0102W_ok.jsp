<%@page import="bucketList.BlBean"%>
<%@page import="bucketList.BlDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="board" class="bucketList.BlBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	String u_id = request.getParameter("u_id");

	BlDBBean db = BlDBBean.getinstance();
	if(db.insertBlBoard(board, u_id) == 1) {
		response.sendRedirect("wfbl0101R.jsp?u_id=" + u_id);
	} else {
		response.sendRedirect("wfbl0102W.jsp?u_id=" + u_id);
	}
%>