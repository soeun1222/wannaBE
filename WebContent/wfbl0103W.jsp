<%@page import="bucketList.BlBean"%>
<%@page import="bucketList.BlDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String u_id = "";
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	} else {
		response.sendRedirect("wfbl0101R.jsp");
	}
	
	int bl_num = 0;
	
	if (request.getParameter("bl_num") != null) {
		bl_num = Integer.parseInt(request.getParameter("bl_num"));
	}
	
	BlDBBean db = BlDBBean.getinstance();
	BlBean board = db.getBlBoard(bl_num, false);
	
	if(!u_id.equals(board.getU_id())) {
		%>
		<script>
			history.go(-1);
		</script>
		<%
	}
	
	/*--pageNum값 받기--*/
	String pageNum = request.getParameter("pageNum");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link href="./css/top.css" rel="stylesheet" type="text/css">
	<link href="./css/bucketwrite.css" rel="stylesheet" type="text/css">
	
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
            <p><a href="wfnw0101R.html?u_id=<%= u_id %>">오늘의 소식</a></p>
            <p><a href="wfbl0101R.jsp?u_id=<%= u_id %>">대면 버킷리스트</a></p>
        </div>
    </div>

    <!-- 컨텐츠 시작부분 -->

    <div id="write">
        <form method="post" action="wfbl0103W_ok.jsp?u_id=<%= u_id %>&bl_num=<%= bl_num %>" name="wr_frm">
            <p class="title"><span class="font-color_main">버킷리스트</span> 수정하기</p>
            <table>
                <tr>
                    <td>
                        &nbsp;버킷리스트
                        <input type="text" name="bl_title" value="<%= board.getBl_title() %>">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="button" value="수정하기" onclick="write_ok()">
                        <input type="button" value="삭제하기" onclick="location.href='wfbl0104R.jsp?bl_num=<%= bl_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
                        <input type="button" value="목록으로" onclick="location.href='wfbl0101R.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
                    </td>
                </tr>
            </table>
        </form>
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