<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="nonFace.NfDBBean"%>
<%@page import="nonFace.NfBean"%>
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
	
	NfDBBean db = NfDBBean.getinstance();
	ArrayList<NfBean> nfList = db.listNfBoard(pageNum);
	
	/*--관리자와 사용자 구분--*/
	int re = db.confirmManager(u_id);
	
	int nf_num = 0, nf_hit = 0;
	String nf_title = "", nf_content = "", nf_id = "";
	Timestamp nf_date = null;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link href="./css/top.css" rel="stylesheet" type="text/css">
    <link href="./css/list.css" rel="stylesheet" type="text/css">
    
    <script type="text/javascript" src="nonface.js" charset="utf-8"></script>
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
        <form method="post" action="wfns0101R_ok.jsp" name="list_frm">
            <p class="title"><span class="font-color_main">비대면 이야기</span> 게시판 </p>
            <span class="sub_title">
                비대면 속 우리의 일상을 자유롭게 이야기하는 비대면 이야기 게시판
            </span>
            <div class="write_bt">
            	<%
            		if(u_id.isEmpty()) { 
            	%>
            		<input type="button" value="새글작성" onclick="login_rq()">
            	<%
            		} else {
            	%>
            		<input type="button" value="새글작성" onclick="location.href='wfns0102W.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
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
                	for(int i = 0; i < nfList.size(); i++) {
                		NfBean nb = nfList.get(i);
                		nf_num = nb.getNf_num();
                		nf_title = nb.getNf_title();
                		nf_content = nb.getNf_content();
                		nf_date = nb.getNf_date();
                		nf_hit = nb.getNf_hit();
                		nf_id = nb.getU_id();
                		
                %>
                <tr>
                		<td><%= nf_num %></td>	
                		<td><a href='wfns0105R.jsp?nf_id=<%= nf_id %>&nf_num=<%= nf_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>'><%= nf_title %></a></td>	
                		<td><%= nf_id %></td>	
                		<td><%= sdf.format(nf_date) %></td>
                </tr>
                <%
                	}
                %>
            </table>
        </form>
        <div class="page">
				<%= NfBean.pageNumber(5, u_id) %>
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