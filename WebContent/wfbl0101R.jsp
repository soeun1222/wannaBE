<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="bucketList.BlBean"%>
<%@page import="bucketList.BlDBBean"%>
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
	
	BlDBBean db = BlDBBean.getinstance();
	ArrayList<BlBean> blList = db.listBlBoard(pageNum);
	
	/*--관리자와 사용자 구분--*/
	int re = db.confirmManager(u_id);
	
	int bl_num = 0, bl_like = 0;
	String bl_title = "", bl_id = "";
	
	/*--좋아요 중복 막기--*/
	ArrayList<Integer> userLikelist = new ArrayList<Integer>();
	userLikelist = db.userLikeList(u_id);
	int likere = -1;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link href="./css/top.css" rel="stylesheet" type="text/css">
    <link href="./css/bucketlist.css" rel="stylesheet" type="text/css">
    
    <script type="text/javascript" src="bucketlist.js" charset="utf-8"></script>
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
        <form method="post" action="wfbl0101R_ok.jsp" name="list_frm">
            <p class="title"><span class="font-color_main">대면 버킷리스트</span> 게시판 </p>
            <span class="sub_title">
                대면이 된다면 하고싶은 버킷리스트들을 공유하는 버킷리스트 게시판
            </span>
            <div class="write_bt">
            	<%
            		if(u_id.isEmpty()) { 
            	%>
            		<input type="button" value="새글작성" onclick="login_rq()">
            	<%
            		} else {
            	%>
            		<input type="button" value="새글작성" onclick="location.href='wfbl0102W.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
               <%
            		}
            	%>
                
            </div>
            <table>
                <tr>
                    <td>대면 버킷리스트</td>
                    <td>글쓴이</td>
                    <td>좋아요</td>
                </tr>
                <%
                	for(int i = 0; i < blList.size(); i++) {
                		BlBean bb = blList.get(i);
                		bl_num = bb.getBl_num();
                		bl_title = bb.getBl_title();
                		bl_like = bb.getBl_like();
                		bl_id = bb.getU_id();
                		
                %>
                <tr>
                		<td>
                <%
                			if(u_id.equals(bl_id) || re == 1) {
                %>
                				<a href='wfbl0103W.jsp?bl_num=<%= bl_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>'>
                					<%= bl_title %>
                				</a>
               <%
                			} else {
               %>
                			<%= bl_title %>	
               <%
                			}
                %>
                		</td>	
                		<td><%= bl_id %></td>	
                		<td>
                <%
                			if(u_id.equals(bl_id)) {
                %>
                				<a onclick="not_like()" style="cursor: pointer;">
                					<img src="./images/heart.png">
                				</a>				
                <%
                			} else {
                				
                				for(int k = 0; k < userLikelist.size(); k++) {
                					if(userLikelist.get(k) == bl_num) {
                %>
                        				<a onclick="one_like()" style="cursor: pointer;">
                        					<img src="./images/heart.png">
                        				</a>				
                <%
                						likere = 1;
                						break;
                					}
                				}
                				
                				if(likere != 1) {
                	%>
                       				<a href='wfbl0105R.jsp?bl_num=<%= bl_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>'>
                       					<img src="./images/heart.png">
                       				</a>			
                  <%
                				}
                				likere = -1;

                			}
                %>
                			<%= bl_like %>
                		</td>
                </tr>
                <%
                	}
                %>
            </table>
        </form>
        <div class="page">
				<%= BlBean.pageNumber(5, u_id) %>
		</div>
    </div>

    <!-- footer 부분 -->
    <footer>
        <div id="footer">
            <div class="footer">
                <div>
                    <span class="bh-font font-size_18 font-color_main">wannaBE대면</span>
                    <span><a href="#">메뉴 전체 보기 <span>></span></a></span>
                </div>
                <p>Copyright &#x000A9; Non face to face community</p>
            </div>
        </div>
    </footer>
</body>
</html>