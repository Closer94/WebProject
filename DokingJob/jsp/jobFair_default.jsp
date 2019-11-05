<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<jsp:useBean id="db" class="jsp.db.DBConnection" />

<%@ page import = "java.sql.*" %>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");

String url = "../logIn.html";

//로그인 했는지 안했는지 확인
String user_id = (String)session.getAttribute("user_id");
if(user_id == null || user_id.equals(""))
	response.sendRedirect(url);
else{
String user_interest_job = (String)session.getAttribute("user_interest");

Connection conn = db.SqlConnectionStart();
Statement stm = null;
ResultSet rs = null;
try {
	stm = conn.createStatement();
	
	String query = "select * from employment where interest_job = '"+user_interest_job+"';";
	rs = stm.executeQuery(query);

%>

        <meta charset="utf-8">
        <title>
            도킹잡(DockingJob) - 미생에서 완생으로
        </title>
        <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap&subset=korean" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../css/jobFair.css">

        <script>
            //사이드 메뉴 소스
            var stmnLEFT = 50; // 오른쪽 여백 
            var stmnGAP1 = 0; // 위쪽 여백 
            var stmnGAP2 = 550; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
            var stmnBASE = 150; // 스크롤 시작위치 
            var stmnActivateSpeed = 20; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
            var stmnScrollSpeed = 10; //스크롤 속도 (클수록 느림)
            var stmnTimer; 
            
            function RefreshStaticMenu() { 
            var stmnStartPoint, stmnEndPoint; 
            stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
            stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
            if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
            if (stmnStartPoint != stmnEndPoint) { 
            stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
            document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
            stmnRefreshTimer = stmnScrollSpeed; 
            }
            stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
            } 
            function InitializeStaticMenu() {
            document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
            document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
            RefreshStaticMenu();
            }
            function goTop(){
                document.documentElement.scrollTop=0;
            }
            function goBottom(){
                document.documentElement.scrollTop = document.body.scrollHeight;
            }
            //사이드 메뉴 소스  
        </script>

    </head>
    <body style="background:#edf1f8;" onload="InitializeStaticMenu();">
        <!--사이드 메뉴-->
        <table id="STATICMENU">
            <tr><td title="맨위로"><button type="button" onclick="goTop()" style="width:40px; height:30px; background:white;margin:0px;">▲</button></td></tr>
            <tr><td title="맨아래로"><button type="button" onclick="goBottom()" style="width:40px; height:30px; background:white;margin:0px;">▼</button></td></tr>
        </table>
        <!--사이드 메뉴-->
        <header class = positionHead>
            <table>
                <tr>
                    <td colspan="2" style="width:300px;height:100px;font-size:60px;font-family: 'Jua', sans-serif"><a title="메인페이지로 가기" href="main.html" style="text-decoration:none;">도킹잡</a></td>
                    <td width="600"></td>
                    <td style="width:250px;font-size:15px;text-align:right; height:80px;font-family:'Noto Sans KR', sans-serif;"><a id = "up" href="myPage_myActive1.html" title="마이페이지 이동">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id = "up" href="" title="로그아웃 하기">로그아웃</a>&nbsp;&nbsp;</td>
                </tr>
            </table>
        </header>
        <nav class = positionHead> 
            <ul id="ulStyle" >
                <li id="liStyle" title="직업정보 이동" style="margin-left: -10px;"><a href="ProgramerInfo.html">직업정보</a></li>
                <li id="liStyle" title="지원교육정보 이동" style="margin-left: 100px;"><a href="jobEducation.html">지원교육정보</a></li>
                <li id="liStyle" title="지원정책 이동" style="margin-left: 100px;"><a href="supportPolicy.html">지원정책</a></li>
                <li id="liStyle" title="박람회 및 채용정보 이동" style="margin-left: 100px;"><a href="jobFair.html">박람회 및 채용정보</a></li>
                <li id="liStyle" title="커뮤니티 이동" style="margin-left: 100px;"><a href="community.html">커뮤니티</a></li>
            </ul>
        </nav>
        
        <section class = positionBody>
                <div style="margin-left:10%;">
                    <p style="font-size:30px;"><span style="color:blueviolet"><strong>웹 개발자</strong></span>를 위한 취업박람회 일정</p> 
                </div>
                
                <hr>

                <!--silder 시작-->
                <div id="slider">
                    <ul id="sliderWrap">
                        <li>
                            <a href=""><img src="../image/jobFair01.GIF"></a>
                            <a href=""><img src="../image/jobFair02.png"></a>
                            <a href=""><img src="../image/jobFair03.jpg"></a>
                            <a href=""><img src="../image/jobFair04.png"></a>
                        </li>
                        <li>
                            <a href=""><img src="../image/jobFair05.GIF"></a>
                            <a href=""><img src="../image/jobFair06.jpg"></a>
                            <a href=""><img src="../image/jobFair07.jpg"></a>
                            <a href=""><img src="../image/jobFair08.jpg"></a>
                        </li>
                        <li>
                            <a href=""><img src="../image/jobFair09.jpg"></a>
                            <a href=""><img src="../image/jobFair10.png"></a>
                            <a href=""><img src="../image/jobFair11.jpg"></a>
                            <a href=""><img src="../image/jobFair12.png"></a>
                        </li>  
                    </ul>
                    <a href="#" id="prev">&#8810;</a>
                    <a href="#" id="next">&#8811;</a>
                </div>
                <!--slider 끝-->
                
                
                <div style="margin-left:10%;">
                    <p style="font-size:30px;"><span style="color:blueviolet"><strong>당신을 위한</strong></span> 구직정보</p> 
                </div>
                
                <hr>
                <div class="select">
                    <select name="place">
                            <option value="1">전국</option>
                            <option value="2">서울/경기</option>
                            <option value="3">충청</option>
                            <option value="4">전라</option>>
                            <option value="4">경상</option>>
                            <option value="4">강원</option>>
                    </select>    
                    <span> 지역에 있는</span>
                    
                    <select name="type">
                        <option value="1">웹</option>
                        <option value="1">앱</option>
                    </select>

                    <span> 개발자 구직정보 입니다.</span>
                </div>

                <hr>

				<%
                    while(rs.next()){ 
                    	String employ_url = rs.getString("url");
                    	String title = rs.getString("title");
                    	String region = rs.getString("region");
                    	String interest = rs.getString("interest_job");
                    	
                    	if(interest.equals("1"))              	interest = "웹";
                    	else if(interest.equals("2"))			interest = "앱";
                    	
                    	String open_date = rs.getString("open_date");
                    	String start_date = rs.getString("start_date");
                    	String end_date = rs.getString("end_date");
                    	String agency = rs.getString("agency");
                    	String img_url = rs.getString("img_url");

                    	String start_date_temp = start_date.substring(0, 10); 
                    	String end_date_temp = end_date.substring(0, 10); 
        
                    	String applicaiton_date = start_date_temp+" ~ " + end_date_temp;
                    	
                    	out.print("<div class='card'>");
                        out.print("<div class='img-section'>");
                        out.print("<img src='"+img_url+"' alt='사진파일'>");
                        out.print("</div>");
                        out.print("<div class='content'>");
                        out.print("<p class='title'>"+title+"</p>");
                    	out.print("<p class='company'>"+agency+"</p>");
                    	out.print("<p class='place'>"+region+"/"+applicaiton_date+"</p>");
                    	out.print("</div></div>");
                    }
                    %>
                    
                 <div class="card">
                    <div class="img-section">
                        <img src="../image/kakao.png" alt="카카오">
                    </div>
                    <div class="content">
                        <p class="title">웹 퍼블리셔</p>
                        <p class="company">카카오</p>
                        <p class="place">서울/경기</p>
                        <p class="date">2015/10/30~2015/11/30</p>
                    </div>
                </div>

        </section>      
        <footer class="positionBody" >
            <hr>
            <p style="font-size:15px;color:gray;">
                <span style="margin-left:4%;">상호: (주)도킹잡&nbsp;&nbsp;&nbsp;대표: 이갑성&nbsp;&nbsp;&nbsp;주소: 강원도 춘천시 한림대학길 1 [24252]&nbsp;&nbsp;&nbsp;전화번호: 010-1234-5678&nbsp;&nbsp;&nbsp;사업자번호: 312-15-00712&nbsp;&nbsp;&nbsp;대표메일: kabsung3@naver.com<p>
                <span style="margin-left:35%; color:gray;">CORYRIGHT DOCKINGJOB 2019 ALL RIGHTS RESESRVED</span>
            </p>
        </footer>  
    </body>

<!-- slider 시작-->
    <script type="text/javascript" src="../js/slider.js"></script>
<!-- slider 끝-->
<!-- jquery-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</html>
<% }
catch(Exception e) {
	out.println(e.getMessage());
}
finally{
	if(rs != null)			rs.close();
	if(stm != null)			stm.close();
	if(conn != null)		conn.close();
}
} %>