<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		//String u_id = "user";
		String u_id = "user2";
		//String u_id = "manager";
	%>
	<header>
        <div class="main">
            <p><a href="main.html">메인으로</a></p>
        </div>
        <div class="other">
            <p><a href="login.html">로그인</a></p>
            <p><a href="#">회원가입</a></p>
            <p><a href="#">마이페이지</a></p>
        </div>
    </header>
    <div id="title">
        <p class="bh-font font-size_50 font-center font-color_main">wannaBE대면</p>
    </div>

    <div id="nav">
        <div class="menu">
            <p><a href="wfns0101R.jsp?u_id=<%= u_id %>">비대면 이야기</a></p>
            <p><a href="tip.html">집콕 꿀TIP</a></p>
            <p><a href="#">최근 환경뉴스</a></p>
            <p><a href="#">대면 버킷리스트</a></p>
        </div>
    </div>
</body>
</html>