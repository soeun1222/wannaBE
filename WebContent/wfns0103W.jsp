<%@page import="nonFace.NfBean"%>
<%@page import="nonFace.NfDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String u_id = "";
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	} else {
		response.sendRedirect("wfns0101R.jsp");
	}
	
	int nf_num = 0;
	
	if (request.getParameter("nf_num") != null) {
		nf_num = Integer.parseInt(request.getParameter("nf_num"));
	}
	
	NfDBBean db = NfDBBean.getinstance();
	NfBean board = db.getNfBoard(nf_num, false);
	
	if(!u_id.equals(board.getU_id())) {
		%>
		<script>
			history.go(-1);
		</script>
		<%
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
        <form method="post" action="wfns0103W_ok.jsp?u_id=<%= u_id %>&nf_num=<%= nf_num %>" name="wr_frm">
            <p class="title"><span class="font-color_main">�Խñ�</span> �����ϱ�</p>
            <table>
                <tr>
                    <td>
                        &nbsp;����
                        <input type="text" name="nf_title" value="<%= board.getNf_title() %>">
                    </td>
                </tr>
                <tr>
                    <td>
                        <textarea name="nf_content"><%= board.getNf_content() %></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="button" value="�����ϱ�" onclick="write_ok()">
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