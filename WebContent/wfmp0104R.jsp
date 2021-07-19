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
	
	int nf_comm_count=0;
	
	
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
// �����ؾߵ� �� �ȵ��� �����ؾ���
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
            <p><a href="wfmn0101R.jsp?u_id=<%= u_id %>">��������</a></p>
        </div>
        <div class="other">
            <p><a href="wflg0107R.jsp?u_id=<%= u_id %>">�α׾ƿ�</a></p>
            <p><a href="wfmp0101R.jsp?u_id=<%= u_id %>">����������</a></p>
        </div>
    </header>
    <div id="title">
        <p class="bh-font font-size_50 font-center font-color_main">�� �� �� �� ��</p>
    </div>
    <div>
        <hr>
            <div class="hellobar" align="center"><span class="spanhello"><%= u_name %></span> �� ! ���õ� �ູ�� �Ϸ� �Ǽ��� !</div> 
        <hr>
    </div>
    <div id="nav">
        <div class="menu">
            <ul class="myMenu">
                <li class="menu1">
                     <p><a href="#">�ڷγ� ��Ȳ</a></p>
                <ul class="menu1 submenu">
                    <li><p><a href="wfnw0101R.jsp?u_id=<%= u_id %>">�ڷγ�</a></p></li>
                </ul>
            </li>
            <li class="menu2">
                <p><a href="#">���� �� ��ȭ</a></p>
                <ul class="menu2 submenu">
                    <li><p><a href="wfnw0201R.jsp?u_id=<%= u_id %>">�ֽŴ���</a></p></li>
                    <li><p><a href="wfnw0301R.jsp?u_id=<%= u_id %>">��Ȱ �� ��ȭ</a></p></li>
                </ul>
            </li>
            <li class="menu3">
                <p><a href="#">�Խ���</a></p>
                <ul class="menu3 submenu">
                    <li><p><a href="wfns0101R.jsp?u_id=<%= u_id %>">���� �̾߱�</a></p></li>
                    <li><p><a href="wfht0101R.jsp?u_id=<%= u_id %>">���� ��TIP</a></p></li>
                    <li><p><a href="wfbl0101R.jsp?u_id=<%= u_id %>">��Ŷ����Ʈ</a></p></li>
                </ul>
            </li>
            <li class="menu4">
                <p><a href="wfmp0101R.jsp?u_id=<%= u_id %>">����������</a></p>
                <ul class="menu4 submenu">
                    <li><p><a href="wfmp0102R.jsp?u_id=<%= u_id %>">ȸ�� ����</a></p></li>
                    <li><p><a href="wfmp0104R.jsp?u_id=<%= u_id %>">���� �̾߱�</a></p></li>
                    <li><p><a href="wfmp0105R.jsp?u_id=<%= u_id %>">���� ��TIP</a></p></li>
                    <li><p><a href="wfmp0106R.jsp?u_id=<%= u_id %>">���ƿ�!!</a></p></li>
                    <li><p><a href="wfmp0107R.jsp?u_id=<%= u_id %>">���� �� ���</a></p></li>
                    <li><p><a href="wfmp0103R.jsp?u_id=<%= u_id %>">ȸ�� Ż��</a></p></li>
                </ul>
            </li>
                <%
                	if (u_manager == 1) {
                %>
		                <li class="menu5">
		                	<p><a href="wfmp0108R.jsp?u_id=<%= u_id %>">������������</a></p>
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
        	<p class="title"><a href="wnfs0101R.jsp"><span class="font-color_main">���� �̾߱�</span></a> �Խ���</p>
                <table>
	                <tr>
	                    <td>��ȣ</td>
	                    <td>����</td>
	                    <td>��� ��</td>
	                    <td>�ۼ���</td>
	                </tr>
		            <%// + �۴����� ��ȸ���߰� + (�߿�) ���۸� ���̴���Ȯ��
						for(int i=0; i<list1.size(); i++){
							TeamBoard board1 = list1.get(i);
							nf_num = board1.getNf_num();
							nf_title = board1.getNf_title();
							nf_date = board1.getNf_date();
					%>
					<tr>
						<td><%= nf_num %></td>
						<td><a href="wfns0105R.jsp?nf_num=<%= nf_num %>&nf_id=<%= u_id %>&u_id=<%= u_id %>&pageNum=<%= pageNum %>"><%= nf_title %></a></td>
						<td>
					<%
							nf_comm_count = db.comment_count(nf_num);
					%>
							<%= nf_comm_count %>
						</td>
						<td><%= sdf.format(nf_date) %></td>
					</tr>
					<%
						}					
					%>
                </table>
                <br>
                <br>
                <br>
                <div class="page">
                	<%= TeamBoard.pageNumber(u_id, 4) %>
				</div>
            </div>
        <br><br>
        <footer>
        <div>
            <span class="bh-font font-size_18 font-color_main">wannaBE���</span>
        </div>
        <p>Copyright &#x000A9; Non face to face community</p>
   		</footer>
</body>
</html>