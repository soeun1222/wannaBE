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
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/main_style.css" rel="stylesheet" type="text/css">
    <link href="css/style-covid.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
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
            <p><a href="wfnw0101R.jsp?u_id=<%= u_id %>">�ڷγ�</a></p>
            <p><a href="wfnw0201R.jsp?u_id=<%= u_id %>"class="select">�ֱٴ���</a></p>
            <p><a href="wfnw0301R.jsp?u_id=<%= u_id %>">��Ȱ �� ��ȭ</a></p>
        </div>
    </div>
<center>
    <div>
        <table class="covid-news-list" >
            <tr>
                <td rowspan="10" class="main-image">
                        <a href="https://news.mt.co.kr/mtview.php?no=2021050220320531181" >
                                <img src="https://imgnews.pstatic.net/image/008/2021/05/02/0004581608_001_20210502205501127.jpg?type=w647" width="445" height="220px">
                        <div class="word">
                            <h4>�����Ʒü� "�濪�� �α� ��ȭ�ǵ��� �ý��� �����ϰڴ�"</h4>
                                <h5>�ڷγ�19(COVID-19) �濪 ���� �� �α�ħ�� ����� �ָ��� �����Ʒ� <br>
                                    �Ұ� ������� �ø��� ���� �濪�� �α� ��ȭ�� �����ڴٰ� ������.
                                    ���ΰ� �����Ʒü����� 2�� ���� ���̽��� '������ �����մϴ�' �������� �ø� ��������� "�Ʒú� �����п��� �ڷγ�19 �濪 ���� �������� ���� ����� �����Կ� ���� ����Ѵ�"�� ������.
                                    �� ������ "�ڷγ�19��� ����̹��� �ҵ���(������ ������)�� �¾� ������ �ִ� �ź�������� å���ڷμ� ���� 3200����, ���� 12�������� �ǰ��ϰ� �����ϰ� �����ؾ� �Ѵٴ� ������� �ּ��� �������� ���� �������� �Ʒú��� �⺻�ǰ� �α��� ħ�صǴ� ��ʰ� �߻��ߴ�"�� ���.</h5>
                        </div>
                    </a>
                </td>
                <td></td>
            </tr>
            <tr height="20px"><td></td></tr>
            <tr>
                <td class="list">
                    <a href="https://www.yna.co.kr/view/PYH20210501057000005?input=1196m">
                        �ڿ��� �߿� �����ǿ��� ������ ���̺�� ȣũ�� ���� ��ǰ</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://www.ytn.co.kr/_ln/0115_202105021827143639_001">
                        ���갣 �̾��� ���, �ʵ��л��� '���峭' ����</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://www.ytn.co.kr/_ln/0103_202105011759095017_001">
                        '�Ѱ� ����' ���л� �ΰ� ���...����� ��ó���� ���� �Ŀ� </a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://imnews.imbc.com/replay/2021/nwdesk/article/6166800_34936.html">
                        ���Ϻ��� '���ŵ�' 1�� 2���� ���� �κ� �簳</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://www.yonhapnewstv.co.kr/news/MYH20210501007700038?did=1825m">
                        '��� �̿��� ��� ����'�������� �߱�� ��ʹ̻�</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://www.segye.com/newsView/20210502507288?OutUrl=naver">
                        �Ǵ�� �Ѱ��� ������ �� ���� 4��30�� CCTV�� ���� ���������֡� 3����?</a>
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
                        <a href="https://news.kbs.co.kr/news/view.do?ncd=5176105&ref=A">
                            <img src="https://news.kbs.co.kr/data/news/2021/05/02/20210502_Lr3MOh.jpg" width="200px" height="130px">
                        </a>
                    </div>
                </td>
                <td >
                    <div class="sub-list" >
                        <a href="https://news.kbs.co.kr/news/view.do?ncd=5176105&ref=A">
                        <h3> �����, ����ȭ�� �ŷ��� ������ħ ���� &nbsp; 
                            <a href="https://news.kbs.co.kr/common/main.html?ref=pLogo">
                            <span class="news-name">KBS</span>
                        </a></h3>
                    
                        <h5>
                            �޶��� Ư�������ŷ�������(Ư�ݹ�)�� ���� ��ǻ� ����ȭ�� �ŷ��ҿ� ���� '���� ����' ������ <br>
                             ���Ȱ� �� ����������� �ǻ� �������� ������ ��ħ�� �����ϰ� ���� ���� �غ� ���ƽ��ϴ�. <br>

                            �ڱݼ�Ź ���� ���� ���ꡤ�������η��� �����̰� �ŷ��Ұ� ����ϴ� ������ ������, �ŷ����� �繫 ������, �ŷ��� �����ֱ��� ������ �� �κ��� ������ ������ ���� �����Դϴ�.
                            
                            �����ǿ� ������ ���࿬��ȸ�� �ֱ� ��������鿡 '�ڱݼ�Ź����(AML) ������ ����� ���̵����(��ħ)'�� �������½��ϴ�.
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
                        <a href="https://news.kbs.co.kr/news/view.do?ncd=5176315&ref=A">
                            <img src="https://imgnews.pstatic.net/image/056/2021/05/02/0011036639_001_20210502235803656.jpg?type=w647" width="200px" height="130px">
                        </a>
                    </div>
                </td>
                <td >
                    <div class="sub-list" >
                        <a href="https://news.kbs.co.kr/news/view.do?ncd=5176315&ref=A">
                        <h3> �̾Ḷ ������ �ּ� 6�� ������Ƽ��� ���� ���� �ִ� &nbsp;
                             <a href="https://news.kbs.co.kr/common/main.html?ref=pLogo">
                            <span class="news-name">KBS</span>
                        </a></h3>
                    
                        <h5>
                            �̾Ḷ �������� ���� �ð����� 2�� ��õ ���� �ù��� �������ǿ� �ݴ��ϴ� �Ÿ� ������ ���� ���� <br> �� ������ �Ѱ����� ������ �ּ� 6���� �������ϴ�.

                            �̴� ������ 24�� '�ﰢ�� ���� �ߴ�' �� 5�� <br> �׿� ������ ������ ��������(�Ƽ���) Ư������ȸ�� ���� �Ϸ� �������δ� ���� ���� ����� ���Դϴ�.
                            
                            ���� ��ü�� �̾Ḷ 2�� ����� �ߺ� �簡�� ���� 
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
                        <a href="https://newsis.com/view/?id=NISX20210502_0001427408&cID=10101&pID=10100">
                            <img src="https://image.newsis.com/2019/03/08/NISI20190308_0014971170_web.jpg?rnd=20190309134606" width="200px" height="130px">
                        </a>
                    </div>
                </td>
                <td >
                    <div class="sub-list" >
                        <a href="https://newsis.com/view/?id=NISX20210502_0001427408&cID=10101&pID=10100">
                        <h3> �����̽�X, ���������弭 4�� �¿�� ������ ��ȯ

                             &nbsp; <a href="https://newsis.com/">
                            <span class="news-name">���ý�</span>
                        </a></h3>
                    
                        <h5> �̱� ����Ž�� ��� �����̽�X�� ���� ���ּ��� ��������������(ISS)�� 6������ �ִ� ���ֺ���� <br> 4���� �¿�� ������ 2�� ��ȯ�ߴ�.

                            AP ��� � ������ ���� ISS�� ����� �����̽�X ���ּ� <br> 'ũ�� �巡�� 1ȣ'�� �̳� ���� 2��57��(�ѱ��ð� ���� 3��57��)�� �̱� ���� �÷θ����� �� �߽��ڸ��� �����ߴ�.
                            
                            ũ�� �巡��ȣ�� �װ� �̱� ���ֿպ����� ���þ� ������ ���ּ��� Ȱ�ַγ� �ʿ����뿡 �����ߴ� ��ŭ �ػ� �����ϸ鼭 ������� ������ ������ ����ϴ� ��Ҹ��� ������ ������ �����µ� �����ߴ�.
                            
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