<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="homeTip.HtBean"%>
<%@page import="homeTip.HtDBBean"%>
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
	
	HtDBBean db = HtDBBean.getinstance();
	ArrayList<HtBean> htList = db.listHtBoard(pageNum);
	
	/*--�����ڿ� ����� ����--*/
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
        <form method="post" action="wfht0101R_ok.jsp" name="list_frm">
            <p class="title"><span class="font-color_main">���� ��TIP</span> �Խ��� </p>
            <span class="sub_title">
                ���� ���� �� ���� Ȱ�� �� ��TIP���� �̾߱��ϴ� ���� ��TIP �Խ���
            </span>
            <div class="write_bt">
            	<%
            		if(u_id.isEmpty()) { 
            	%>
            		<input type="button" value="�����ۼ�" onclick="login_rq()">
            	<%
            		} else {
            	%>
            		<input type="button" value="�����ۼ�" onclick="location.href='wfht0102W.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
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