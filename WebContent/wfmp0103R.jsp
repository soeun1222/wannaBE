<%@page import="team.TeamBoard"%>
<%@page import="team.TeamBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String u_id = null;
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	}
	TeamBoardDBBean db=TeamBoardDBBean.getInstance();
	TeamBoard board=db.getBoard(u_id);
	String u_pwd="";
	String u_name="";
	String u_email="";
	int u_phone=0;
	int u_birth=0;
	String u_sex="";
	int u_manager=9;
	
	if(board != null) {
		u_pwd = board.getU_pwd();
		u_name = board.getU_name();
		u_email = board.getU_email();
		u_phone = board.getU_phone();
		u_birth = board.getU_birth();
		u_sex = board.getU_sex();
		u_manager = board.getU_manager();
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript" src="team.js" charset="utf-8"></script>
    <link href="css/style2.css" rel="stylesheet" type="text/css">	
    <link href="css/stylemypage.css" rel="stylesheet" type="text/css">
    <style>
    	.tableenter{
    		height: 25px;
    	}
    </style>
</head>
<body>
    <header>
        <div class="main">
            <p><a href="wfmn0101R.jsp?u_id=<%= u_id %>">��������</a></p>
        </div>
        <div class="other">
            <p><a href="wflg0107R.jsp?u_id=<%= u_id %>">�α׾ƿ�</a></p>
            <p><a href="wfmp0101R.jsp?u_id=<%= u_id %>">����������</a></p>
        </div>
    </header>
    <div id="title">
        <p class="bh-font font-size_50 font-center font-color_main">�� �� �� �� ��</p>
    </div>
    <div>
        <hr>
            <div class="hellobar" align="center"><span class="spanhello"><%= u_name %></span> �� ! ���õ� �ູ�� �Ϸ� �Ǽ��� !</div> 
        <hr>
    </div>
    <div id="nav">
        <div class="menu">
            <ul class="myMenu">
                <li class="menu1">
                     <p><a href="#">�ڷγ� ��Ȳ</a></p>
                <ul class="menu1 submenu">
                    <li><p><a href="wfnw0101R.jsp?u_id=<%= u_id %>">�ڷγ�</a></p></li>
                </ul>
            </li>
            <li class="menu2">
                <p><a href="#">���� �� ��ȭ</a></p>
                <ul class="menu2 submenu">
                    <li><p><a href="wfnw0201R.jsp?u_id=<%= u_id %>">�ֽŴ���</a></p></li>
                    <li><p><a href="wfnw0301R.jsp?u_id=<%= u_id %>">��Ȱ �� ��ȭ</a></p></li>
                </ul>
            </li>
            <li class="menu3">
                <p><a href="#">�Խ���</a></p>
                <ul class="menu3 submenu">
                    <li><p><a href="wfns0101R.jsp?u_id=<%= u_id %>">���� �̾߱�</a></p></li>
                    <li><p><a href="wfht0101R.jsp?u_id=<%= u_id %>">���� ��TIP</a></p></li>
                    <li><p><a href="wfbl0101R.jsp?u_id=<%= u_id %>">��Ŷ����Ʈ</a></p></li>
                </ul>
            </li>
            <li class="menu4">
                <p><a href="wfmp0101R.jsp?u_id=<%= u_id %>">����������</a></p>
                <ul class="menu4 submenu">
                    <li><p><a href="wfmp0102R.jsp?u_id=<%= u_id %>">ȸ�� ����</a></p></li>
                    <li><p><a href="wfmp0104R.jsp?u_id=<%= u_id %>">���� �� ��</a></p></li>
                    <li><p><a href="wfmp0106R.jsp?u_id=<%= u_id %>">���� �� ���</a></p></li>
                    <li><p><a href="wfmp0103R.jsp?u_id=<%= u_id %>">ȸ�� Ż��</a></p></li>
                </ul>
            </li>
                <%
                	if (u_manager == 1) {
                %>
		                <li class="menu5">
		                	<p><a href="wfmp0108R.jsp?u_id=<%= u_id %>">������������</a></p>
		                	<ul class="menu5 submenu">
		                	</ul>
		                </li>   
               	<%	
                	}
                %>
            </ul>
            </div>
        </div>
        <div class="re_center">
       		<form action="remove_ok.jsp?u_id=<%= u_id %>" method="post" name="remove_frm">
		        <table class="re_padding">
					<tr>
						<td colspan="2">
							<div class="bh-font font-size_50 font-center">
	           					ȸ �� Ż ��
	      					</div>
						</td>
					</tr>
					<tr class="tableenter">
					</tr>
					<tr>
						<td colspan="2" align="right">'*' �׸��� �ʼ� �Է� �׸��Դϴ�.</td>
					</tr>
	        		<tr>
	        			<td>��й�ȣ*</td>
	        			<td><input type="password" name="u_pwd" size="30"></td>
	        		</tr>
	        		<tr>
	        			<td>��й�ȣȮ��*</td>
	        			<td><input type="password" name="pwd_check" size="30"></td>
	        		</tr>
	        		<tr class="tableenter">
					</tr>
	        		<tr>
	        			<td colspan="2" align="center">
		        			<input type="reset" value="�ٽ��Է�" class="submit">&nbsp;&nbsp;&nbsp;&nbsp;
		        			<input type="button" value="Ż���ϱ�" class="submit" onclick="remove_ok()">
	        			</td>	        			
	        		</tr>
		       	</table>
	        </form>
        </div>
        <br><br><br><br>
        <footer>
        <div>
            <span class="bh-font font-size_18 font-color_main">wannaBE���</span>
        </div>
        <p>Copyright &#x000A9; Non face to face community</p>
   		</footer>
</body>
</html>