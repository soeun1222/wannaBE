<%@page import="team.TeamBoard"%>
<%@page import="team.TeamBoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String u_id = null;
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	}
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
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
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <link href="css/style2.css" rel="stylesheet" type="text/css">
	<style>
		/* 메뉴바 */
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
        
        .bb{
        	padding-top: 250px;
        	padding-bottom: 250px;
        	padding-left: 270px;
        }
        .ff{
        	width: 200px;
        	height: 100px;
        	border: none;
            background: rgb(31, 95, 212) ;
        	border-radius: 0.2em;
            color: white;
        	font-size: 23px;
        }
        .ff:hover {
            background-color: rgb(79, 128, 221) ;
            transition: 0.3s;
		}
        .gg{
        	width: 200px;
        	height: 100px;
        	border: none;
            background: rgb(31, 95, 212) ;
        	border-radius: 0.2em;
            color: white;
        	font-size: 23px;
        }
        .gg:hover {
            background-color: rgb(79, 128, 221) ;
            transition: 0.3s;
		}
	</style>
</head>
<body>
    <header>
        <div class="main">
            <p><a href="wfmn0101R.jsp?u_id=<%= u_id %>">메인으로</a></p>
        </div>
        <div class="other">
            <p><a href="wflg0107R.jsp?u_id=<%= u_id %>">로그아웃</a></p>
            <p><a href="wfmp0101R.jsp?u_id=<%= u_id %>">마이페이지</a></p>
        </div>
    </header>
    <div id="title">
        <p class="bh-font font-size_50 font-center font-color_main">마 이 페 이 지</p>
    </div>
    <div>
        <hr>
            <div class="hellobar" align="center"><span class="spanhello"><%= u_name %></span> 님 ! 오늘도 행복한 하루 되세요 !</div> 
        <hr>
    </div>
    <div id="nav">
        <div class="menu">
            <ul class="myMenu">
                <li class="menu1">
                     <p><a href="#">코로나 현황</a></p>
                <ul class="menu1 submenu">
                    <li><p><a href="wfnw0101R.jsp?u_id=<%= u_id %>">코로나</a></p></li>
                </ul>
            </li>
            <li class="menu2">
                <p><a href="#">뉴스 및 문화</a></p>
                <ul class="menu2 submenu">
                    <li><p><a href="wfnw0201R.jsp?u_id=<%= u_id %>">최신뉴스</a></p></li>
                    <li><p><a href="wfnw0301R.jsp?u_id=<%= u_id %>">생활 및 문화</a></p></li>
                </ul>
            </li>
            <li class="menu3">
                <p><a href="#">게시판</a></p>
                <ul class="menu3 submenu">
                    <li><p><a href="wfns0101R.jsp?u_id=<%= u_id %>">비대면 이야기</a></p></li>
                    <li><p><a href="wfht0101R.jsp?u_id=<%= u_id %>">집콕 꿀TIP</a></p></li>
                    <li><p><a href="wfbl0101R.jsp?u_id=<%= u_id %>">버킷리스트</a></p></li>
                </ul>
            </li>
            <li class="menu4">
                <p><a href="wfmp0101R.jsp?u_id=<%= u_id %>">마이페이지</a></p>
                <ul class="menu4 submenu">
                    <li><p><a href="wfmp0102R.jsp?u_id=<%= u_id %>">회원 정보</a></p></li>
                    <li><p><a href="wfmp0104R.jsp?u_id=<%= u_id %>">비대면 이야기</a></p></li>
                    <li><p><a href="wfmp0105R.jsp?u_id=<%= u_id %>">집콕 꿀TIP</a></p></li>
                    <li><p><a href="wfmp0106R.jsp?u_id=<%= u_id %>">좋아요!!</a></p></li>
                    <li><p><a href="wfmp0107R.jsp?u_id=<%= u_id %>">내가 쓴 댓글</a></p></li>
                    <li><p><a href="wfmp0103R.jsp?u_id=<%= u_id %>">회원 탈퇴</a></p></li>
                </ul>
            </li>
                <%
                	if (u_manager == 1) {
                %>
		                <li class="menu5">
		                	<p><a href="wfmp0108R.jsp?u_id=<%= u_id %>">관리자페이지</a></p>
		                	<ul class="menu5 submenu">
		                	</ul>
		                </li>   
               	<%	
                	}
                %>
            </ul>
            </div>
        </div>
	<div class="bb">
	<input type="button" value="회원 정보 수정" class="ff" onclick="location.href='wfmp0201R.jsp?u_id=<%= u_id %>'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="회원 정보 삭제" class="ff" onclick="location.href='wfmp0204R.jsp?u_id=<%= u_id %>'">
	</div>
	<footer>
        <div>
            <span class="bh-font font-size_18 font-color_main">wannaBE대면</span>
        </div>
        <p>Copyright &#x000A9; Non face to face community</p>
    </footer>
</body>
</html>