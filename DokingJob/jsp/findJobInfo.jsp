<%@page import="jsp.db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>
            도킹잡(DockingJob) - 미생에서 완생으로
        </title>
        <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap&subset=korean" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../css/jobFair.css">

<style>
.positionHead{
    max-width: 1200px;
    min-width: 1200px;
    margin:0 auto;
    margin-top: -15px;
}
.positionBody{
    max-width: 1200px;
    margin:0 auto;
}
a {
    display: inline-block;
    transition: .3s;
    -webkit-transform: scale(1);
    transform: scale(1);
    text-decoration: none;
    color: #000000;
}
a:hover {
    -webkit-transform: scale(1.1);
    transform: scale(1.1);
    text-decoration: underline;
} 
#ulStyle{
    margin-left: 100px;
    padding: 10px;
    width: 1300px;
    height: 70px;
}
#liStyle{ 
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: bold;
    font-size: 25px;
    list-style:none;
    float: left;
    padding:0px;
}
   

/*사이드 메뉴 소스*/
#STATICMENU { 
margin: 0pt; 
padding: 0pt;  
position: absolute; 
right: 0px; 
top: 0px;
}
/*사이드 메뉴 소스*/

 /*slider 시작*/
 #slider{
    position: relative;
    width:100%;
    height:300px;
    overflow:hidden;
    transition: all 0.3s ease;
    border-radius: 10px;
    
}

#slider:hover{
    transition: all 0.3s ease;
}

#slider:hover img{
    transition: all 0.3s ease;
}

#sliderWrap{
    position: relative;
    list-style:none;
    height:100%;
    width:999%;
    padding:0;
    margin:0;
    transition:all 750ms ease;
    left:0px;
}

#sliderWrap li{
    text-align: center;
    position: relative;
    height:100%;
    width:100%;
    /*width:80vw;*/ /*javascript이용해 slider.offsetWidth px 로 초기화*/ 
    float:left;
}

#sliderWrap li img{
    height:100%;
    border-radius: 20px;
    cursor: pointer;
}

#sliderWrap li:nth-child(1){
    background-color: none;
}

#sliderWrap li:nth-child(2){
    background-color: none;
}

#sliderWrap li:nth-child(3){
    background-color: none;
}

#prev, #next{
    position: absolute;
    width:50px;
    line-height:50px;
    border-radius:50%;
    font-size: 2rem;
    text-shadow: 0 0 20px rgba(0,0,0,0.6);
    text-align: center;
    color:black;
    text-decoration: none;
    top:50%;
    transform: translateY(-50%);
    transition:all 150ms ease;
}

#prev:hover, #next:hover{
    background-color:rgba(0,0,0,0.5);
    text-shadow:0;
    color:white;
    transition: all 0.3s ease;
}

#prev {
    left:10px;
}

#next {
    right:10px;
}

#sliderWrap li a {
    width:250px;
    height:300px;
    border:1px solid white;
    margin:0 10px;
}

#sliderWrap li a img{
    width:100%;
    height:100%;
}
/*slider 끝*/


/*card 시작*/
.card {
    margin:20px;
    padding:0px;

    display:inline-block;
    position: relative;
    width:250px;
    height:300px;
    border: #48cfad 1px solid;
    box-shadow:0px 13px 21px -5px rgba(0, 0, 0, 0.3);
    background: white;
    overflow: hidden;
    
    border-radius: 15px;
    transition: all 0.3s ease;
}


.card:hover {
    box-shadow:0px 13px 21px -3px rgba(0, 0, 0, 0.7);
    transition: all 0.3s ease;
}

.card:hover .content{
    transform:translate(0px,-70px);
    transition: all 0.3s ease;
}

.card .img-section{ /*5:4*/
    width:250px; 
    height:200px;
    background: wheat;
}


.card .content{
    background: white;
    width:100%;
    height:200px;
    transition: all 0.3s ease;
    text-align: center;
}

.card .content p{
    text-align: left;
    display:inline-block;
    margin:0px;
    padding:0px;
    width:90%;
}

.card .content .title{
    height:50px;
    font-size:30px;
    font-weight: bold;
    color:#393c45;	
}

.card .content .company{
    height:50px;
    font-size:20px;
    color:#969699;
}

.card .content .place{
    height:25px;
    font-size:15px;
    color:#48cfad;
}

.card .content .date{
    height:25px;
    font-size:15px;
    color:#48cfad;
}


select{
    width:150px;
    height:50px;
}

div.select{
    text-align: center;
}

/*choice 시작*/

/*select icon 시작*/
div.icon{
    display:inline-block;
    position: relative;
    margin:0;
    padding:0;
    width:70px;
    height:70px;
}

div.icon .box{
    position: absolute;
}


div.icon .box svg{
    position: absolute;
    height: 70px;
    width: 70px;
    margin:0;
    padding:0;
}

div.icon .box circle{
    fill:none;
    opacity: 0.6;
    stroke-width:5;
    stroke-linecap: round;
}

div.icon .box circle:nth-child(2){
    stroke:gray;
    stroke-dasharray: 220;
    stroke-dashoffset: 220;
    transition: all .7s ease;
}

div.icon:hover
    .box circle:nth-child(2){
        stroke-dashoffset: 220;
        stroke-dashoffset: 40;
        transition:all 0.7s ease;
        /*애니메이션도 가능
        animation: circle-fill   ease;
        animation-fill-mode: forwards;*/
   }

   /* 애니메이션도 가능
@keyframes circle-fill{
    to{
        stroke-dashoffset: 40;
    }
}
*/
/* input checkbox */

input[type="checkbox"] {
    display:none;
} 

input[type="checkbox"].interest:checked + label circle:nth-child(2){
    stroke-dasharray: 220;
    stroke-dashoffset: 40;
    stroke:blue;
}

input[type="checkbox"].region:checked + label circle:nth-child(2){
    stroke-dasharray: 220;
    stroke-dashoffset: 40;
    stroke:red;
}

input[type="checkbox"].interest:checked + label p{
    color:black;
    transition:all 0.5s ease;
}

input[type="checkbox"].region:checked + label p{
    color:black;
    transition:all 0.5s ease;
}

/* input checkbox */
div.icon .box .title{
    display:flex;
    position: absolute;
    z-index: 2;
    margin : 0;
    padding:0;
    width:70px;
    height:70px;
    align-items: center;
    justify-content: center;
}

div.icon .box .title p{
    font-family: 'Jua';
    font-size:30px;
    color:rgba(0, 0, 0, 0.3);
    transition:all 0.5s ease;
}
/*select icon 끝*/

/*button 시작*/
button,
button::after {
transition: width 0.3s ease; /*all 사용시 나타나는 것도 tansition*/
height:50px;
}

button {
background: none;
border: 2px solid black;
border-radius: 30px;
color: black;
display: inline-block;
font-size: 25px;
font-weight: bold;
margin: 0;
padding: 3px 25px;
position: relative;
text-transform: uppercase;
z-index: 1;
font-family: 'jua';
}

button::before,
button::after {
border-radius: 30px;
background: green;
opacity: 0.7;
content: '';
position: absolute;
z-index: -1;

}

button:hover {
color: white;
border: 2px solid white;
transition: all 0.5s ease;
}

/* btn-go 시작 */
.btn-go::after {
height: 100%;
left: 0;
top: 0;
width: 0;
}

.btn-go:hover:after {
width: 100%;
}
/*button끝*/

/*search app 끝*/

/*form.choice*/
form.choice{
    font-family: 'jua';
    display:flex;
    flex-direction: row ;
    flex-wrap: wrap ;
    justify-content: space-around ;
    align-items: center ;
    align-content: center ;
}

form.choice span{
    font-size:25px;
    color:black;
    text-shadow:2px 2px 1px rgba(0, 0, 0, 0.3);

}

/*section-title 시작*/
div.section-title-wrapper{
    text-shadow:1px 1px 3px white;
    font-weight:bold;
    font-size:30px;
    display: flex ;
    flex-direction: row ;
    flex-wrap: wrap ;
    justify-content: space-between ;
    align-items: center ;
    align-content: center ;
    margin: 20px 0px;
}

p.section-title span{
    display: inline-block;
    color:blueviolet;
}

div.section-title-wrapper .logo img{
    height: 25px;
}

/*section-title 끝*/
</style>
</head>
<body style="background:#edf1f8;">

	<%
		request.setCharacterEncoding("euc-kr");
	%>
	<jsp:useBean id="db" class="jsp.db.DBConnection" scope="application" />
        <header class="positionHead">
            <table>
                <tr>
                    <td colspan="2" style="width:300px;height:100px;font-size:60px;font-family: 'Jua', sans-serif"><a title="메인페이지로 가기" href="../main.html" style="text-decoration:none;">도킹잡</a></td>
                    <td width="600"></td>
                    <td style="width:250px;font-size:15px;text-align:right; height:80px;font-family:'Noto Sans KR', sans-serif;"><a id = "up" href="../myPage_myActive1.html" title="마이페이지 이동">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id = "up" href="logout.jsp" title="로그아웃 하기">로그아웃</a>&nbsp;&nbsp;</td>
                </tr>
            </table>
        <nav>
            <ul id="ulStyle" >
                <li id="liStyle" title="직업정보 이동" style="margin-left: -10px;"><a href="../ProgramerInfo.html">직업정보</a></li>
                <li id="liStyle" title="지원교육정보 이동" style="margin-left: 100px;"><a href="jobEducation_default.jsp">지원교육정보</a></li>
                <li id="liStyle" title="지원정책 이동" style="margin-left: 100px;"><a href="../supportPolicy.html">지원정책</a></li>
                <li id="liStyle" title="박람회 및 채용정보 이동" style="margin-left: 100px;"><a href="jobFair_default.jsp">박람회 및 채용정보</a></li>
                <li id="liStyle" title="커뮤니티 이동" style="margin-left: 100px;"><a href="../community.html">커뮤니티</a></li>
            </ul>
        </nav>
        </header>
        
        <section class = positionBody>

            <!--section title -->
            <div class="section-title-wrapper">
                <p class="section-title"><span>어떤 세미나</span>가 좋을까?</p>
                <div class="logo">
                    <img src="../image/itkorea_logo.png" alt="itkorea_logo">
                    <img src="../image/naver_logo.png" alt="naver_logo">
                    <img src="../image/nhn-logo.png" alt="nhn_logo">
                    <img src="../image/kakao_logo.png" alt="kakao_logo">
                    <img src="../image/samsung_logo.png" alt="samsung_logo">
                    <img src="../image/microsoft_logo.png" alt="microsoft_logo">
                </div>
            </div>
            <!--section title -->

                

                <!--silder 시작-->
                <div id="slider">
                    <ul id="sliderWrap">
                        <li>
                            <a href="https://forward.nhn.com/" target="_blank"><img src="../image/seminar1.jpg"></a>
                            <a href="http://koreaitcampus.co.kr/community/seminar_view.asp?idxnum=96&clkMater=&txtMenu=&GoTopage=1&selMater=" target="_blank"><img src="../image/seminar2.jpg"></a>
                            <a href="http://koreaitcampus.co.kr/community/seminar_view.asp?idxnum=94&clkMater=&txtMenu=&GoTopage=1&selMater="target="_blank"><img src="../image/seminar3.jpg"></a>
                            <a href="http://ictconference.kr/ICTconference/2019ict/main/main.php"target="_blank"><img src="../image/seminar4.png"></a>
                        </li>
                        <li>
                            <a href=""target="_blank"><img src="../image/jobFair05.GIF"></a>
                            <a href=""target="_blank"><img src="../image/jobFair06.jpg"></a>
                            <a href=""target="_blank"><img src="../image/jobFair07.jpg"></a>
                            <a href=""target="_blank"><img src="../image/jobFair08.jpg"></a>
                        </li>
                        <li>
                            <a href=""target="_blank"><img src="../image/jobFair09.jpg"></a>
                            <a href=""target="_blank"><img src="../image/jobFair10.png"></a>
                            <a href=""target="_blank"><img src="../image/jobFair11.jpg"></a>
                            <a href=""target="_blank"><img src="../image/jobFair12.png"></a>
                        </li>  
                    </ul>
                    <a href="#" id="prev"><</a>
                    <a href="#" id="next">></a>
                </div>
                <!--slider 끝-->
                
                <!--section title -->
            <div class="section-title-wrapper">
                    <p class="section-title"><span>당신을 위한</span> 구직정보</p>
                    <div class="logo">
                        <img src="../image/carrier_logo.png" alt="carrier_logo">
                    </div>
                </div>
                <!--section title -->
                
                <hr>
                <!--choice 시작-->
				<form method="post" action="findJobInfo.jsp" class="choice">
                    <!--관심분야 section 시작-->
                    <!--checkbox 시작-->
                    <input type="checkbox" name="interest" value="1" class="interest" id="interest_1">
                        <label for="interest_1">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>웹</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox 끝-->

                    <!--checkbox 시작-->
                    <input type="checkbox" name="interest" value="2" class="interest" id="interest_2">
                        <label for="interest_2">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>앱</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox 끝-->
                    <!--관심분야 section 끝-->
                    
                    <span>개발자를 위한</span>

                    <!--지역 section 시작-->
                    <!--checkbox 시작-->
                    <input type="checkbox" name="region" value="1" class="region" id="region_1">
                        <label for="region_1">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>서울</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox 끝-->

                    <!--checkbox 시작-->
                    <input type="checkbox" name="region" value="2" class="region" id="region_2">
                        <label for="region_2">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>경기</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox 끝-->

                    <!--checkbox 시작-->
                    <input type="checkbox" name="region" value="3" class="region" id="region_3">
                        <label for="region_3">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>충청</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox 끝-->

                    <!--checkbox 시작-->
                    <input type="checkbox" name="region" value="4" class="region" id="region_4">
                        <label for="region_4">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>전라</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox 끝-->

                    <!--checkbox 시작-->
                    <input type="checkbox" name="region" value="5" class="region" id="region_5">
                        <label for="region_5">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>경상</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox 끝-->

                    <!--checkbox 시작-->
                    <input type="checkbox" name="region" value="6" class="region" id="region_6">
                        <label for="region_6">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>강원</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox 끝-->

                    <span>지역의 구직정보</span>
                    <!--지역 section 끝-->

                    <!--확인버튼섹션-->                    
                    <!--버튼 시작-->
                    <button type="submit" class="btn-go">검색</button>

                <!--choice 끝-->
</form>
                 
                <hr>
		<%
			Connection conn = db.SqlConnectionStart(); //드라이버 연결
			Statement stmt = null;

			String[] interest = request.getParameterValues("interest"); //선택한 관심분야를 담고있는 변수
			
			String[] employRegion = request.getParameterValues("region"); //선택한 지역을 담고있는 변수
			
			try {
				if (conn == null) {
					throw new Exception("데이터베이스 연결 실패");
				}
				stmt = conn.createStatement(); //연결된 상태에서 stmt로

				//DB에 들어있는 정보를 가져와서 rs객체로 저장(출력)
				ResultSet rs = stmt.executeQuery("select * from employment where interest_job = '"+interest[0]+"' and region = '"+employRegion[0]+"' limit 10;");
            	
				if (!rs.next()) {
					out.println("해당하는 정보가 없습니다.");
				} else {
					rs.previous();
				}
				//객체의 값이 있으면 TRUE
				while (rs.next()) {
					
					String url = rs.getString("url");
					String title = rs.getString("title");
					String region = rs.getString("region");
					String open_date = rs.getString("open_date");
					String start_date = rs.getString("start_date");
					String end_date = rs.getString("end_date");
					String agency = rs.getString("agency");
                	String img_url = rs.getString("img_url");
					
                	String start_date_temp = start_date.substring(0, 10); 
                	String end_date_temp = end_date.substring(0, 10);
    
                	String applicaiton_date = start_date_temp+" ~ " + end_date_temp;
                	
                	if(title.length() > 14)
    					title = title.substring(0, 14)+"...";
						
		%>
		<div class="card">
			<div class="img-section">
				<img src='<%= img_url %>' alt="카카오">
			</div>
			<div class="content">
				<p class="title">
					<a href="<%=url%>"><%=title%></a>
				</p>
				<p class="company"><%=agency%></p>
				<p class="place"><%=region%></p>
				<p class="date"><%=applicaiton_date%></p>
			</div>
		</div>


		<%
			}
			} finally {
			}
		%>
	</section>
	<footer class="positionBody">
		<hr>
		<p style="font-size: 15px; color: gray;">
			<span style="margin-left: 4%;">상호: (주)도킹잡&nbsp;&nbsp;&nbsp;대표:
				이갑성&nbsp;&nbsp;&nbsp;주소: 강원도 춘천시 한림대학길 1
				[24252]&nbsp;&nbsp;&nbsp;전화번호: 010-1234-5678&nbsp;&nbsp;&nbsp;사업자번호:
				312-15-00712&nbsp;&nbsp;&nbsp;대표메일: kabsung3@naver.com
				<p>
					<span style="margin-left: 35%; color: gray;">CORYRIGHT
						DOCKINGJOB 2019 ALL RIGHTS RESESRVED</span>
				</p>
	</footer>


</body>
<!-- slider 시작-->
<script type="text/javascript" src="../js/slider.js"></script>
<!-- slider 끝-->
<!-- jquery-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</html>