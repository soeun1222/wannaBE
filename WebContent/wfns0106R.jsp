<%@page import="nonFace.NfDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String u_id = "";
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	} else {
		response.sendRedirect("wfns0101R.jsp");
	}
	
	int nf_num = 0;
	
	if (request.getParameter("nf_num") != null) {
		nf_num = Integer.parseInt(request.getParameter("nf_num"));
	}
	
	/*--pageNum�� �ޱ�--*/
	String pageNum = request.getParameter("pageNum");
	
	
	int comm_num = 0;
	
	if(request.getParameter("comm_num") != null) {
		comm_num = Integer.parseInt(request.getParameter("comm_num"));
	}
	
	NfDBBean db = NfDBBean.getinstance();
	int re = db.deleteComment(comm_num);
	
	if(re == 1) {
%>
		<script language="JavaScript">
			alert("����� �����Ǿ����ϴ�.");
		</script>
<%
		response.sendRedirect("wfns0105R.jsp?nf_num=" + nf_num + "&u_id=" +  u_id + "&pageNum=" + pageNum);
	} else if(re == -1) {
%>
		<script language="JavaScript">
			alert("��� ������ �����Ͽ����ϴ�.");
			history.go(-1);
		</script>
<%
	}
	
%>