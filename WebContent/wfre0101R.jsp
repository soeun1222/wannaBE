<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Resister</title>
    <link href="./css/style2.css" rel="stylesheet" type="text/css">
    <link href="./css/top.css" rel="stylesheet" type="text/css">
    <link href="./css/bucketlist.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="wfjs0101.js" charset="utf-8"></script>
    <style>
    input{
    	border: 0px;
    	background-color: #DCEBFF;
    	height:27px;
    }
    input:focus {
 		outline:1px solid rgb(31, 95, 212);	    
    }
    </style>
</head>
<body>
	<p class="bh-font font-size_50 font-center">
        <a href="wfmn0101R.jsp" style="text-decoration: none; color: rgb(31, 95, 212);">wannaBE���</a>
    </p><hr>
    
	<div class="re_center">   		
		<table class="re_padding">
			<form name="reg_frm" method="post" action="wfre0102R.jsp">
				<tr>
					<td colspan="2">
						<div class="bh-font font-size_50 font-center">
           					ȸ �� �� ��
      					</div>
					</td>
					<tr>
					</tr>
				</tr>
				<tr>
					<td colspan="2" align="right">'*' �׸��� �ʼ� �Է� �׸��Դϴ�.</td>
				</tr><tr><td></td></tr>
				<tr>
					<td>�� �� ��*</td>
						<td>
						<input name="u_id" size="30">
					</td>
				</tr>
				<tr>
					<td>��й�ȣ*</td>
					<td>
						<input name="u_pwd" type="password" size="30">
					</td>
				</tr>
				<tr>
					<td>��й�ȣ Ȯ��*</td>
					<td>
						<input name="pwd_check" type="password" size="30">
					</td>
				</tr>
				<tr>
					<td>��    ��*</td>
					<td>
						<input name="u_name" size="30">
					</td>
				</tr>
				<tr>
					<td>�̸���*</td>
					<td>
						<input name="u_email" size="30">
					</td>
				</tr>
				<tr>
					<td>�޴���ȭ*</td>
					<td>
						<input name="u_phone" size="30">
					</td>
				</tr>
				<tr>
					<td>�������*</td>
					<td>
						<input name="u_birth" size="30">
					</td>
				</tr>
				<tr>
					<td>����</td>
					<td>
						<input type="radio" name="u_sex" value="m" checked>��	&nbsp;&nbsp;
						<input type="radio" name="u_sex" value="f">��
					</td>
				</tr>
				<tr><td></td></tr>

				<tr>
					<td colspan="2" align="center">
						<input type="button" value="�� ��" class="re_submit" onclick="check_ok()">
						&nbsp;&nbsp;
						<input type="reset" value="�ٽ��Է�" class="re_submit">
						&nbsp;&nbsp;
						<input type="button" value="�α���" onclick="location.href='wflg0101R.jsp'" class="re_submit">
					</td>
				</tr>
				
			</form>
		</table>
	</div><br><br><br>
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
