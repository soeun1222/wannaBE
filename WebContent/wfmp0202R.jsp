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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Document</title>
    <link href="css/style2.css" rel="stylesheet" type="text/css">
	<style>
		/* �޴��� */
        #nav {
            height: 50px;
            border-top: 1.5px solid rgb(192, 192, 192);
            border-bottom: 1px solid #666;
            padding: 0 50px 0 50px;
        }

        .menu {
            width: 900px;
            margin: 0 auto;
        }

        .menu p {
            width: 120px;
            text-align: center;
            display: inline-block;
        }
        ul p{
            width: 120px;
            text-align: center;
            display: inline-block;
        }

        .menu p a {
            font-weight: bold;
            font-size: 15px;
            color: #444;
            text-decoration: none;
        }
        ul p a {
            font-weight: bold;
            font-size: 15px;
            color: #444;
            text-decoration: none;
        }

        .menu p a:hover {
            font-size: 16px;
            font-weight: bolder;
            color:  rgb(31, 95, 212);
            transition: 0.3s;
        }
        ul li p a:hover {
            font-size: 16px;
            font-weight: bolder;
            color:  rgb(31, 95, 212);
            transition: 0.3s;
        }
        ul, li {
            list-style:none;
            margin:0;
            padding:0;
        }
        ul.myMenu {
        }
        ul.myMenu > li {
            display:inline-block;
            width:110px;
            padding:0 10px;
            /* background:rgb(118, 163, 248); */
            /* border:1px solid rgb(118, 163, 248); */
            position:relative;
            margin-left: 50px;
        }
        ul.myMenu > li:hover {
            /* background:#fff; */
        }
        ul.myMenu > li ul.submenu {
            display:none;
            position:absolute;
            /* top:30px; */
            /* left:20px; */
        }
        ul.myMenu > li:hover ul.submenu {
            display:block;
        }
        ul.myMenu > li ul.submenu > li {
            display:inline-block;
            width:110px;
            padding:0 10px;
            background:rgb(245, 248, 255);
            border:1px solid rgb(245, 248, 255);
            border-radius: 13px;
            /* text-align:center; */
        }
        ul.myMenu > li ul.submenu > li:hover {
            background:#fff;
        }
        a {
            text-decoration: none;
            color: black;
        }
        .menu{
        	margin-left: 50px;
        	width: auto;
        }
		/*------ footer ------*/

        footer {
            width: 1080px;
            margin-top : 20px;
            background-color: rgb(243, 243, 243);
        }

        footer a {
            text-decoration: none;
            color: #444;
        }

        footer p {
            text-align: center;
            font-size: 13px;
            color: #666;
            padding-bottom: 20px;
        }

        footer div {
            padding: 5px 20px;
            border-top: 2px solid #555;
            border-bottom: 1px solid #333;
        }

        footer div span:nth-child(2) {
            float: right;
        }

        footer div span a {
            font-size: 13px;
            font-weight: bold;
            letter-spacing: -1px;
        }

        footer div span a:hover {
            color: rgb(31, 95, 212);
        }

        footer div span a span {
            font-size: 15px;
            font-weight: bolder;
        }
        /*------ else ------*/
        span {
        	color: red;
        }
        .td_content {
        }
        .spanhello{
        	color: blue;
        }
        .hellobar{
            font-family: 'Nanum Gothic', sans-serif;
            font-weight: 500;
        	font-size: 16px;
            color: rgb(44, 44, 44);
        	background-color: rgb(243, 243, 243);
        }
        .tableenter{
        	height: 10px
        }
	</style>
    <script type="text/javascript" src="team.js" charset="utf-8"></script>
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
                    <li><p><a href="wfmp0104R.jsp?u_id=<%= u_id %>">���� �̾߱�</a></p></li>
                    <li><p><a href="wfmp0105R.jsp?u_id=<%= u_id %>">���� ��TIP</a></p></li>
                    <li><p><a href="wfmp0106R.jsp?u_id=<%= u_id %>">���ƿ�!!</a></p></li>
                    <li><p><a href="wfmp0107R.jsp?u_id=<%= u_id %>">���� �� ���</a></p></li>
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
		<form name="memedit_frm" method="post" action="memidEdit_Ok.jsp?u_id=<%= u_id %>&mem_id=<%= mem_id %>">
			<table class="re_padding">
				<tr>
					<td colspan="2">
						<div class="bh-font font-size_50 font-center">
           					ȸ �� �� �� �� ��
      					</div>
					</td>
				</tr>
				<tr class="tableenter">
				</tr>
				<tr>
					<td colspan="2" align="right">'*' �׸��� �ʼ� �Է� �׸��Դϴ�.</td>
				</tr>
				<tr>
					<td>�� �� ��*</td>
					<td>
						<%= mem_id %>
					</td>
				</tr>
				<tr>
					<td>��    ��*</td>
					<td>
						<input name="u_name" size="30" value="<%= mem_name %>">
					</td>
				</tr>
				<tr>
					<td>�̸���*</td>
					<td>
						<input name="u_email" size="30" value="<%= mem_email %>">
					</td>
				</tr>
				<tr>
					<td>�޴���ȭ*</td>
					<td>
						<input name="u_phone" size="30" value="<%= mem_phone %>">
					</td>
				</tr>
				<tr>
					<td>�������*</td>
					<td>
						<%= mem_birth %>
					</td>
				</tr>
				<tr>
					<td>����</td>
					<td>
						<%= mem_sex %>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="�����ϱ�" class="re_submit" onclick="memidedit_ok()">
						&nbsp;&nbsp;&nbsp;
						<input type="reset" value="�ٽ��Է�" class="re_submit">
						&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</form>
		<br><br><br><br><br>
	</div>
	<footer>
        <div>
            <span class="bh-font font-size_18 font-color_main">wannaBE���</span>
        </div>
        <p>Copyright &#x000A9; Non face to face community</p>
    </footer>
</body>
</html>