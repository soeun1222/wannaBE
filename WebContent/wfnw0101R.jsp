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
            <p><a href="wfnw0101R.jsp?u_id=<%= u_id %>" class="select">코로나</a></p>
            <p><a href="wfnw0201R.jsp?u_id=<%= u_id %>">최근뉴스</a></p>
            <p><a href="wfnw0301R.jsp?u_id=<%= u_id %>">생활 및 문화</a></p>
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
                            <h4>코로나19 백신 접종 후 이상반응 9건 중 4건 확인…보상 인정</h4>
                                <h5>신종 코로나바이러스 감염증(코로나19) 백신 접종 완료자는
                                     다음 달  <br>5일부터 '2주 자가격리' 의무를 면제받는다. 
                                백신 접종자에 대한 일종의 '인센티브'다.
                                확진자와 밀접하게 접촉하거나 외국방문 후 입국하더라도 '음성' 확인만 된다면 자유로운 활동을 보장하기로 한 것으로, 
                                향후 코로나19 백신 접종률에 어떤 영향을 미칠지 주목된다.</h5>
                        </div>
                    </a>
                </td>
                <td></td>
            </tr>
            <tr height="20px"><td></td></tr>
            <tr>
                <td class="list">
                    <a href="https://www.segye.com/newsView/20210430507561">
                        日, 코로나19 확진 도쿄만 1000명 초과… 올림픽 회의론 확산 [특파원+]</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://imnews.imbc.com/news/2021/world/article/6164247_34880.html">
                        화이자, 미국서 생산한 코로나19 백신 첫 해외 공급</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://www.mbn.co.kr/news/society/4491124">
                        자가검사키트 오늘부터 약국 판매…서울교육청, 학교에 도입</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://imnews.imbc.com/replay/2021/nwdesk/article/6165098_34936.html?utm_source=dable">
                        '5인 모임 금지' 3주 연장…7월부터 '새 거리두기'</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://www.news1.kr/articles/?4292416">
                        서울 내달 화이자 백신 접종 예약 중단…방역당국 "일시적 자제"</a>
                </td>
            </tr>
            <tr>
                <td class="list">
                    <a href="https://news.kbs.co.kr/news/view.do?ncd=5175739&ref=A">
                        코로나19 백신 접종 20대 공무원 희귀질환 진단</a>
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
                        <h3> '메이드 인 USA' 화이자 백신, 멕시코로 첫 수출 &nbsp; <a href="https://www.sedaily.com/">
                            <span class="news-name">서울경제</span>
                        </a></h3>
                    
                        <h5>
                            인접국 안정시켜 리스크 차단",  美 '경제 방화벽' 구축에 잰걸음 <br>
                       
                            미국 경제의 자신감은 인접국에 대한 백신 수출로 이어지고 있다. 이제는 국경을 마주한 국가로 <br>
                            부터 코로나19 감염을 막는 것이 탄탄한 미국 경제에 도움이 될 것이라는 판단에 따른 것
                            이다. 견조한 성장세의 미국 경제가 일종의 방화벽을 구축하고 있다는 평가가 나온다.
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
                        <h3> 백신 하루접종 25만명 돌파…총 332만명, 인구의 6.4％ &nbsp; <a href="http://news.heraldcorp.com/index.php/">
                            <span class="news-name">헤럴드경제</span>
                        </a></h3>
                    
                        <h5>
                            <!-- 지난달 28일 22만명, 29일 24만명 이어
                            22만8399명, 화이자 2차 접종까지 마쳐 -->
                            화이자백신 부족 일부 지자체 접종 일시중단 <br>
                            국내에서 코로나19 백신 접종이 시작된 지 두 달여가 지난 가운데 처음으로 하루 접종자가 
                             25만명<br>을 넘어섰다. 1일 코로나19 예방접종대응추진단(추진단)에 따르면 전날 하루 백신 신규 접종자는 25만9018명이다. 이로써 1차 접종을 완료한 사람은 총 332만6003명으로 집계됐다. 국내 인구(5200만명) 대비 접종률은 6.4%다.
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
                        <h3> 갈수록 심각한 인도 상황… “하루 확진 40만명 넘었다”
                             &nbsp; <a href="http://www.kmib.co.kr/news/index.asp">
                            <span class="news-name">국민일보</span>
                        </a></h3>
                    
                        <h5> 연일 폭증하고 있는 인도의 코로나19 일일 신규 확진자 수가 급기야 40만명을 넘어섰다. 1일 <br> 인도 
                            보건·가족복지부에 따르면 이날 오전 기준 코로나19 일일 신규 확진자 수는 40만1993명으로 <br>집계됐다.  코로나19 사태 발생 후 특정 국가의 신규 확진자 수가 40만명을 넘어선 건 처음이다.올 초 주춤했던 인도의 신규 확진자 수는 3월부터 폭증세를 거듭하고 있다.
                        
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