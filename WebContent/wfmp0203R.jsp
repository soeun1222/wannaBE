<%@page import="java.util.ArrayList"%>
<%@page import="team.TeamBoardDBBean"%>
<%@page import="team.TeamBoard"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	String u_id = null;
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	}
	String mem_id = null;
	if (request.getParameter("chk") != null) {
		mem_id = request.getParameter("chk");
	}
	System.out.println("******************"+mem_id);
	System.out.println("******************"+u_id);
	TeamBoardDBBean db = TeamBoardDBBean.getInstance();
	TeamBoard board = db.getBoard(u_id);
	
	String u_pwd="";
	String u_name="";
	String u_email="";
	int u_phone=0;
	int u_birth=0;
	String u_sex="";
	int u_manager=9;
	
	String mem_pwd="";
	String mem_name="";
	String mem_email="";
	int mem_phone=0;
	int mem_birth=0;
	String mem_sex="";
	int mem_manager=9;
	
	if(board != null) {
		u_pwd = board.getU_pwd();
		u_name = board.getU_name();
		u_email = board.getU_email();
		u_phone = board.getU_phone();
		u_birth = board.getU_birth();
		u_sex = board.getU_sex();
		u_manager = board.getU_manager();
	}
	board = db.getBoard(mem_id);
	if(board != null){
		mem_pwd = board.getU_pwd();
		mem_name = board.getU_name();
		mem_email = board.getU_email();
		mem_phone = board.getU_phone();
		mem_birth = board.getU_birth();
		mem_sex = board.getU_sex();
		mem_manager = board.getU_manager();
	}
	System.out.println("******************"+u_name);
	System.out.println("******************"+mem_id);
	System.out.println("******************"+u_id);
	
	
	
	// -----------------------------------------------
	// 삭제 폼!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	String[] member_id = null;
	if (request.getParameterValues("chk") != null) {
		member_id = request.getParameterValues("chk");
	}
	int re = -1;
	for(int i=0;i<member_id.length;i++){
		System.out.println(member_id[i]);
	}
	for(int i=0;i<member_id.length;i++){
		re = db.idDelete2(member_id[i]);
	}
	
	if(re==1){
%>
		<script>
			alert("탈퇴 완료되었습니다.");
		</script>
<%
		response.sendRedirect("wfmp0108R.jsp?u_id="+u_id);	
	}else if(re==-1){
%>
		<script>
			alert("삭제에 실패하였습니다.");
			history.go(-1);
		</script>
<%	
	}
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>