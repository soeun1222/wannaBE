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
	TeamBoardDBBean db = TeamBoardDBBean.getInstance();
	TeamBoard board = db.getBoard(u_id);
	
	String u_pwd="";
	String u_name="";
	String u_email="";
	int u_phone=0;
	int u_birth=0;
	String u_sex="";
	int u_manager=9;
	
	String mem_id="";
	String mem_pwd="";
	String mem_name="";
	String mem_email="";
	int mem_phone=0;
	int mem_birth=0;
	String mem_sex="";
	int mem_manager=9;
	
	if(board != null){
		mem_id = board.getU_id();
		mem_pwd = board.getU_pwd();
		mem_name = board.getU_name();
		mem_email = board.getU_email();
		mem_phone = board.getU_phone();
		mem_birth = board.getU_birth();
		mem_sex = board.getU_sex();
		mem_manager = board.getU_manager();
	}
	
	ArrayList<TeamBoard> list5=db.userListBoard(pageNum);
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
    <link href="css/stylemypage.css" rel="stylesheet" type="text/css">
    <link href="css/list3.css" rel="stylesheet" type="text/css">
    <style>
    /*------button------*/
    	.submit{
            float: right;
            margin-right: 20px;
        	width: 70px;
        	height: 25px;
        	border: none;
        	background-color: rgb(31, 95, 212);
        	border-radius: 0.2em;
        	color: white;
        	font-size: 13px;
        }
        .submit:hover{
            background-color: rgb(79, 128, 221) ;
            transition: 0.3s;
        }
    </style>
    <script type="text/javascript" src="team.js" charset="utf-8"></script>
</head>
<script type="text/javascript">
function allsel(check) {
//	alert(check);
	var chks = document.getElementsByName("chk");
	for (var i = 0; i < chks.length; i++) {
		chks[i].checked = check;
	}
}

function edit(){
	var chks = document.getElementsByName("chk");
	var num = 0;
	for (var i = 0; i < chks.length; i++) {
		if(chks[i].checked) {
			num++;
		}else{
			continue;
		}
	}
	if(num > 1) {
		alert("ID수정은 1개만 가능합니다.");
		return;
	}else if(num == 0){
		alert("수정할 회원을 선택해주세요.");
		return;		
	}else{
		document.mem_frm.submit();
	}
}
</script>
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
	<form name="mem_frm" action="wfmp0202R.jsp?u_id=<%= u_id %>" method="post">
        <div id="list">
			<p class="title">회원관리</p>
            <table>
                <tr>
                	<td><input type="checkbox" id="all" onclick="allsel(this.checked)">
                	</td>
                    <td>아이디</td>
                    <td>이름</td>
                    <td>email</td>
                    <td>전화번호</td>
                    <td>생년월일</td>
                    <td>성별</td>
                </tr>
                <%
                	for(int i=0; i<list5.size(); i++){
                		TeamBoard board1 = list5.get(i);
                		mem_id = board1.getU_id();
                		mem_name = board1.getU_name();
                		mem_email = board1.getU_email();
                		mem_phone = board1.getU_phone();
                		mem_birth = board1.getU_birth();
                		mem_sex = board1.getU_sex();
                %>
                <tr>
                	<td><input type="checkbox" name="chk" value="<%= mem_id %>"></td>
                    <td><%= mem_id %></td>
                    <td><%= mem_name %></td>
                    <td><%= mem_email %></td>
                    <td><%= mem_phone %></td>
                    <td><%= mem_birth %></td>
                    <td><%= mem_sex %></td>
                </tr>
                <%
                	}
                %>
           		</table>           		
                <br>
		        <input type="button" value="회원수정" class="submit" onclick="edit()">
		        <br>
                <br>
                <div class="page">
                	<%= TeamBoard.pageNumber(u_id, 4) %>
                </div>
        </div>
        </form>
        <footer>
        <div>
            <span class="bh-font font-size_18 font-color_main">wannaBE대면</span>
        </div>
        <p>Copyright &#x000A9; Non face to face community</p>
   		</footer>
</body>
</html>