<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String u_id = "";
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	} else {
		response.sendRedirect("wfns0101R.jsp");
	}
	
	/*--pageNum�� �ޱ�--*/
	String pageNum = request.getParameter("pageNum");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link href="./css/top.css" rel="stylesheet" type="text/css">
	<link href="./css/write.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript" src="nonface.js" charset="utf-8"></script>
</head>
<body>
    <header>
        <div class="main">
            <p><a href="wfmn0101R.jsp?u_id=<%= u_id %>">��������</a></p>
        </div>
        <div class="other">
            <p>
            <%
            	if(u_id.isEmpty()){
            %>
            		<a href="wflg0101R.jsp">�α���</a>
            <%
            	}else{
            %>	
            		<a href="wflg0107R.jsp?u_id=<%= u_id %>">�α׾ƿ�</a>
            <%	
            	}
            %>
            </p>
            <p><a href="wfre0101R.jsp?u_id=<%= u_id %>">ȸ������</a></p>
            <p><a href="wfmp0101R.jsp?u_id=<%= u_id %>">����������</a></p>
        </div>
    </header>
    <div id="title">
        <p class="bh-font font-size_50 font-center">
        	<a href="wfmn0101R.jsp?u_id=<%= u_id %>" style="text-decoration: none; color: rgb(31, 95, 212);">wannaBE���</a>
        </p>
    </div>

    <div id="nav">
        <div class="menu">
            <p><a href="wfns0101R.jsp?u_id=<%= u_id %>">���� �̾߱�</a></p>
            <p><a href="wfht0101R.jsp?u_id=<%= u_id %>">���� ��TIP</a></p>
            <p><a href="wfnw0101R.jsp?u_id=<%= u_id %>">������ �ҽ�</a></p>
            <p><a href="wfbl0101R.jsp?u_id=<%= u_id %>">��� ��Ŷ����Ʈ</a></p>
        </div>
    </div>

    <!-- ������ ���ۺκ� -->

    <div id="write">
        <form method="post" action="wfns0102W_ok.jsp?u_id=<%= u_id %>" name="wr_frm">
            <p class="title"><span class="font-color_main">���� �̾߱�</span> ����</p>
            <table>
                <tr>
                    <td>
                        &nbsp;����
                        <input type="text" name="nf_title" placeholder="������ �Է����ּ���">
                    </td>
                </tr>
                <tr>
                    <td>
                        <textarea name="nf_content"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="button" value="�ۼ��ϱ�" onclick="write_ok()">
                        <input type="reset" value="�ٽ��ۼ�">
                        <input type="button" value="�������" onclick="location.href='wfns0101R.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <!-- footer �κ� -->
    <footer>
        <div id="footer">
            <div class="footer">
                <div>
                    <span class="bh-font font-size_18 font-color_main">wannaBE���</span>
                </div>
                <p>Copyright &#x000A9; Non face to face community</p>
            </div>
        </div>
    </footer>
</body>
</html>