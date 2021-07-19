<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="homeTip.HtBean"%>
<%@page import="homeTip.HtDBBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	/*--사용자 아이디 받기--*/
	String u_id = "";
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	}
	/*--pageNum값 받기--*/
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	
	HtDBBean db = HtDBBean.getinstance();
	ArrayList<HtBean> htList = db.listHtBoard(pageNum);
	
	/*--관리자와 사용자 구분--*/
	int re = db.confirmManager(u_id);
	
	int ht_num = 0, ht_hit = 0;
	String ht_title = "", ht_content = "", ht_id = "";
	Timestamp ht_date = null;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link href="./css/top.css" rel="stylesheet" type="text/css">
    <link href="./css/list.css" rel="stylesheet" type="text/css">
    
    <script type="text/javascript" src="hometip.js" charset="utf-8"></script>
</head>
<body>
    <header>
        <div class="main">
            <p><a href="wfmn0101R.jsp?u_id=<%= u_id %>">메인으로</a></p>
        </div>
        <div class="other">
            <p>
            <%
            	if(u_id.isEmpty()){
            %>
            		<a href="wflg0101R.jsp">로그인</a>
            <%
            	}else{
            %>	
            		<a href="wflg0107R.jsp?u_id=<%= u_id %>">로그아웃</a>
            <%	
            	}
            %>
            </p>
            <p><a href="wfre0101R.jsp?u_id=<%= u_id %>">회원가입</a></p>
            <p><a href="wfmp0101R.jsp?u_id=<%= u_id %>">마이페이지</a></p>
        </div>
    </header>
    <div id="title">
        <p class="bh-font font-size_50 font-center">
        	<a href="wfmn0101R.jsp?u_id=<%= u_id %>" style="text-decoration: none; color: rgb(31, 95, 212);">wannaBE대면</a>
        </p>
    </div>

    <div id="nav">
        <div class="menu">
            <p><a href="wfns0101R.jsp?u_id=<%= u_id %>">비대면 이야기</a></p>
            <p><a href="wfht0101R.jsp?u_id=<%= u_id %>">집콕 꿀TIP</a></p>
            <p><a href="wfnw0101R.jsp?u_id=<%= u_id %>">오늘의 소식</a></p>
            <p><a href="wfbl0101R.jsp?u_id=<%= u_id %>">대면 버킷리스트</a></p>
        </div>
    </div>

    <!-- 컨텐츠 시작부분 -->
    <div id="list">
        <form method="post" action="wfht0101R_ok.jsp" name="list_frm">
            <p class="title"><span class="font-color_main">집콕 꿀TIP</span> 게시판 </p>
            <span class="sub_title">
                비대면 세상 속 집콕 활동 시 꿀TIP들을 이야기하는 집콕 꿀TIP 게시판
            </span>
            <div class="write_bt">
            	<%
            		if(u_id.isEmpty()) { 
            	%>
            		<input type="button" value="새글작성" onclick="login_rq()">
            	<%
            		} else {
            	%>
            		<input type="button" value="새글작성" onclick="location.href='wfht0102W.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
               <%
            		}
            	%>
                
            </div>
            <table>
                <tr>
                    <td>번호</td>
                    <td>제목</td>
                    <td>글쓴이</td>
                    <td>작성일</td>
                </tr>
                <%
                	for(int i = 0; i < htList.size(); i++) {
                		HtBean nb = htList.get(i);
                		ht_num = nb.getHt_num();
                		ht_title = nb.getHt_title();
                		ht_content = nb.getHt_content();
                		ht_date = nb.getHt_date();
                		ht_hit = nb.getHt_hit();
                		ht_id = nb.getU_id();
                		
                %>
                <tr>
                		<td><%= ht_num %></td>	
                		<td><a href='wfht0105R.jsp?ht_id=<%= ht_id %>&ht_num=<%= ht_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>'><%= ht_title %></a></td>	
                		<td><%= ht_id %></td>	
                		<td><%= sdf.format(ht_date) %></td>
                </tr>
                <%
                	}
                %>
            </table>
        </form>
        <div class="page">
				<%= HtBean.pageNumber(5, u_id) %>
		</div>
    </div>

    <!-- footer 부분 -->
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