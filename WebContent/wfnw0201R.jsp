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
        <p>
            <a href="wfmn0101R.jsp?u_id=<%= u_id %>" class="bh-font font-size_20 font-color_main text-decoration-none">wannaBE대면</a> 
            
        </p>
        <p>
        <a href="wfnw0101R.jsp?u_id=<%= u_id %>" class="service font-size_25 "><b>오늘의 소식</b></a>
    </p>
    </div>
    <div id="nav">
        <div class="menu">
            <p><a href="wfnw0101R.jsp?u_id=<%= u_id %>">코로나</a></p>
            <p><a href="wfnw0201R.jsp?u_id=<%= u_id %>"class="select">최근뉴스</a></p>
            <p><a href="wfnw0301R.jsp?u_id=<%= u_id %>">생활 및 문화</a></p>
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
                            <h4>육군훈련소 "방역과 인권 조화되도록 시스템 개선하겠다"</h4>
                                <h5>코로나19(COVID-19) 방역 과정 중 인권침해 논란에 휘말린 육군훈련 <br>
                                    소가 사과문을 올리며 향후 방역과 인권 조화에 힘쓰겠다고 밝혔다.
                                    김인건 육군훈련소장은 2일 오후 페이스북 '육군이 소통합니다' 페이지에 올린 사과문에서 "훈련병 여러분에게 코로나19 방역 시행 과정에서 겪은 고충과 불편함에 대해 사과한다"고 밝혔다.
                                    김 소장은 "코로나19라는 전대미문의 팬데믹(세계적 대유행)을 맞아 육군의 최대 신병교육기관 책임자로서 매주 3200여명, 연간 12만여명을 건강하고 안전하게 교육해야 한다는 사명감으로 최선을 다했으나 시행 과정에서 훈련병의 기본권과 인권이 침해되는 사례가 발생했다"고 썼다.</h5>
                        </div>
                    </a>
                </td>
                <td></td>
            </tr>
            <tr height="20px"><td></td></tr>
            <tr>
                <td class="list">
                    <a href="https://www.yna.co.kr/view/PYH20210501057000005?input=1196m">
                        코엑스 야외 전광판에서 공개된 데이비드 호크니 영상 작품</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://www.ytn.co.kr/_ln/0115_202105021827143639_001">
                        나흘간 이어진 산불, 초등학생들 '불장난' 원인</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://www.ytn.co.kr/_ln/0103_202105011759095017_001">
                        '한강 실종' 대학생 부검 결과...뒤통수 상처·뺨 근육 파열 </a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://imnews.imbc.com/replay/2021/nwdesk/article/6166800_34936.html">
                        내일부터 '공매도' 1년 2개월 만에 부분 재개</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://www.yonhapnewstv.co.kr/news/MYH20210501007700038?did=1825m">
                        '모든 이에게 모든 것을'…정진석 추기경 장례미사</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://www.segye.com/newsView/20210502507288?OutUrl=naver">
                        의대생 한강서 실종된 날 새벽 4시30분 CCTV에 잡힌 ‘전력질주’ 3인은?</a>
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
                        <h3> 은행권, 가상화폐 거래소 검증지침 마련 &nbsp; 
                            <a href="https://news.kbs.co.kr/common/main.html?ref=pLogo">
                            <span class="news-name">KBS</span>
                        </a></h3>
                    
                        <h5>
                            달라진 특정금융거래정보법(특금법)에 따라 사실상 가상화폐 거래소에 대한 '종합 검증' 역할을 <br>
                             떠안게 된 시중은행들이 실사 과정에서 적용할 지침을 마련하고 본격 검증 준비를 마쳤습니다. <br>

                            자금세탁 방지 관련 전산·조직·인력은 물론이고 거래소가 취급하는 코인의 안전성, 거래소의 재무 안정성, 거래소 대주주까지 문제가 될 부분이 없는지 샅샅이 살필 예정입니다.
                            
                            금융권에 따르면 은행연합회는 최근 시중은행들에 '자금세탁방지(AML) 위험평가 방법론 가이드라인(지침)'을 내려보냈습니다.
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
                        <h3> 미얀마 시위대 최소 6명 사망…아세안 합의 이후 최다 &nbsp;
                             <a href="https://news.kbs.co.kr/common/main.html?ref=pLogo">
                            <span class="news-name">KBS</span>
                        </a></h3>
                    
                        <h5>
                            미얀마 곳곳에서 현지 시간으로 2일 수천 명의 시민이 군사정권에 반대하는 거리 시위를 벌인 가운 <br> 데 군경의 총격으로 시위대 최소 6명이 숨졌습니다.

                            이는 지난달 24일 '즉각적 폭력 중단' 등 5개 <br> 항에 합의한 동남아 국가연합(아세안) 특별정상회의 이후 하루 기준으로는 가장 많은 사망자 수입니다.
                            
                            현지 매체인 미얀마 2일 나우는 중부 사가잉 지역 
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
                        <h3> 스페이스X, 우주정거장서 4명 태우고 지구로 귀환

                             &nbsp; <a href="https://newsis.com/">
                            <span class="news-name">뉴시스</span>
                        </a></h3>
                    
                        <h5> 미국 우주탐사 기업 스페이스X의 유인 우주선이 국제우주정거장(ISS)에 6개월간 있던 우주비행사 <br> 4명을 태우고 지구로 2일 귀환했다.

                            AP 통신 등에 따르면 전날 ISS를 출발한 스페이스X 우주선 <br> '크루 드래곤 1호'가 이날 오전 2시57분(한국시간 오후 3시57분)께 미국 남부 플로리다주 앞 멕시코만에 안착했다.
                            
                            크루 드래곤호는 그간 미국 우주왕복선과 러시아 소유스 우주선이 활주로나 초원지대에 착륙했던 만큼 해상에 착수하면서 비행사의 안전에 영향을 우려하는 목소리가 컸지만 무사히 내리는데 성공했다.
                            
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
        <span class="bh-font font-size_18 font-color_main">wannaBE대면</span>
    </div>
    <p>Copyright &#x000A9; Non face to face community</p>
</footer>
</body>
</html>