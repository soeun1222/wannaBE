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
            <p><a href="wfnw0201R.jsp?u_id=<%= u_id %>">최근뉴스</a></p>
            <p><a href="wfnw0301R.jsp?u_id=<%= u_id %>"class="select">생활 및 문화</a></p>
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
                            <h4>코엑스 옥외스크린, 한 달간 호크니 신작 <br> 선보인다  </h4>
                                <h5>런던·뉴욕·도쿄와 동시 상영
                                    코로나 이후 희망·협력 메시지 <br>
                                    코엑스 옥외스크린, 한 달간 호크니 신작 선보인다
                                    영국 출신 세계적 현대미술가 데이비드 호크니 (84)의 영상 미디어 신작이 5월 한 달간 서울 삼성동 코엑스 케이팝광장 옥외 스크린을 통해 소개된다. 공공장소에서 디지털 아트를 선보이는 글로벌 공공 미술 프로젝트 ‘CIRCA’의 일환이다.
                                    CIRCA는 지난 1일부터 서울 런던 뉴욕 로스앤젤레스 도쿄 등 5개 글로벌 대도시의 옥외 스크린에서 호크니의 작품 ‘태양 혹은 죽음을 오랫동안 바라볼 수 없음을 기억하라’(사진)를 상영 중이다. 작품은 오는 31일까지 매일 8시21분부터 2분30초간 상영된다.
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
                        5월 꽃가루 알레르기 급증...증상과 대처법은?</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://news.mt.co.kr/mtview.php?no=2021050209463694514">
                        '갤럭시 북 이온 2' 유저도 '갤북 프로' 기능 쓴다</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="http://kormedi.com/1338558/%EC%95%84%EC%8A%A4%ED%8A%B8%EB%9D%BC%EC%A0%9C%EB%84%A4%EC%B9%B4-%EB%B0%B1%EC%8B%A0-%EC%A0%91%EC%A2%85-%ED%94%BC%ED%95%B4%EC%95%BC-%ED%95%A0-%EC%82%AC%EB%9E%8C%EC%9D%80/">
                        아스트라제네카 백신 접종 피해야 할 사람은?</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://www.mbn.co.kr/news/culture/4492966">
                        '미나리', 아카데미 특수…관객 100만 돌파·VOD도 인기</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://www.ytn.co.kr/_ln/0108_202105021559213970">
                        [날씨] 내일도 전국 맑고 공기 깨끗...일교차 주의</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="http://kormedi.com/1338456/%EC%8B%A0%ED%98%B8%EB%A5%BC-%EB%AC%B4%EC%8B%9C-%EA%B0%84%EC%95%94-%EC%9C%84%ED%97%98-%ED%81%AC%EA%B2%8C-%EB%86%92%EC%9D%B4%EB%8A%94-%EC%9E%98%EB%AA%BB%EB%90%9C-%ED%96%89%EB%8F%99/">
                        신호를 무시.. 간암 위험 크게 높이는 잘못된 행동</a>
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
                        <h3> “아카데미 수상 효과” 영화 ‘미나리’ 100만 관객 돌파 &nbsp; <a href="http://news.heraldcorp.com/index.php/">
                            <span class="news-name">헤럴드경제</span>
                        </a></h3>
                    
                        <h5>
                            아카데미 수상작인 영화 ‘미나리’가 국내 개봉 60일 만에 100만 관객을 돌파했다. 올해 100만 관객 <br> 을 돌파한 두 번째 영화다.
                            2일 영화진흥위원회 영화관입장권 통합전산망에 따르면 ‘미나리’는 개봉 <br> 60일째인 지난 1일 누적 관객 100만9000여명을 기록했다.
                            지난 3월 초 개봉한 뒤 3주 연속 박스오피스 정상을 지켰던 ‘미나리’는 ‘고질라 vs. 콩’ 개봉 이후 신작에 밀리며 10위권 내 머물렀지만 지난달 26일 열린 제93회 아카데미 시상식을 전후로 다시 상위권에 진입했다. 특히 배우 윤여정의 여우조연상 수상 소식이 알려지면서 다음날인 27일에는 박스오피스 2위까지 올랐다.
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
                        <h3>조선 궁궐 속 서양식 생활문화 감상하세요 &nbsp; 
                            <a href="https://www.yna.co.kr/index?site=header_logo">
                            <span class="news-name">연합뉴스</span>
                        </a></h3>
                    
                        <h5>
                            국립해양문화재연구소 '궁, 신문화의 중심에 서다' 특별전<br>
                            전남 목포에 있는 국립해양문화재연구소는 오는 4일부터 8월 22일까지 특별전 '궁(宮), 신문화의 <br>
                             중심에 서다'를 연구소 내 해양유물전시관에서 개최한다고 2일 밝혔다.

                            이번 전시는 조선 왕실이 궁궐에 받아들인 서양식 생활문화를 살펴보기 위해 마련됐다.
                            
                            1876년 개항 이후 조선 왕실은 서양의 문물과 문화를 가장 먼저 받아들이며 조선의 신문화를 이끌었다. 궁의 서양식 문물은 근대 국가 조선을 드러내는 상징이자 외교적 수단으로 활용됐다.
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
                        <h3> 플로, "1위 오디오 플랫폼 도약…3년간 2000억원 규모 투자"
                             &nbsp; <a href="https://www.news1.kr/">
                            <span class="news-name">news1</span>
                        </a></h3>
                    
                        <h5> SK텔레콤 자회사인 드림어스컴퍼니가 자사 오디오 플랫폼 '플로(FLO)'의 시장 1위 도약 및 음악 <br>
                             사업 확대를 위해 3년간 2000억원 규모 투자를 추진한다고 2일 밝혔다.

                            드림어스컴퍼니는 이미<br> 확보한 자금에 더해 신한벤처투자(구 네오플럭스)가 경영참여형 투자를 목적으로 설립한 네오스페스(유)로부터 700억원 규모 투자를 받았으며, 추후 콘텐츠 수익 재투자를 통해 투자 규모를 확대해 갈 계획이다.
                            
                            이번 투자는 오디오 서비스로서 플로의 외연을 확장하고, 오리지널 콘텐츠 강화를 위해 추진한다. 드림어스컴퍼니에 따르면 플로의 유료 청취량은 매월 10억건 수준으로 지난 2년간 연평균 87% 성장 중이다. 
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