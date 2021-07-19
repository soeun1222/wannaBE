<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="nonFace.NfDBBean"%>
<%@page import="nonFace.NfBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	/*--����� ���̵� �ޱ�--*/
	String u_id = "";
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	}
	/*--pageNum�� �ޱ�--*/
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	
	NfDBBean db = NfDBBean.getinstance();
	ArrayList<NfBean> nfList = db.listNfBoard(pageNum);
	
	/*--�����ڿ� ����� ����--*/
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
    <div id="list">
        <form method="post" action="wfns0101R_ok.jsp" name="list_frm">
            <p class="title"><span class="font-color_main">���� �̾߱�</span> �Խ��� </p>
            <span class="sub_title">
                ���� �� �츮�� �ϻ��� �����Ӱ� �̾߱��ϴ� ���� �̾߱� �Խ���
            </span>
            <div class="write_bt">
            	<%
            		if(u_id.isEmpty()) { 
            	%>
            		<input type="button" value="�����ۼ�" onclick="login_rq()">
            	<%
            		} else {
            	%>
            		<input type="button" value="�����ۼ�" onclick="location.href='wfns0102W.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
               <%
            		}
            	%>
                
            </div>
            <table>
                <tr>
                    <td>��ȣ</td>
                    <td>����</td>
                    <td>�۾���</td>
                    <td>�ۼ���</td>
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