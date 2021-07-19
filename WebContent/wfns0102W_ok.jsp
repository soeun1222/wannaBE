<%@page import="nonFace.NfBean"%>
<%@page import="nonFace.NfDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="board" class="nonFace.NfBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	String u_id = request.getParameter("u_id");

	NfDBBean db = NfDBBean.getinstance();
	if(db.insertNfBoard(board, u_id) == 1) {
		response.sendRedirect("wfns0101R.jsp?u_id=" + u_id);
	} else {
		response.sendRedirect("wfns0102W.jsp?u_id=" + u_id);
	}
%>