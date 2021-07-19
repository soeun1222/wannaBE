<%@page import="bucketList.BlDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="board" class="bucketList.BlBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
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
	int re = db.editBlBoard(board);
	
	if (re == 1) {
		response.sendRedirect("wfbl0101R.jsp?u_id=" + u_id);
	} else if (re == -1) {
%>
		<script language="JavaScript">
			alert("글 수정에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
	
%>