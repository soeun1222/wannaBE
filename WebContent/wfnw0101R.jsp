<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String u_id = "";
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 	<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>Insert title here</title>
    <link href="css/main_style.css" rel="stylesheet" type="text/css">
    <link href="css/style-covid.css" rel="stylesheet" type="text/css">
</head>
<body>

    <header>
       
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
        <p>
            <a href="wfmn0101R.jsp?u_id=<%= u_id %>" class="bh-font font-size_20 font-color_main text-decoration-none">wannaBE���</a> 
            
        </p>
        <p>
        <a href="wfnw0101R.jsp?u_id=<%= u_id %>" class="service font-size_25 "><b>������ �ҽ�</b></a>
    </p>
    </div>
    <div id="nav">
        <div class="menu">
            <p><a href="wfnw0101R.jsp?u_id=<%= u_id %>" class="select">�ڷγ�</a></p>
            <p><a href="wfnw0201R.jsp?u_id=<%= u_id %>">�ֱٴ���</a></p>
            <p><a href="wfnw0301R.jsp?u_id=<%= u_id %>">��Ȱ �� ��ȭ</a></p>
        </div>
    </div>
<center>
    <div>
        <table class="covid-news-list" >
            <tr>
                <td rowspan="10" class="main-image">
                        <a href="https://www.yna.co.kr/view/AKR20210428087751530?input=1195m" >
                                <img src="https://imgnews.pstatic.net/image/001/2021/04/28/PYH2021042306090005300_P4_20210428130709602.jpg?type=w647" width="445" height="220px">
                        <div class="word">
                            <h4>�ڷγ�19 ��� ���� �� �̻���� 9�� �� 4�� Ȯ�Ρ����� ����</h4>
                                <h5>���� �ڷγ����̷��� ������(�ڷγ�19) ��� ���� �Ϸ��ڴ�
                                     ���� ��  <br>5�Ϻ��� '2�� �ڰ��ݸ�' �ǹ��� �����޴´�. 
                                ��� �����ڿ� ���� ������ '�μ�Ƽ��'��.
                                Ȯ���ڿ� �����ϰ� �����ϰų� �ܱ��湮 �� �Ա��ϴ��� '����' Ȯ�θ� �ȴٸ� �����ο� Ȱ���� �����ϱ�� �� ������, 
                                ���� �ڷγ�19 ��� �������� � ������ ��ĥ�� �ָ�ȴ�.</h5>
                        </div>
                    </a>
                </td>
                <td></td>
            </tr>
            <tr height="20px"><td></td></tr>
            <tr>
                <td class="list">
                    <a href="https://www.segye.com/newsView/20210430507561">
                        ��, �ڷγ�19 Ȯ�� ���츸 1000�� �ʰ��� �ø��� ȸ�Ƿ� Ȯ�� [Ư�Ŀ�+]</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://imnews.imbc.com/news/2021/world/article/6164247_34880.html">
                        ȭ����, �̱��� ������ �ڷγ�19 ��� ù �ؿ� ����</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://www.mbn.co.kr/news/society/4491124">
                        �ڰ��˻�ŰƮ ���ú��� �౹ �Ǹš����ﱳ��û, �б��� ����</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://imnews.imbc.com/replay/2021/nwdesk/article/6165098_34936.html?utm_source=dable">
                        '5�� ���� ����' 3�� ���塦7������ '�� �Ÿ��α�'</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://www.news1.kr/articles/?4292416">
                        ���� ���� ȭ���� ��� ���� ���� �ߴܡ��濪�籹 "�Ͻ��� ����"</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://news.kbs.co.kr/news/view.do?ncd=5175739&ref=A">
                        �ڷγ�19 ��� ���� 20�� ������ �����ȯ ����</a>
                </td>
            </tr>
            <tr  height="20px"><td></td></tr>
        </table>
    </div> 
    <!-- ----1---- -->
    <div id="sub">
        <table id="sub-news">
            <tr>
                <td rowspan="2" width="250px">
                    <div class="sub-img">
                        <a href="https://www.sedaily.com/NewsView/22LABMSUS1">
                            <img src="https://newsimg.sedaily.com/2021/04/30/22LABMSUS1_3.jpg" width="200px" height="130px">
                        </a>
                    </div>
                </td>
                <td >
                    <div class="sub-list" >
                        <a href="https://www.sedaily.com/NewsView/22LABMSUS1">
                        <h3> '���̵� �� USA' ȭ���� ���, �߽��ڷ� ù ���� &nbsp; <a href="https://www.sedaily.com/">
                            <span class="news-name">�������</span>
                        </a></h3>
                    
                        <h5>
                            ������ �������� ����ũ ����",  ڸ '���� ��ȭ��' ���࿡ ����� <br>
                       
                            �̱� ������ �ڽŰ��� �������� ���� ��� ����� �̾����� �ִ�. ������ ������ ������ ������ <br>
                            ���� �ڷγ�19 ������ ���� ���� źź�� �̱� ������ ������ �� ���̶�� �Ǵܿ� ���� ��
                            �̴�. ������ ���弼�� �̱� ������ ������ ��ȭ���� �����ϰ� �ִٴ� �򰡰� ���´�.
                        </h5>
                    </a>
                    </div>

                    
                </td>
            </tr>
          
        </table>
    </div>
    <!-- ----2---- -->
    <div id="sub">
        <table id="sub-news">
            <tr>
                <td rowspan="2" width="250px">
                    <div class="sub-img">
                        <a href="http://news.heraldcorp.com/view.php?ud=20210501000047">
                            <img src="https://imgnews.pstatic.net/image/016/2021/05/01/20210501000042_0_20210501115701523.jpg?type=w647" width="200px" height="130px">
                        </a>
                    </div>
                </td>
                <td >
                    <div class="sub-list" >
                        <a href="http://news.heraldcorp.com/view.php?ud=20210501000047">
                        <h3> ��� �Ϸ����� 25���� ���ġ��� 332����, �α��� 6.4�� &nbsp; <a href="http://news.heraldcorp.com/index.php/">
                            <span class="news-name">�췲�����</span>
                        </a></h3>
                    
                        <h5>
                            <!-- ������ 28�� 22����, 29�� 24���� �̾�
                            22��8399��, ȭ���� 2�� �������� ���� -->
                            ȭ���ڹ�� ���� �Ϻ� ����ü ���� �Ͻ��ߴ� <br>
                            �������� �ڷγ�19 ��� ������ ���۵� �� �� �޿��� ���� ��� ó������ �Ϸ� �����ڰ� 
                             25����<br>�� �Ѿ��. 1�� �ڷγ�19 ������������������(������)�� ������ ���� �Ϸ� ��� �ű� �����ڴ� 25��9018���̴�. �̷ν� 1�� ������ �Ϸ��� ����� �� 332��6003������ ����ƴ�. ���� �α�(5200����) ��� �������� 6.4%��.
                        </h5>
                    </a>
                    </div>

                    
                </td>
            </tr>
          
        </table>
    </div>
    <!-- ----3---- -->
    <div id="sub">
        <table id="sub-news">
            <tr>
                <td rowspan="2" width="250px">
                    <div class="sub-img">
                        <a href="http://news.kmib.co.kr/article/view.asp?arcid=0015801775&code=61131311&sid1=int">
                            <img src="http://image.kmib.co.kr/online_image/2021/0501/611313110015801775_1.jpg" width="200px" height="130px">
                        </a>
                    </div>
                </td>
                <td >
                    <div class="sub-list" >
                        <a href="http://news.kmib.co.kr/article/view.asp?arcid=0015801775&code=61131311&sid1=int">
                        <h3> ������ �ɰ��� �ε� ��Ȳ�� ���Ϸ� Ȯ�� 40���� �Ѿ��١�
                             &nbsp; <a href="http://www.kmib.co.kr/news/index.asp">
                            <span class="news-name">�����Ϻ�</span>
                        </a></h3>
                    
                        <h5> ���� �����ϰ� �ִ� �ε��� �ڷγ�19 ���� �ű� Ȯ���� ���� �ޱ�� 40������ �Ѿ��. 1�� <br> �ε� 
                            ���ǡ����������ο� ������ �̳� ���� ���� �ڷγ�19 ���� �ű� Ȯ���� ���� 40��1993������ <br>����ƴ�.  �ڷγ�19 ���� �߻� �� Ư�� ������ �ű� Ȯ���� ���� 40������ �Ѿ �� ó���̴�.�� �� �����ߴ� �ε��� �ű� Ȯ���� ���� 3������ �������� �ŵ��ϰ� �ִ�.
                        
                           </h5>
                    </a>
                    </div>

                    
                </td>
            </tr>
          
        </table>
    </div>
   
</center>

<footer>
    <div>
        <span class="bh-font font-size_18 font-color_main">wannaBE���</span>
    </div>
    <p>Copyright &#x000A9; Non face to face community</p>
</footer>
</body>
</html>