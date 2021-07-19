<%@page import="team.TeamBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String u_id = null;
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	}
	String u_pwd = null;
	if (request.getParameter("u_pwd") != null) {
		u_pwd = request.getParameter("u_pwd");
	}
	TeamBoardDBBean db=TeamBoardDBBean.getInstance();
	db.getBoard(u_id);
	System.out.println("AAAAAAAASSSSSSSS"+u_id);
	int re = db.idDelete(u_id, u_pwd);
	
	if(re==1){
%>
		<script language="JavaScript">
			alert("탈퇴 되었습니다.");
		</script>
<%		//메인페이지로
		session.invalidate();
		response.sendRedirect("wfmn0101R.jsp");
	}else if(re==0){
%>
		<script language="JavaScript">
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
<%
	}else if(re==-1){
%>
		<script language="JavaScript">
			alert("삭제에 실패하였습니다.");
			history.go(-1);
		</script>
<%
		
	}
%>