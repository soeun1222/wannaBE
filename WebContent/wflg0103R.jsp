<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ID</title>
    <link href="./css/style2.css" rel="stylesheet" type="text/css">
    <link href="./css/top.css" rel="stylesheet" type="text/css">
    <link href="./css/bucketlist.css" rel="stylesheet" type="text/css">
</head>
<body>
	<p class="bh-font font-size_50 font-center">
        <a href="wfmn0101R.jsp" style="text-decoration: none; color: rgb(31, 95, 212);">wannaBE대면</a>
    </p><hr>
	<form method="post" action="wflg0104R.jsp">
	<div class="findcenter">
    <table align = "center">
    	<p class="bh-font font-size_45 font-center">아이디 찾기</p>
    	<tr>			
			<td>
				<input type="text" name ="u_email" class="findbox" placeholder="이메일">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="찾기"  class="re_submit">
				<input type="button" value="이전화면"  class="re_submit" onclick="location.href='wflg0101R.jsp'">				
			</td>
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