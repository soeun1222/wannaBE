<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Login</title>
    <link href="./css/style2.css" rel="stylesheet" type="text/css">
    <link href="./css/top.css" rel="stylesheet" type="text/css">
    <link href="./css/bucketlist.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="wfjs0101.js" charset="utf-8"></script>
</head>
<body>
	<p class="bh-font font-size_50 font-center">
        <a href="wfmn0101R.jsp" style="text-decoration: none; color: rgb(31, 95, 212);">wannaBE���</a>
    </p>
        <hr>
    <div class="findcenter">
    	<div class="bh-font font-size_45 font-center">L  O  G  I  N</div><br><br>
        
		<form name="reg_frm" method="post" action="wflg0102R.jsp">
            <input type="text" placeholder="���̵�" class="box" name="u_id">
            <input type="password" placeholder="��й�ȣ" class="box" name="u_pwd">
            <input type="button" value="�α���" class="login-submit" onclick="login_ok()">
		</form>
      
        <div id="find2">
            <p><a href="wflg0103R.jsp"> ���̵�  ã�� </a></p>
            <p class="line"><a href="wflg0105R.jsp">��й�ȣ  ã��</a></p>
            <p><a href="javascript:window.location='wfre0101R.jsp'"> ȸ �� �� ��</a></p>
        </div>
    </div>
    <footer>
        <div id="footer">
            <div class="footer">
                <div>
                    <span class="bh-font font-size_18 font-color_main">wannaBE���</span>
                </div>
                <p>Copyright &#x000A9; Non face to face community</p>
            </div>
        </div>
    </footer>
</body>
</html>