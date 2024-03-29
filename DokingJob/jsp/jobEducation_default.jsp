<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<jsp:useBean id="db" class="jsp.db.DBConnection" />

<%@ page import = "java.sql.*" %> 
<% 
request.setCharacterEncoding("EUC-KR");

String id = request.getParameter("user_id");
String password = request.getParameter("password");

String url = "../logIn.html";

String user_id = (String)session.getAttribute("user_id");
if(user_id == null || user_id.equals(""))
   response.sendRedirect(url);

else{
String user_interest_job = (String)session.getAttribute("user_interest");
String user_region = (String)session.getAttribute("user_region");

Connection conn = db.SqlConnectionStart();
Statement stm = null;
ResultSet rs = null;
try {
   stm = conn.createStatement();
   
   String query = "select * from education where edu_interest= '"+user_interest_job+"' and edu_region = '"+user_region+"';";
   rs = stm.executeQuery(query);

%>
        <meta charset="utf-8">
        <title>
            도킹잡(DockingJob) - 미생에서 완생으로
        </title>
        <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap&subset=korean" rel="stylesheet">

        <style>
            .positionHead{
                max-width: 1200px;
                min-width: 1200px;
                margin:0 auto;
                margin-top: -15px;
                margin-left: 180px;
            }
            .positionBody{
                max-width: 1200px;
                margin:0 auto;
                margin-top: 30px;
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
            .jb-text {
                padding: 5px 10px;
                text-align: center;
                position: absolute;

                transform: translate( -50%, -50% );
                font-size: 50px;
                color: white;
                font-family: 'Noto Sans KR', sans-serif;
            }

            #btn{
                background-color: #edf1f8;
                width: 80px;
                height: 40px;
                border: 1px solid darkgray;
                outline: none;

            }
            #btn:hover{
                text-decoration:none;
                background: gray;
                color: white;
            }

            /*占쏙옙占싱듸옙 占쌨댐옙 占쌀쏙옙*/
            #STATICMENU {
            margin: 0pt;
            padding: 0pt;
            position: absolute;
            right: 0px;
            top: 0px;
            }
            /*占쏙옙占싱듸옙 占쌨댐옙 占쌀쏙옙*/
            tr:nth-child(even) {
                background : aliceblue;
            }
        </style>
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
                    <td colspan="2" style="width:300px;height:100px;font-size:60px;font-family: 'Jua', sans-serif"><a title="메인페이지로 가기" href="../main.html" style="text-decoration:none;">도킹잡</a></td>
                    <td width="600"></td>
                    <td style="width:250px;font-size:15px;text-align:right; height:80px;font-family:'Noto Sans KR', sans-serif;"><a id = "up" href="modifyProfile.jsp".html" title="마이페이지 이동">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id = "up" href="Logouut.jsp" title="로그아웃 하기">로그아웃</a>&nbsp;&nbsp;</td>
                </tr>
            </table>
        </header>
        <nav class = positionHead>
            <ul id="ulStyle" >
                <li id="liStyle" title="직업정보 이동" style="margin-left: -30px;"><a href="../ProgramerInfo.html">직업정보</a></li>
                <li id="liStyle" title="지원교육정보 이동" style="margin-left: 100px;"><a href="jobEducation_default.jsp">지원교육정보</a></li>
                <li id="liStyle" title="지원정책 이동" style="margin-left: 100px;"><a href="../supportPolicy.html">지원정책</a></li>
                <li id="liStyle" title="박람회 및 채용정보 이동" style="margin-left: 100px;"><a href="jobFair_default.jsp">박람회 및 채용정보</a></li>
                <li id="liStyle" title="커뮤니티 이동" style="margin-left: 100px;"><a href="community_list.jsp">커뮤니티</a></li>
            </ul>
    </nav>
        <section class = positionBody>
                <div style="margin-left:44%;">
                <h1>전체 과정 안내</h1>

                </div>
                <form method="post" action="findJobEducation.jsp">
                <table border="1" style="margin-left: 17px; text-align: center; border-collapse: collapse; border-color:gainsboro;">
                    <tr style="color:black;background:#72bee0;"">
                        <th><select name="educationArea" style="width:100px;height:40px;">
                              <option value="1">지역</option>
                                <option value="서울">서울</option>
                                <option value="경기">경기</option>
                                <option value="강원">강원</option>
                                <option value="충청">충청</option>
                                <option value="전라">전라</option>
                                <option value="경상">경상</option>
                                <option value="제주">제주</option>
                        </select></th>
                        <th><select name="educationType" style="width:100px; height:40px; padding:0%;">
                            <option value="1">교육종류</option>
                            <option value="국비교육">국비교육</option>
                            <option value="기업교육">기업교육</option>
                        </select></th>
                        <th><select name="educationField" style="width:150px; height:40px; padding:0%;">
                           <option value="0">분야</option>
                            <option value="1">웹</option>
                            <option value="2">앱</option>
                            <option value="3">네트워크</option>
                            <option value="4">보안</option>
                            <option value="5">빅데이터</option>
                        </select></th>
                        <th style="width: 1000px;">학원명_과정명</th>
                        <th style="width: 150px;">수강료</th>
                        <th style="width: 200px; height: 40px; padding: 0%;">훈련기간</th>
                        <th style="width:100px"><input type="image" src="../image/findImage.jpg" style="margin-top:1px; margin-bottom:-1px;"></th>
                    </tr>
                    </form>
                    <%
                    while(rs.next()){ 
                       String employ_url = rs.getString("edu_url");
                       String region = rs.getString("edu_region");
                       String type = rs.getString("edu_type");
                       String interest = rs.getString("edu_interest");
                       
                       if(interest.equals("1"))
                          interest = "웹";
                       else
                          interest = "앱";

                       String title = rs.getString("edu_title");
                       String agency = rs.getString("edu_institute");
                       //title = agency + "_" + title;
                       String cost = rs.getString("edu_fee");
                       
                       if(cost.equals("0"))
                          cost = "전액무료";
                       else
                           cost = String.format("%,d", Integer.parseInt(cost));
                       
                       String training_date = rs.getString("edu_term");
                       String applicaiton_date = "<span style='background:red; padding:5px; height:30px; text-align: center; color:white;'>모집중</span>";
                        
                       out.print("<tr height='50'><td>"+region+"</td>");
                       out.print("<td>"+type+"</td>");
                       out.print("<td>"+interest+"</td>");
                       out.print("<td><a href='"+employ_url+"'>"+title+"</td>");
                       out.print("<td>"+cost+"</td>");
                       out.print("<td>"+training_date+"</td>");
                       out.print("<td>"+applicaiton_date+"</td></tr>");
                       
                    }
                    %>
                </table>

            </section>
            <!--
            <section class = positionBody style="max-width:1200px">
                    <div style="margin-left: 35%;">
                        <table style="margin-left: 100px; text-align: center; border-collapse: collapse;border-color:darkgrey;">
                            <tr>
                                <td style="padding:5px;"><a herf="">&lt;&lt;</a></td><td style="padding:5px;"><a href="">&lt;</a></td>
                                <td style="padding:5px;"><a herf="">1</a></td><td style="padding:5px;"><a herf="">2</a></td><td style="padding:5px;"><a herf="">3</a></td><td style="padding:5px;"><a herf="">4</a></td>
                                <td style="padding:5px;"><a herf="">&gt;</a></td><td style="padding:5px;"><a herf="">&gt;&gt;</a></td>
                            </tr>
                        </table>
                    </div>
            </section>
            -->
        <footer class="positionBody" >
            <hr>
            <p style="font-size:15px;color:gray;">
                <span style="margin-left:4%;">상호: 도킹잡&nbsp;&nbsp;&nbsp;대표: 이갑성&nbsp;&nbsp;&nbsp;주소: 강원도 춘천시 한림대학길 1 [24252]&nbsp;&nbsp;&nbsp;전화번호: 010-1234-5678&nbsp;&nbsp;&nbsp;사업자번호: 312-15-00712&nbsp;&nbsp;&nbsp;대표메일: kabsung3@naver.com<p>
                <span style="margin-left:35%; color:gray;">CORYRIGHT DOCKINGJOB 2019 ALL RIGHTS RESESRVED</span>
            </p>
        </footer>
    </body>
    </html>
<% }
catch(Exception e) {
   out.println(e.getMessage());
}
finally{
   if(rs != null)         rs.close();
   if(stm != null)         stm.close();
   if(conn != null)      conn.close();
}
} %>
