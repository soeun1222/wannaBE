<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
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
	
	String nf_content="";
	String ht_content="";
	String nf_title="";
	String ht_title="";
	Timestamp nf_date=null;
	Timestamp ht_date=null;
	int nf_num=0;
	int ht_num=0;
	int ht_comm_count=0;
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
			
	if(board != null){
		nf_num=board.getNf_num();
		ht_num=board.getHt_num();
		nf_title=board.getNf_title();
		ht_title=board.getHt_title();
		nf_content=board.getNf_content();
		ht_content=board.getHt_content();
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
// 수정해야됨 글 안들어옴 점검해야함
	System.out.println("@@@@@@@@@############!!!"+u_id);
	ArrayList<TeamBoard> list1=db.nfListBoard(u_id, pageNum, 10);
	ArrayList<TeamBoard> list3=db.htListBoard(u_id, pageNum, 10);
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
            <div id="list">
            	<p class="title"><a href="wfht0101R.jsp"><span class="font-color_main">집콕 꿀 TIP</span></a> 게시판 </p>
                <table>
                	<tr>
	                    <td>번호</td>
	                    <td>제목</td>
	                    <td>댓글 수</td>
	                    <td>작성일</td>
                	</tr>
		            <%
						for(int i=0; i<list3.size(); i++){
							TeamBoard board1 = list3.get(i);
							ht_num = board1.getHt_num();
							ht_title = board1.getHt_title();
							ht_date = board1.getHt_date();
					%>
				 	<tr>
						<td><%= ht_num %></td>
						<td><a href="wfht0105R.jsp?ht_num=<%= ht_num %>&ht_id=<%= u_id %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>"><%= ht_title %></a></td>
						<td>
					<%
							ht_comm_count = db.comment_count2(ht_num);
					%>
							<%= ht_comm_count %>
						</td>
						<td><%= sdf.format(ht_date) %></td>
					</tr>
					<%
						}					
					%>
                </table>
                <br>
                <br>
                <div class="page">
                	<%= TeamBoard.pageNumber2(u_id, 4) %>
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