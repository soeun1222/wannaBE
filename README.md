### <span style="color:gray">Park So Eun _ First project </span>  

# [ wannaBE대면 ]

국비 자바 수업 첫번째 프로젝트  
>첫번째 프로젝트 **다운로드 및 실행**하기 
Click [here](https://github.com/soeun1222/Team5_project01)  

&nbsp;&nbsp;&nbsp; 위의 링크에 포함된 ppt의 설명대로 진행하여 실행 가능

>두번째 프로젝트 보러가기 
Click [here](https://www.naver.com)  
___


### # 프로젝트 테스트 계정 
<span style="background-color:rgb(31, 95, 212)">&nbsp;
ID : wannabe  / PW : 1234
&nbsp;</span>

### # 프로젝트 명 :  
<span style="color:rgb(31, 95, 212)">**wannaBE대면**</span>  
대면을 꿈꾸는(wannabe) 비대면(BE대면) 커뮤니티


### # 프로젝트 목적 :  
**비대면 관련 정보를 주고받는 커뮤니티 사이트**    
<span style="color:gray">
미세먼지와 황사 등의 환경문제와 코로나 19가 유행하면서 학교, 회사, 공연장 등 많은 사람들이 모이는 것이 힘들어지고 비대면 생활이 일상에 크게 자리잡게 되면서 비대면에 관한 정보(ex.코로나 현황, 비대면 수업용 zoom 사용팁, 배달음식 추천 등)를 공유하고 서로의 일상을 나눌 수 있는 커뮤니티 시스템을 구축하게 되었습니다.</span>  

### # 프로젝트 팀원 : 
1. <span style="color:rgb(31, 95, 212)">**박소은**</span> (본인 / **팀장**)
2. 김태영
3. 권연진
4. 손나영

### # 프로젝트 개발 일정 :  
- 총 개발 기간 : 2021.04.09 ~ 2021.05.28
- 세부 개발 일정  
    - 1주차 : 주제 및 계획 수립
    - 2주차 : 홈페이지 메뉴와 DB 분석 및 설계
    - 3주차 : 파트 분배 및 디자인 틀 구축
    - 4주차 : 프론트엔드 구축
    - 5주차 : 개별 작업 및 1차 취합 테스트
    - 6주차 : 오류 수정 및 2차 취합 테스트
    - 7주차 : 최종 취합 및 마지막 테스트
    - 8주차 : 최종 PPT 작업 및 발표

### # 프로젝트 개발 환경 :  
- 주 사용 언어  
<img src="https://img.shields.io/badge/-Java-007396?style=flat&logo=Java&logoColor=white"/>


- 디자인 및 기능  
<img src="https://img.shields.io/badge/-HTML5-E34F26?style=flat&logo=html5&logoColor=white"/>
<img src="https://img.shields.io/badge/-CSS3-1572B6?style=flat&logo=css3&logoColor=white"/>
<img src="https://img.shields.io/badge/-JavaScript-F7DF1E?style=flat&logo=javascript&logoColor=white"/>
<img src="https://img.shields.io/badge/-jQuery-0769AD?style=flat&logo=jquery&logoColor=white"/>

- 서버 및 DB  
<img src="https://img.shields.io/badge/-Apache Tomcat-F8DC75?style=flat&logo=apachetomcat&logoColor=black"/>
<img src="https://img.shields.io/badge/-Oracle-F80000?style=flat&logo=oracle&logoColor=white"/>

- 형상관리  
<img src="https://img.shields.io/badge/-GitHub-181717?style=flat&logo=github&logoColor=white"/>


___  

## 프로젝트 담당 파트

### # 홈페이지 로고 담당 :
깔끔하고 신뢰감을 주는 블루 컬러를 사용하였고 'wannabe' 와 '비대면'을 합친 로고를 작업


### # 개발 담당 부분 : 

#### 1. 로그인, 메인페이지, 게시판 초기 틀 담당  
    파트 분배 전 홈페이지의 전체적인 디자인 틀을 잡기 위해 홈페이지의 로그인페이지, 메인페이지, 게시판 페이지의 기본 디자인 작업을 담당함
    
![main](https://user-images.githubusercontent.com/82130077/126200884-f9f24e56-916e-4819-9140-f281b5e138f0.jpg)



#### 2. 비대면 게시판 페이지 담당  
    게시판 목록 및 해당 게시글 상세페이지  
    게시글 작성 및 수정과 삭제, 댓글 작성 및 삭제

   2-1) 비대면 게시판 리스트페이지

    - 매니저가 작성한 공지사항이 제일 상단에 위치하고 그 아래로 가장 최신글 순서대로 리스트가 출력됨
    - 각 페이지당 총 10개의 글이 출력되고 총 갯수에 따라 하단의 페이지 이동 처리

![nonfaceList](https://user-images.githubusercontent.com/82130077/126200405-fa0d2094-22ee-48e7-9f31-7c62911e741f.jpg)


    - 이전, 다음이 각 이동된 페이지에 따라 출력되도록 작업
    
![nonfaceList_next](https://user-images.githubusercontent.com/82130077/126200417-0152cf27-4023-4d8f-a602-04601b80fd74.jpg)


   2-2) 비대면 게시판 글작성페이지

    - 리스트의 새글작성 버튼을 클릭시 비로그인 상태라면 아래와 같이 로그인 알림창이 뜨고 다시 리스트로 돌아감

![nonfaceList_write_nologin](https://user-images.githubusercontent.com/82130077/126200479-f17efcf4-d441-45b8-bb83-8d2ba7b2fa65.jpg)


    - 로그인한 상태에서 새글작성 버튼을 클릭하면 아래와 같이 글작성 페이지로 이동됨
    - 각 제목과 내용을 작성할 수 있고 다시작성을 클릭하면 reset이 되고 작성하기를 클릭하면 글작성이 완료 되도록 작업

![nonfaceList_write](https://user-images.githubusercontent.com/82130077/126200535-88480302-5250-466b-bc8d-da4930874774.jpg)
 

   2-3) 비대면 게시판 상세페이지

    - 리스트에서 해당글을 클릭하면 들어오게 되는 상세페이지로 해당글의 제목, 내용, 작성자, 작성일자, 조회수 등이 출력됨
    - 하단에는 해당글에 작성된 댓글이 출력됨

![nonfaceList_show](https://user-images.githubusercontent.com/82130077/126200632-f762934c-8611-4f22-bee7-5b15ae325e08.jpg)


    - 하단의 댓글쓰기에 비로그인시에는 아래와 같이 로그인 요청 알림창이 뜨면서 댓글 작성이 불가능 하도록 작업
    
![nonfaceList_show_dat](https://user-images.githubusercontent.com/82130077/126200659-2ae9b34f-9131-442d-a8a7-b874fb30648c.jpg)


    - 본인이 작성한 글이면 아래와 같이 수정하기와 삭제하기 버튼으로 각각 수정 및 삭제가 가능
    - 본인이 작성한 댓글이면 아래와 같이 삭제 버튼으로 삭제가 가능
    
![nonfaceList_show_user](https://user-images.githubusercontent.com/82130077/126200677-456a2046-2e36-4c92-a900-b8c6b3904a3c.jpg)


    - 수정하기 버튼 클릭시 아래와 같이 수정페이지로 이동해 수정 가능
    
![nonfaceList_edit](https://user-images.githubusercontent.com/82130077/126202685-32be7cd9-fab2-4a14-b738-ea943ca6cf58.jpg)


#### 3. 집콕꿀TIP 게시판 페이지 담당  
    상단의 비대면 게시판과 같은 형식으로 작업

![homeTipList](https://user-images.githubusercontent.com/82130077/126200846-5ad77ea9-c38c-4af2-b833-79cdc9d7758e.jpg)
![homeTipList_write](https://user-images.githubusercontent.com/82130077/126200854-636f631a-ebe2-445d-aeef-064a174ff706.jpg)


#### 4. 버킷리스트 게시판 페이지 담당  
    게시판 목록 및 게시글 작성, 수정, 삭제  
    좋아요 클릭 및 좋아요 수 조회

   4-1) 버킷리스트 게시판 리스트페이지

    - 좋아요 수가 높은 순으로 출력됨
    - 각 페이지당 총 10개의 글이 출력되고 총 갯수에 따라 하단의 페이지 이동 처리

![BucketList](https://user-images.githubusercontent.com/82130077/126200987-f2ed8f54-fd34-46c6-8540-6a4a7e85bc56.jpg)

    - 본인이 작성한 게시글에는 좋아요 클릭 불가능
    
![BucketList_like_user](https://user-images.githubusercontent.com/82130077/126201011-96378d29-e0c9-4cc9-a474-1da9b468fe61.jpg)


    - 좋아요 중복 클릭 불가능(한 유저당 해당 게시글에는 한번만 좋아요 가능)
    
![BucketList_like_again](https://user-images.githubusercontent.com/82130077/126201025-df7319d5-a86e-4995-b6d9-e1608149d4cd.jpg)


   4-2) 버킷리스트 게시판 글작성페이지

    - 작성하고 싶은 버킷리스트를 작성할 수 있고 다시작성을 클릭하면 **reset**이 되고 **작성하기**를 클릭하면 글작성이 완료 되도록 작업

![BucketList_write](https://user-images.githubusercontent.com/82130077/126201040-8d5e70e1-b38b-4df1-956a-ec4f1b0e8ec2.jpg)


   4-3) 버킷리스트 게시판 글수정페이지

    - 리스트에서 본인글을 클릭하면 들어오는 페이지 바로 수정이 가능하고 **수정하기** 버튼을 클릭하면 수정된 사항이 바로 적용되며 삭제하기 버튼을 클릭하면 게시글이 삭제됨

![BucketList_user](https://user-images.githubusercontent.com/82130077/126201051-e9d71431-cfea-4164-bba2-f004caf9766a.jpg)

    
___  

## 프로젝트 후기

### # 다양한 관점의 테스트 필요성 :
프로젝트를 하면서 가장 크게 느꼈던 부분은 최대한 모든 상황을 생각해 보고 테스트해야 하는 부분이었다. 처음엔 로그인과 비로그인의 구분 정도로만 생각했는데 작업을 진행하면서 본인 글일 때와 타인의 글일 때 혹은 매니저로 로그인 시 등의 여러 가지 변수들에 대한 추가적인 작업들을 진행하게 되면서 테스트의 중요성을 깨닫게 되었다

### # JSP만을 이용한 프로젝트 :
오직 JSP만을 이용해 작업하다보니 파일 자체의 양이 너무 많았고 이로인해 취합 혹은 테스트를 할때 어려움이 있었다 또한 하나의 JSP 안에 너무 많은 작업들이 몰려있어서 수정시 난항을 겪는 등의 문제들을 해소하기 위한 방법을 강구해볼 필요가 있다

### # 팀장으로서의 책임감 :
처음으로 진행해보는 개발 프로젝트이면서 팀장을 담당하게 되어 부담이 컸고 당황스러웠지만 팀장을 함으로써 전체적인 프로젝트의 흐름과 구조에 대해 파악할 수 있었고 취합 시 생기는 여러 가지 오류들을 해결하는 방법과 팀원들 간의 작업 및 다양한 사항들을 조율하는 방법을 알게 되었다
