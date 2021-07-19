<%@page import="java.util.ArrayList"%>
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
	
	String bl_title="";
	int bl_num=0;
	int bl_like=0;
	int comm_table_num=0;
	
	int comm_num=0;
	String comm_table="";
	String comm_content="";
	String comm_table_name="";
	
	ArrayList<TeamBoard> likeList=db.likeListBoard(u_id, pageNum, 10);
	ArrayList<TeamBoard> list4=db.commListBoard(u_id, pageNum, 10);
		
	if(board != null){
		bl_num = board.getBl_num();
		bl_like = board.getBl_like();
		bl_title=board.getBl_title();
		comm_num=board.getComm_num();
		comm_table=board.getComm_table();
		comm_content=board.getComm_content();
		comm_table_num=board.getComm_table_num();
	}
	
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
    <link href="css/list2.css" rel="stylesheet" type="text/css">
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
            <div id="list2">
            	<p class="title"><span class="font-color_main">내가 쓴</span> 댓글 </p>
                <table>
                	<tr>
	                    <td>게시판 이름</td>
	                    <td>댓글 내용</td>
	                    <td>게시글 번호</td>
                	</tr>
		            <%
						for(int i=0; i<list4.size(); i++){
							TeamBoard board1 = list4.get(i);
							comm_table_num = board1.getComm_table_num();
							comm_table = board1.getComm_table();
							comm_content = board1.getComm_content();
					%>
				 	<tr>
						<td>
					<%
							if(comm_table.equals("home_tip")) {
								comm_table_name = "집콕 꿀TIP";
							} else if(comm_table.equals("non_face")) {
								comm_table_name = "비대면 이야기";
							} else {
								comm_table_name = "none";
							}
					%>
						<%= comm_table_name %>
						</td>
						<td>
					<%
							if(comm_table.equals("home_tip")) {
					%>
								<a href="wfht0105R.jsp?ht_num=<%= comm_table_num %>&ht_id=<%= u_id %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>"><%= comm_content %></a>
					<%								
							} else if(comm_table.equals("non_face")) {
					%>			
								<a href="wfns0105R.jsp?nf_num=<%= comm_table_num %>&nf_id=<%= u_id %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>"><%= comm_content %></a>
					<%
							} else {
					%>
								<a href="#"><%= comm_content %></a>
					<%			
							}
					%>
						</td>
						<td><%= comm_table_num %>번</td>
					</tr>
					<%
						}					
					%>
                </table>
                <br>
                <br>
                <div class="page">
                	<%= TeamBoard.pageNumber3(u_id, 4) %>
                </div>
            </div>
        <br><br>
        <footer>
        <div>
            <span class="bh-font font-size_18 font-color_main">wannaBE대면</span>
        </div>
        <p>Copyright &#x000A9; Non face to face community</p>
   		</footer>
</body>
</html>