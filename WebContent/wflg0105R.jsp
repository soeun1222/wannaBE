<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>password</title>
    <link href="./css/style2.css" rel="stylesheet" type="text/css">
    <link href="./css/top.css" rel="stylesheet" type="text/css">
    <link href="./css/bucketlist.css" rel="stylesheet" type="text/css">
</head>
<body>
	<p class="bh-font font-size_50 font-center">
        <a href="wfmn0101R.jsp" style="text-decoration: none; color: rgb(31, 95, 212);">wannaBE대면</a>
    </p><hr>
	<form method="post" action="wflg0106R.jsp" name="reg_pwd">
	<div class="findcenter">
    <table align = "center">
    	<div class="bh-font font-size_45 font-center">비밀번호 찾기</div> <br><br>
    	<tr>	
			<td>
				<input type = "text" name ="u_id" placeholder="아이디" class="findbox">
			</td>
		</tr>
    	<tr>		
			<td>
				<input type = "text" name ="u_email" placeholder="이메일 " class="findbox">
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="찾기"  class="re_submit">
				<input type="button" value="이전화면"  class="re_submit" onclick="location.href='wflg0101R.jsp'">				
			</th>
		</tr>
	</table>
	</div>
	<br><br>
</form> 
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