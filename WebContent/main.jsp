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
            <p><a href="main.html">��������</a></p>
        </div>
        <div class="other">
            <p><a href="login.html">�α���</a></p>
            <p><a href="#">ȸ������</a></p>
            <p><a href="#">����������</a></p>
        </div>
    </header>
    <div id="title">
        <p class="bh-font font-size_50 font-center font-color_main">wannaBE���</p>
    </div>

    <div id="nav">
        <div class="menu">
            <p><a href="wfns0101R.jsp?u_id=<%= u_id %>">���� �̾߱�</a></p>
            <p><a href="tip.html">���� ��TIP</a></p>
            <p><a href="#">�ֱ� ȯ�洺��</a></p>
            <p><a href="#">��� ��Ŷ����Ʈ</a></p>
        </div>
    </div>
</body>
</html>