<%@page import="homeTip.HtBean"%>
<%@page import="homeTip.HtDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="board" class="homeTip.HtBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	String u_id = request.getParameter("u_id");

	HtDBBean db = HtDBBean.getinstance();
	if(db.insertHtBoard(board, u_id) == 1) {
		response.sendRedirect("wfht0101R.jsp?u_id=" + u_id);
	} else {
		response.sendRedirect("wfht0102W.jsp?u_id=" + u_id);
	}
%>