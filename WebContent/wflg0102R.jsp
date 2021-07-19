<%@page import="board.WannaBe"%>
<%@page import="board.WannaBeDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("u_id");
	String pwd = request.getParameter("u_pwd");
	WannaBeDB manager= WannaBeDB.getInstance();
	
	int check = manager.userCheck(id, pwd);
	WannaBe wb = manager.getMember(id);
	
	if(wb == null){
%>
		<script>
			alert("존재하지 않는 회원입니다.");
			history.go(-1);
		</script>
<%
	} else {
		String name = wb.getU_name();
		
		if(check == 1){
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("Member", "yes");
			response.sendRedirect("wfmn0101R.jsp?u_id=" + id);
		} else if(check == 0){
%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
<%
		} else {
%>
		<script>
			alert("아이디가 맞지 않습니다.");
			history.go(-1);
		</script>
<%
		}
	}
%>