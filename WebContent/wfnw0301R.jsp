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
            <p><a href="wfnw0201R.jsp?u_id=<%= u_id %>">�ֱٴ���</a></p>
            <p><a href="wfnw0301R.jsp?u_id=<%= u_id %>"class="select">��Ȱ �� ��ȭ</a></p>
        </div>
    </div>
<center>
    <div>
        <table class="covid-news-list" >
            <tr>
                <td rowspan="10" class="main-image">
                    <a href="https://www.hankyung.com/life/article/202104305897i">
                                <img src="https://img.hankyung.com/photo/202104/AA.26217752.1.jpg" width="445" height="220px">
                        <div class="word">
                            <h4>�ڿ��� ���ܽ�ũ��, �� �ް� ȣũ�� ���� <br> �����δ�  </h4>
                                <h5>���������塤����� ���� ��
                                    �ڷγ� ���� ��������� �޽��� <br>
                                    �ڿ��� ���ܽ�ũ��, �� �ް� ȣũ�� ���� �����δ�
                                    ���� ��� ������ ����̼��� ���̺�� ȣũ�� (84)�� ���� �̵�� ������ 5�� �� �ް� ���� �Ｚ�� �ڿ��� �����˱��� ���� ��ũ���� ���� �Ұ��ȴ�. ������ҿ��� ������ ��Ʈ�� �����̴� �۷ι� ���� �̼� ������Ʈ ��CIRCA���� ��ȯ�̴�.
                                    CIRCA�� ���� 1�Ϻ��� ���� ���� ���� �ν��������� ���� �� 5�� �۷ι� �뵵���� ���� ��ũ������ ȣũ���� ��ǰ ���¾� Ȥ�� ������ �������� �ٶ� �� ������ ����϶�(����)�� �� ���̴�. ��ǰ�� ���� 31�ϱ��� ���� 8��21�к��� 2��30�ʰ� �󿵵ȴ�.
                                </h5>
                        </div>
                    </a>
                </td>
                <td></td>
            </tr>
            <tr height="20px"><td></td></tr>
            <tr>
                <td class="list">
                    <a href="https://www.ytn.co.kr/_ln/0106_202105022248390174">
                        5�� �ɰ��� �˷����� ����...����� ��ó����?</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://news.mt.co.kr/mtview.php?no=2021050209463694514">
                        '������ �� �̿� 2' ������ '���� ����' ��� ����</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="http://kormedi.com/1338558/%EC%95%84%EC%8A%A4%ED%8A%B8%EB%9D%BC%EC%A0%9C%EB%84%A4%EC%B9%B4-%EB%B0%B1%EC%8B%A0-%EC%A0%91%EC%A2%85-%ED%94%BC%ED%95%B4%EC%95%BC-%ED%95%A0-%EC%82%AC%EB%9E%8C%EC%9D%80/">
                        �ƽ�Ʈ������ī ��� ���� ���ؾ� �� �����?</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://www.mbn.co.kr/news/culture/4492966">
                        '�̳���', ��ī���� Ư�������� 100�� ���ġ�VOD�� �α�</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://www.ytn.co.kr/_ln/0108_202105021559213970">
                        [����] ���ϵ� ���� ���� ���� ����...�ϱ��� ����</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="http://kormedi.com/1338456/%EC%8B%A0%ED%98%B8%EB%A5%BC-%EB%AC%B4%EC%8B%9C-%EA%B0%84%EC%95%94-%EC%9C%84%ED%97%98-%ED%81%AC%EA%B2%8C-%EB%86%92%EC%9D%B4%EB%8A%94-%EC%9E%98%EB%AA%BB%EB%90%9C-%ED%96%89%EB%8F%99/">
                        ��ȣ�� ����.. ���� ���� ũ�� ���̴� �߸��� �ൿ</a>
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
                        <a href="http://news.heraldcorp.com/view.php?ud=20210502000148">
                            <img src="https://imgnews.pstatic.net/image/016/2021/05/02/20210426000616_0_20210502145401595.jpg?type=w647" width="200px" height="130px">
                        </a>
                    </div>
                </td>
                <td >
                    <div class="sub-list" >
                        <a href="http://news.heraldcorp.com/view.php?ud=20210502000148">
                        <h3> ����ī���� ���� ȿ���� ��ȭ ���̳����� 100�� ���� ���� &nbsp; <a href="http://news.heraldcorp.com/index.php/">
                            <span class="news-name">�췲�����</span>
                        </a></h3>
                    
                        <h5>
                            ��ī���� �������� ��ȭ ���̳������� ���� ���� 60�� ���� 100�� ������ �����ߴ�. ���� 100�� ���� <br> �� ������ �� ��° ��ȭ��.
                            2�� ��ȭ��������ȸ ��ȭ������� ����������� ������ ���̳������� ���� <br> 60��°�� ���� 1�� ���� ���� 100��9000������ ����ߴ�.
                            ���� 3�� �� ������ �� 3�� ���� �ڽ����ǽ� ������ ���״� ���̳������� �������� vs. �ᡯ ���� ���� ���ۿ� �и��� 10���� �� �ӹ������� ������ 26�� ���� ��93ȸ ��ī���� �û���� ���ķ� �ٽ� �����ǿ� �����ߴ�. Ư�� ��� �������� ���������� ���� �ҽ��� �˷����鼭 �������� 27�Ͽ��� �ڽ����ǽ� 2������ �ö���.
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
                        <a href="https://www.yna.co.kr/view/AKR20210502011100005?input=1195m">
                            <img src="https://imgnews.pstatic.net/image/001/2021/05/02/AKR20210502011100005_03_i_P4_20210502092308955.jpg?type=w647" width="200px" height="130px">
                        </a>
                    </div>
                </td>
                <td >
                    <div class="sub-list" >
                        <a href="https://www.yna.co.kr/view/AKR20210502011100005?input=1195m">
                        <h3>���� �ñ� �� ����� ��Ȱ��ȭ �����ϼ��� &nbsp; 
                            <a href="https://www.yna.co.kr/index?site=header_logo">
                            <span class="news-name">���մ���</span>
                        </a></h3>
                    
                        <h5>
                            �����ؾ繮ȭ�翬���� '��, �Ź�ȭ�� �߽ɿ� ����' Ư����<br>
                            ���� ������ �ִ� �����ؾ繮ȭ�翬���Ҵ� ���� 4�Ϻ��� 8�� 22�ϱ��� Ư���� '��(��), �Ź�ȭ�� <br>
                             �߽ɿ� ����'�� ������ �� �ؾ��������ð����� �����Ѵٰ� 2�� ������.

                            �̹� ���ô� ���� �ս��� �ñȿ� �޾Ƶ��� ����� ��Ȱ��ȭ�� ���캸�� ���� ���õƴ�.
                            
                            1876�� ���� ���� ���� �ս��� ������ ������ ��ȭ�� ���� ���� �޾Ƶ��̸� ������ �Ź�ȭ�� �̲�����. ���� ����� ������ �ٴ� ���� ������ �巯���� ��¡���� �ܱ��� �������� Ȱ��ƴ�.
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
                        <a href="https://www.news1.kr/articles/?4293778">
                            <img src="https://imgnews.pstatic.net/image/421/2021/05/02/0005326064_001_20210502133202937.jpg?type=w647" width="200px" height="130px">
                        </a>
                    </div>
                </td>
                <td >
                    <div class="sub-list" >
                        <a href="https://www.news1.kr/articles/?4293778">
                        <h3> �÷�, "1�� ����� �÷��� ���ࡦ3�Ⱓ 2000��� �Ը� ����"
                             &nbsp; <a href="https://www.news1.kr/">
                            <span class="news-name">news1</span>
                        </a></h3>
                    
                        <h5> SK�ڷ��� ��ȸ���� �帲����۴ϰ� �ڻ� ����� �÷��� '�÷�(FLO)'�� ���� 1�� ���� �� ���� <br>
                             ��� Ȯ�븦 ���� 3�Ⱓ 2000��� �Ը� ���ڸ� �����Ѵٰ� 2�� ������.

                            �帲����۴ϴ� �̹�<br> Ȯ���� �ڱݿ� ���� ���Ѻ�ó����(�� �׿��÷���)�� �濵������ ���ڸ� �������� ������ �׿����佺(��)�κ��� 700��� �Ը� ���ڸ� �޾�����, ���� ������ ���� �����ڸ� ���� ���� �Ը� Ȯ���� �� ��ȹ�̴�.
                            
                            �̹� ���ڴ� ����� ���񽺷μ� �÷��� �ܿ��� Ȯ���ϰ�, �������� ������ ��ȭ�� ���� �����Ѵ�. �帲����۴Ͽ� ������ �÷��� ���� û�뷮�� �ſ� 10��� �������� ���� 2�Ⱓ ����� 87% ���� ���̴�. 
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