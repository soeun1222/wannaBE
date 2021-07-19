<%@page import="java.sql.Timestamp"%>
<%@page import="main_bucket.NonFace"%>
<%@page import="main_bucket.HomeTip"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main_bucket.ListDB"%>
<%@page import="main_bucket.Bucket"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String u_id = "";
	
	if (request.getParameter("u_id") != null) {
		u_id = request.getParameter("u_id");
	}

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="./css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>

<%
	ListDB db = ListDB.getInstance();
	ArrayList<Bucket> bucketlist = db.listBucket();
	ArrayList<HomeTip> hometiplist = db.listHomeTip();
	ArrayList<NonFace> nonfacelist = db.listNonFace();
	int bl_num, bl_like;
	String bl_title, user_tbl_u_id;
%>
    <header>
        <div class="main">
            <p><a href="wfmn0101R.jsp?u_id=<%= u_id %>">메인으로</a></p>
        </div>
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
        <p class="bh-font font-size_50 font-center">
        <a class="title font-color_main" href="wfmn0101R.jsp?u_id=<%= u_id %>">wannaBE대면</p>
    </div>

    <div id="nav">
        <div class="menu">
            <p><a href="wfns0101R.jsp?u_id=<%= u_id %>">비대면 이야기</a></p>
            <p><a href="wfht0101R.jsp?u_id=<%= u_id %>">집콕 꿀TIP</a></p>
            <p><a href="wfnw0101R.jsp?u_id=<%= u_id %>">오늘의 소식</a></p>
            <p><a href="wfbl0101R.jsp?u_id=<%= u_id %>">대면 버킷리스트</a></p>
        </div>
    </div>

    <div id="content_01">
        <div class="content_cov19">
            <div class="status">
                <table>
                    <tr>
                        <td colspan="2"><span>COVID-19</span> <span>확진자 현황</span></td>
                        <td colspan="2">
                            <a href="http://ncov.mohw.go.kr/" target="_blank">
                                자세히<span>+</span>
                            </a>
                        </td>
                    </tr>
                    <tr><td></td></tr>
                    <tr>
                        <td colspan="2">일일확진자 현황</td>
                        <td>국내발생<span>670</span></td>
                        <td>해외유입<span>28</span></td>
                    </tr>
                    <tr>
                        <td>확진환자<span>(누적)</span></td>
                        <td>격리해제</td>
                        <td>치료(격리)중</td>
                        <td>사망</td>
                    </tr>
                    <tr>
                        <td>112,117</td>
                        <td>102,513</td>
                        <td>7,816</td>
                        <td>1,788</td>
                    </tr>
                    <tr>
                        <td>전일대비(+<span>698</span>)</td>
                        <td>(+<span>530</span>)</td>
                        <td>(+<span>162</span>)</td>
                        <td>(+<span>6</span>)</td>
                    </tr>
                </table>
            </div>
        </div>
        
			
        <div class="content_bucket-list">
            <table>
                <tr>
                    <td>
                        대면 <span class="font-color_main">버킷리스트</span>
                    </td>
                    <td></td>
                </tr>
                <tr><td></td><td></td></tr>
             <%
				for(int i=0; i<10; i++){
					
					Bucket bucket = bucketlist.get(i);
					
					 bl_num = bucket.getBl_num();
					 bl_like = bucket.getBl_like();
					 bl_title = bucket.getBl_title();
					 user_tbl_u_id = bucket.getUser_tbl_u_id();
			%>
					<tr>
	                    <td>
	                        <a href='wfbl0101R.jsp?bl_num=<%= bl_num %>&u_id=<%= u_id %>'>
	                            <%= bl_title %>
	                        </a>
	                    </td>
	                    <td><img src="images/heart.png"><span><%=bl_like%></span></td>
	                </tr>
		
		
			<%
				}
			%>
            </table>
        </div>
    </div>
    <div id="content_02">
        <div class="content_nonface-story">
            <table>
                    <tr>
                        <td>
                            <span class="font-color_main">비대면</span> 이야기
                        </td>
                        <td>
                            <a href="wfns0101R.jsp?u_id=<%=u_id%>">
                                자세히<span>+</span>
                            </a>
                        </td>
                    </tr>
                    <tr><td></td><td></td></tr>
                     <%
				for(int i=0; i<10; i++){
					
					NonFace nonface = nonfacelist.get(i);
					int nf_num = nonface.getNf_num();
					String nf_title = nonface.getNf_title();
					String nf_content = nonface.getNf_content();
					Timestamp nf_date = nonface.getNf_date();
					int nf_hit = nonface.getNf_hit();
					user_tbl_u_id = nonface.getUser_tbl_u_id();
					
			%>
					<tr>
	                    <td>
	                        <a href='wfns0105R.jsp?nf_num=<%= nf_num %>&u_id=<%= u_id %>&nf_id=<%= user_tbl_u_id %>&pageNum=1'>
	                            <%= nf_title %>
	                        </a>
	                    </td>
	                   <td>(<span><%=nf_hit%></span>)</td>
	                </tr>
		
		
			<%
				}
			%>
             
                </table>
        </div>
        <div class="content_home-Tip">
        <%
        int ht_num;
		String ht_title;
		String ht_content;
		Timestamp ht_date;
		int ht_hit;
		/*--0521-박소은--*/
		String ht_id;
        %>
        
                <table>
                    <tr>
                        <td>
                            집콕 <span class="font-color_main">꿀TIP</span>
                        </td>
                        <td>
                            <a href="wfht0101R.jsp?u_id=<%=u_id%>">
                                자세히<span>+</span>
                            </a>
                        </td>
                    </tr>
                    <tr><td></td><td></td></tr>
            <%
				for(int i=0; i<10; i++){
					
					HomeTip homeTip = hometiplist.get(i);
					
					ht_num = homeTip.getHt_num();
					ht_title = homeTip.getHt_title();
					ht_content = homeTip.getHt_content();
					ht_date = homeTip.getHt_date();
					ht_hit = homeTip.getHt_hit();
					/*--0521-박소은--*/
					ht_id = homeTip.getUser_tbl_u_id();
					
			%>
					<tr>
	                    <td>
	                        <!--  <a href='wfht0105R.jsp?ht_id=<%=u_id %>&ht_num=<%=ht_num %>&u_id=<%=u_id %>&pageNum=1'>-->
	                        <a href='wfht0105R.jsp?ht_id=<%=ht_id %>&ht_num=<%=ht_num %>&u_id=<%=u_id %>&pageNum=1'>
	                            <%= ht_title %>
	                        </a>
	                    </td>
	                   <td>(<span><%= ht_hit%></span>)</td>
	                </tr>
		
		
			<%
				}
			%>
                  
                </table>
        </div>
        <div class="content_fine-dust">
            <table>
                <tr>
                    <td>
                        오늘의 <span class="font-color_main">미세먼지</span>
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td>53 ㎍/㎥ <span>[단위(㎍/㎥)]</span></td>
                </tr>
                <tr>
                    <td><span>보통</span>(normal)</td>
                </tr>
                <tr>
                    <td>
                        <input id="tab1" type="radio" name="fine-dust_tabs">
                        <label for="tab1">좋음<p>(~30)</p></label>

                        <input id="tab2" type="radio" name="fine-dust_tabs" checked>
                        <label for="tab2">보통<p>(~80)</p></label>

                        <input id="tab3" type="radio" name="fine-dust_tabs">
                        <label for="tab3">나쁨<p>(~150)</p></label>

                        <input id="tab4" type="radio" name="fine-dust_tabs">
                        <label for="tab4">위험<p>(151~)</p></label>

                        <section id="fine-dust_tabs_01">
                            <div class="mask">
                                <img src="images/mask.png" alt="mask">
                                <p>마스크  <span>필요없음</span></p>
                            </div>
                            <div class="outside">
                                <img src="images/trees.png" alt="mask">
                                <p>실외활동 <span>지장없음</span></p>
                            </div>
                        </section>

                        <section id="fine-dust_tabs_02">
                            <div class="mask">
                                <img src="images/mask.png" alt="mask">
                                <p>마스크  <span>필요없음</span></p>
                            </div>
                            <div class="outside">
                                <img src="images/trees.png" alt="mask">
                                <p>실외활동 <span>지장없음</span></p>
                            </div>
                        </section>

                        <section id="fine-dust_tabs_03">
                            <div class="mask">
                                <img src="images/mask.png" alt="mask">
                                <p>마스크  <span>절대필수</span></p>
                            </div>
                            <div class="outside">
                                <img src="images/trees.png" alt="mask">
                                <p>실외활동 <span>자제요망</span></p>
                            </div>
                        </section>

                        <section id="fine-dust_tabs_04">
                            <div class="mask">
                                <img src="images/mask.png" alt="mask">
                                <p>마스크  <span>절대필수</span></p>
                            </div>
                            <div class="outside">
                                <img src="images/trees.png" alt="mask">
                                <p>실외활동 <span>자제필수</span></p>
                            </div>
                        </section>
                    </td>
                </tr>
              
            </table>
        </div>
    </div>
    <footer>
        <div>
            <span class="bh-font font-size_18 font-color_main">wannaBE대면</span>
        </div>
        <p>Copyright &#x000A9; Non face to face community</p>
    </footer>
</body>
</html>