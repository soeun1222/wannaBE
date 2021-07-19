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
	String u_pwd = null;
	if (request.getParameter("u_pwd") != null) {
		u_pwd = request.getParameter("u_pwd");
	}
	TeamBoardDBBean db = TeamBoardDBBean.getInstance();
	db.getBoard(u_id);
	System.out.println("!!!!!!!!!!!!!!!"+u_id);
	int re = db.editID(u_id, board, u_pwd);
	
	if(re==1){
		response.sendRedirect("wfmp0101R.jsp?u_id="+u_id);
		System.out.println("&&&&&&&&&&&&&7&&&&"+u_id);
	}else if(re==0){
%>
		<script language="JavaScript">
			alert("비밀번호가 맞지 않습니다");
			history.go(-1);
		</script>
<%
	}else if(re==-1){
%>
		<script language="JavaScript">
			alert("수정에 실패하였습니다.");
			history.go(-1);
		</script>		
<%		
	}
%>