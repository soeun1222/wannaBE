<%@page import="board.WannaBeDB"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("u_id");
	String email = request.getParameter("u_email");

	WannaBeDB wb = new WannaBeDB();
	String pwd = wb.findPwd(id, email);

	boolean check = pwd!=null;
	String mesg= check ? "비밀번호는 "+pwd+" 입니다." : "잘못된 정보입니다.";
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Login</title>
    <link href="./css/style2.css" rel="stylesheet" type="text/css">
    <link href="./css/top.css" rel="stylesheet" type="text/css">
    <link href="./css/bucketlist.css" rel="stylesheet" type="text/css">
</head>
	<body><br><br>
	<p class="bh-font font-size_50 font-center">
        <a href="wfmn0101R.jsp" style="text-decoration: none; color: rgb(31, 95, 212);">wannaBE대면</a>
    </p><hr>
		<div class="findid">
			<div class="bh-font font-size_45"><%=mesg%></div>
			<br>
				<%
		if(mesg.equals("잘못된 정보입니다.")) {
	%>	
			
			<input type="button" value="회원가입"  class="re_submit" onclick="location.href='wfre0101R.jsp'">	
			<input type="button" value="이전화면"  class="re_submit" onclick="location.href='wflg0105R.jsp'">
				
	<%
		} else {
	%>		
			<input type="button" value="로그인"  class="re_submit2" onclick="location.href='wflg0101R.jsp'">	
	<%
		}
	%>
	</div><br><br><br><br><br><br>
	 <footer>
        <div id="footer">
            <div class="footer">
                <div>
                    <span class="bh-font font-size_18 font-color_main">wannaBE대면</span>
                </div>
                <p>Copyright &#x000A9; Non face to face community</p>
            </div>
        </div>
    </footer>
</body>
</html>