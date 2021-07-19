<%@page import="nonFace.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="team.TeamBoard"%>
<%@page import="team.TeamBoardDBBean"%>
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
	if(u_id.isEmpty()){
%>
		<script type="text/javascript">
			alert("로그인을 해주세요.");
			history.go(location.href='wflg0101R.jsp');
		</script>
<%
	}
	TeamBoardDBBean db=TeamBoardDBBean.getInstance();
	TeamBoard board=db.getBoard(u_id);
	System.out.println("@@@@@@@@@@###########"+u_id);
	String u_pwd="";
	String u_name="";
	String u_email="";
	int u_phone=0;
	int u_birth=0;
	String u_sex="";
	int u_manager=9;
	int nf_num=0, ht_num=0, comm_table_num=0;
	
	String nf_title="", ht_title="";
	String nf_content="";
	String bl_content="";
	String ht_content="";
	String comm_content="";
	String comm_table="";
	if(board != null){
		nf_num=board.getNf_num();
		ht_num=board.getHt_num();
		nf_content=board.getNf_content();
		bl_content=board.getHt_content();
		ht_content=board.getHt_content();
		comm_table=board.getComm_table();
		comm_content=board.getComm_content();
		comm_table_num=board.getComm_table_num();
	}
	
	if(board != null) {
		u_id = board.getU_id();
		u_pwd = board.getU_pwd();
		u_name = board.getU_name();
		u_email = board.getU_email();
		u_phone = board.getU_phone();
		u_birth = board.getU_birth();
		u_sex = board.getU_sex();
		u_manager = board.getU_manager();
	}
	System.out.println("@@@@@@@@@@###################@"+u_pwd);
	ArrayList<TeamBoard> list1=db.nfListBoard(u_id, pageNum,5);
	ArrayList<TeamBoard> list3=db.htListBoard(u_id, pageNum, 5);
	ArrayList<TeamBoard> list4=db.commListBoard(u_id, pageNum,5);
	ArrayList<TeamBoard> list2=db.likeListBoard(u_id, pageNum,5);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /*
	        메인 블루 컬러 : rgb(31, 95, 212);
	        포인트 팬톤 컬러(옐로우) : rgb(245, 223, 77);
	        포인트 팬톤 컬러(그레이) : rgb(147, 149, 151);
        */

        @import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap');
		@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
		
        .bh-font{
            font-family: 'Black Han Sans', sans-serif;
        }
        .font-size_18 {
            font-size: 18px;
        }
        .font-size_45 {
            font-size: 45px;
        }
        .font-size_50 {
            font-size: 50px;
        }
        .font-center {
            text-align: center;
        }
        .font-color_main {
            color: rgb(31, 95, 212);
        }
        .font-color_point_yellow {
            color: rgb(245, 223, 77);;
        }
        /*------ header ------*/

        header {
            width: 1080px;
            margin: 0 auto;
        }
        header p {
            width: 80px;
            height: 20px;
            text-align: center;
            line-height: 15px;
            vertical-align: middle; 
            display: inline-block;
        }

        header div {
            display: inline-block;
        }

        header p a {
            color: #333;
            font-size: 13px;
            font-weight: 600;
            letter-spacing: -1px;
            text-decoration: none;
            padding: 5px 0;
        }

        header p a:hover {
            color:  rgb(31, 95, 212);
            font-weight: bolder;
            transition: 0.3s;
        }

        header .main {
            margin: 0;
            padding: 0;
        }

        header .other {
            float: right;
        }
        /* 바디 */
        body {
            width: 1080px;
            margin : 0 auto;
            
        }
        div{
            display: block;
            clear: both;
        }
        #box{
            /* border: 1px solid black; */
            padding: 20px;
            position: relative;
        }
        .group1{
            margin: 16px 8px 0;
            padding: 10px 25px 20px;
            text-align: left;
            border: 1px solid #dadada;
            background: #fff;
            min-height: 250px;
            display: inline-block;
            width: 43%;
            border-radius: 10px;
        }
        .group2{
            margin: 16px 8px 0;
            padding: 10px 25px 20px;
            text-align: left;
            border: 1px solid #dadada;
            background: #fff;
            min-height: 400px;
            display: inline-block;
            width: 43%;
            border-radius: 10px;
        }
        .group1 p{
     	    font-family: 'Nanum Gothic', sans-serif;
        	font-size: 16px;
            font-weight: 500;
            letter-spacing: -1px;
            padding-left: 10px;
            font-weight: bold;
            color: gray;
        }
        .group1 p:hover{
        	color: black;
        	transition: 0.3s;
        }
        .group2 p:hover{
        	color: black;
        	transition: 0.3s;
        }
        .group2 p{
     	    font-family: 'Nanum Gothic', sans-serif;
        	font-size: 16px;
            font-weight: 500;
            letter-spacing: -1px;
            padding-left: 10px;
            font-weight: bold;
            color: gray;
        }
        .group1:hover{
        	color: gray;
        	transition: 0.3s;
        }
        .group2:hover{
        	color: gray;
        	transition: 0.3s;
        }
        .group3{
            margin: 16px 8px 0;
            padding: 10px 25px 20px;
            text-align: left;
            border: 1px solid #dadada;
            border-radius: 2px;
            background: #fff;
            min-height: 200px;
            display: inline-block;
            width: 43%;
            border-radius: 10px;
        }
        .content{
            font-family: 'Black Han Sans', sans-serif;
            font-size: 25px;
            color: rgb(44, 44, 44);
            padding-top: 10px;
            display: flex;
            flex-wrap: wrap;
        }
        .writetable{
            font-family: 'Nanum Gothic', sans-serif;
        	font-size: 16px;
            font-weight: 500;
            letter-spacing: -1px;
            padding-left: 10px;
            font-weight: bold;
            color: gray;
        }
        .hellobar{
            font-family: 'Nanum Gothic', sans-serif;
            font-weight: 500;
        	font-size: 16px;
            color: rgb(44, 44, 44);
        	background-color: rgb(243, 243, 243);
        }
        .content div{
            background: rgb(241, 232, 215);
        }
        .content div:hover{
        	background: rgb(247, 238, 221);
        }
        
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
        	padding-left: 30px
        }
        .td_content:hover{
            background-color: gray ;
            transition: 0.3s;
        }
        .spanhello{
        	color: blue;
        }
        .heart{
        	width: 20px;
        	height: 20px
        }
        /*------button------*/
        .submit{
        	width: 70px;
        	height: 25px;
        	border: none;
        	background: rgb(39, 83, 165);
        	border-radius: 0.2em;
        	color: white;
        	font-size: 13px;
        	float: right;
        }
        .submit:hover{
            background: rgb(31, 95, 212);
            transition: 0.3s;
        }
        .submit1{
        	width: 65px;
        	height: 23px;
        	border: none;
        	background: rgb(39, 83, 165);
        	border-radius: 0.2em;
        	color: white;
        	font-size: 13px;
        }
        .submit1:hover{
            background: rgb(31, 95, 212);
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
        <div class="content">
            <div class="group1">
                <h3>회원 정보 <input type="button" value="수정하기" class="submit" onclick="location.href='wfmp0102R.jsp?u_id=<%= u_id %>'"></h3>
                <p>아이디: <%= u_id %></p>
                <p>이  름    : <%= u_name %></p>
                <p>성  별    : <%= u_sex %></p>
                <p>생년월일: <%= u_birth %></p>
                <p>전화번호: <%= u_phone %></p>
                <p>이 메 일 : <%= u_email %></p>
            </div>
            <div class="group1">
                <h3>좋아요 <span>!</span> 글 <input type="button" value="전체보기" class="submit" onclick="location.href='wfmp0106R.jsp?u_id=<%= u_id %>'"></h3>
                <table class="writetable">
                	<% // 4~5개만 나올수 있게 할것
                		for(int i=0; i<list2.size(); i++){
                			TeamBoard board1 = list2.get(i);
                			bl_content = board1.getBl_title();
                	%>
                	<tr>
						<td class="td_content"><img src="images/heart.png" class="heart">&nbsp;&nbsp;&nbsp;<a href="#"><%= bl_content %></a></td>
					</tr>
					<%
						}					
					%>
                </table>
            </div>
            <div class="group2">
                <h3>내가 쓴 글 </h3>
                <p>\#비대면 게시판&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="전체보기" class="submit1" onclick="location.href='wfmp0104R.jsp?u_id=<%= u_id %>'"></p>
                <table class="writetable">
		            <%
						for(int i=0; i<list1.size(); i++){
							TeamBoard board1 = list1.get(i);
							nf_num = board1.getNf_num();
							nf_title = board1.getNf_title();
							nf_content = board1.getNf_content();
					%>
					<tr>
						<td class="td_content"><a href="wfns0105R.jsp?nf_num=<%= nf_num %>&u_id=<%= u_id %>&nf_id=<%= u_id %>&con_id=<%= u_id %>&pageNum=<%= pageNum %>"><%= nf_title %></a></td>
					</tr>
					<%
						}					
					%>
                </table>
                <p>\#홈팁 게시판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="전체보기" class="submit1" onclick="location.href='wfmp0105R.jsp?u_id=<%= u_id %>'"></p>
                <table class="writetable">
		            <%
						for(int i=0; i<list3.size(); i++){
							TeamBoard board1 = list3.get(i);
							ht_num = board1.getHt_num();
							ht_title = board1.getHt_title();
							ht_content = board1.getHt_content();
					%>
					<tr>
						<td class="td_content"><a href="wfht0105R.jsp?ht_num=<%= ht_num %>&u_id=<%= u_id %>&ht_id=<%= u_id %>&con_id=<%= u_id %>&pageNum=<%= pageNum %>"><%= ht_title %></a></td>
					</tr>
					<%
						}					
					%>
				</table>
            </div>
            <div class="group2">
                <h3>내가 쓴 댓글 <input type="button" value="전체보기" class="submit" onclick="location.href='wfmp0107R.jsp?u_id=<%= u_id %>'"></h3>
                <p>- 내가 쓴 댓글 리스트</p>
                <table class="writetable">
		            <%
						for(int i=0; i<list4.size(); i++){
							TeamBoard board1 = list4.get(i);
							comm_table = board1.getComm_table();
							comm_content = board1.getComm_content();
					%>
					<tr>
						<td class="td_content">
							<a href="#"><%= comm_content %></a>
						</td>
					</tr>
					<%
						}
					%>
                </table>
            </div>
        </div>
    <footer>
        <div>
            <span class="bh-font font-size_18 font-color_main">wannaBE대면</span>
        </div>
        <p>Copyright &#x000A9; Non face to face community</p>
    </footer>
</body>
</html>