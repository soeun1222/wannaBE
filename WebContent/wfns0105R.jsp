<%@page import="java.util.ArrayList"%>
<%@page import="comment.ComBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="nonFace.NfBean"%>
<%@page import="nonFace.NfDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	/*--����� ���̵� �ޱ�--*/
	String u_id = "";
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	}
	
	/*--pageNum�� �ޱ�--*/
	String pageNum = "";
	
	if(request.getParameter("pageNum") != null) {
		pageNum = request.getParameter("pageNum");
	} else {
		pageNum = "1";
	}
	
	int nf_num = 0;
	
	if (request.getParameter("nf_num") != null) {
		nf_num = Integer.parseInt(request.getParameter("nf_num"));
	}
	
	/*--�ش� �� �ۼ��� �ޱ�--*/
	
	String con_id = "";
	if(request.getParameter("nf_id") != null) {
		con_id = request.getParameter("nf_id");
	}
	
	System.out.println(u_id);
	System.out.println(con_id);
	
	NfDBBean db = NfDBBean.getinstance();
	NfBean nb = null;
	
	if(u_id.equals(con_id)) {
		nb = db.getNfBoard(nf_num, false);
	} else {
		nb = db.getNfBoard(nf_num, true);
	}
	
	
	/*--�����ڿ� ����� ����--*/
	int re = db.confirmManager(u_id);
	
	String nf_title = "", nf_content = "", nf_id = "";
	int nf_hit = 0;
	Timestamp nf_date = null;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	
	if (nb != null) {
		nf_title = nb.getNf_title();
		nf_content = nb.getNf_content();
		nf_id = nb.getU_id();
		nf_hit = nb.getNf_hit();
		nf_date = nb.getNf_date();
	}
	
	/*--��� �κ�--*/
	NfDBBean cdb = NfDBBean.getinstance();
	ArrayList<ComBean> comList = cdb.listComment(nf_num);
	
	int comm_num = 0, comm_ref = 0, comm_step = 0, comm_level = 0, table_num = 0;
	String comm_table = "", comm_content = "", comm_uid = "";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link href="./css/top.css" rel="stylesheet" type="text/css">
    <link href="./css/show.css" rel="stylesheet" type="text/css">
    
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

    <div id="show">
    	<form name="show_frm" action="wfns0104R.jsp?nf_num=<%= nf_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>" method="post">
            <p class="title"><span class="font-color_main">���� �̾߱�</span> �Խñ�</p>
            <table>
                <tr>
                    <td>
                        <span class="con_title">&nbsp;<%= nf_title %></span>
                        <span class="con_etc">
                          <span class="name"><%= nf_id %></span>
                          <span class="date"><%= sdf.format(nf_date) %></span>
                          <span class="hit">
                              	��ȸ&nbsp;<span class="font-color_main"><%= nf_hit %></span>
                          </span>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="con_content"><%= nf_content %></span>
                    </td>
                </tr>
                <tr>
                    <td>
                		<% 
                		if(u_id.equals(nf_id) || re == 1) {
                		%>
                			<input type="button" value="�����ϱ�" onclick="location.href='wfns0103W.jsp?nf_num=<%= nf_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
                        	<input type="button" value="�����ϱ�" onclick="delete_ok()">
                		<%
                		} %>
                        <input type="button" value="�������" onclick="location.href='wfns0101R.jsp?u_id=<%= u_id %>&pageNum=<%= pageNum %>'">
                    </td>
                </tr>
            </table>
    	</form>
    </div>
    
    <!-- comment �κ� -->
    <div id="comment">
        <form method="post" action="wfns0105R_ok.jsp?nf_id=<%= nf_id %>&nf_num=<%= nf_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>" name="com_frm">
            <table>
                <tr>
                    <td>��۾���</td>
                    <td>�� ��� <span><%= comList.size() %></span>��</td>
                </tr>
                <tr>
                    <td>
                        <textarea name="comm_content" placeholder="Ÿ���� ��� �ϴ� ������ ��� ����� �޾��ּ���."></textarea>
                    </td>
                    <td>
                    	<%
            			if(u_id.isEmpty()) { 
            			%>
                			<input type="button" value="���" onclick="login_rq()">
            			<%
            			} else if(u_id != null) {
            			%>
            				<input type="button" value="���" onclick="com_write()">	
               			<%
            			}
            			%>
                    </td>
                </tr>
            </table>
        </form>
        <table id="com_list">
        	<%
        		for(int i = 0; i < comList.size(); i++) {
        			ComBean cb = comList.get(i);
        			comm_num = cb.getComm_num();
        			comm_table = cb.getComm_table();
        			comm_content = cb.getComm_content();
        			comm_ref = cb.getComm_ref();
        			comm_step = cb.getComm_step();
        			comm_level = cb.getComm_level();
        			comm_uid = cb.getU_id();
        			table_num = cb.getTable_num();
        			
        	%>
        	<tr>
        		<td>
        			<div class="com_title">
        	<%
        			if(comm_level > 0) {
        				for(int j = 0; j < comm_level; j++) {
        	%>
        					&nbsp;
        	<%
        				}
        	%>
        				<img src="./images/AnswerLine.gif" width="16" height="13">
        	<%
        			}
        	%>
        				<%= comm_uid %>
        			</div>
                    <div class="com_con">
                    	<%= comm_content %>
            <%
            			if(u_id.equals(comm_uid) || re == 1) {
            				%>
            				<input type="button" value="����" style="cursor: pointer;" onclick="location.href='wfns0106R.jsp?nf_num=<%= nf_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>&comm_num=<%= comm_num %>'">
            				<%
            			}
            %>
                    </div>
                    <!--  ���� �۾���
                    <input id="com_bt" type="button" value="��۾��� ��" onclick="com_view()">
                    <div id="com_com" style="display: none;">
                    	<form method="post" action="com_ok.jsp?nf_num=<%= nf_num %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>" name="com_frm">
	                    	<textarea name="comm_content" placeholder="Ÿ���� ��� �ϴ� ������ ��� ����� �޾��ּ���."></textarea>
	                        <input type="button" value="���" onclick="com_com_wr()">
	                        <input type="hidden" name="comm_num" value="<%= comm_num %>">
	                        <input type="hidden" name="comm_ref" value="<%= comm_ref %>">
	                        <input type="hidden" name="comm_step" value="<%= comm_step %>">
	                        <input type="hidden" name="comm_level" value="<%= comm_level %>">
	                    </form>
                    </div>
                    -->
        		</td>		
        	</tr>		
        	<%
        		}
        	%>
        </table> 
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