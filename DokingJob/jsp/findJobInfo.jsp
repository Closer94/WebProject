<%@page import="jsp.db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
   request.setCharacterEncoding("euc-kr");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
        <title> 도킹잡(DockingJob) - 미생에서 완생으로 </title>
        <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap&subset=korean" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../css/jobFair.css">

</head>
<body style="background:#edf1f8;">

   <%
      request.setCharacterEncoding("euc-kr");
   %>
   <jsp:useBean id="db" class="jsp.db.DBConnection" scope="page" />
        <header class="positionHead">
             <table>
                <tr>
                    <td colspan="2" style="width:300px;height:100px;font-size:60px;font-family: 'Jua', sans-serif"><a title="메인페이지로 가기" href="../main.html" style="text-decoration:none;">도킹잡</a></td>
                    <td width="600"></td>
                    <td style="width:250px;font-size:15px;text-align:right; height:80px;font-family:'Noto Sans KR', sans-serif;"><a id = "up" href="modifyProfile.jsp".html" title="마이페이지 이동">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id = "up" href="logouut.jsp" title="로그아웃 하기">로그아웃</a>&nbsp;&nbsp;</td>
                </tr>
            </table>
        <nav>
            <ul id="ulStyle" >
                <li id="liStyle" title="직업정보 이동" style="margin-left: -30px;"><a href="../ProgramerInfo.html">직업정보</a></li>
                <li id="liStyle" title="지원교육정보 이동" style="margin-left: 100px;"><a href="jobEducation_default.jsp">지원교육정보</a></li>
                <li id="liStyle" title="지원정책 이동" style="margin-left: 100px;"><a href="../supportPolicy.html">지원정책</a></li>
                <li id="liStyle" title="박람회 및 채용정보 이동" style="margin-left: 100px;"><a href="jobFair_default.jsp">박람회 및 채용정보</a></li>
                <li id="liStyle" title="커뮤니티 이동" style="margin-left: 100px;"><a href="community_list.jsp">커뮤니티</a></li>
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
                <!--silder -->
                <div id="slider">
                    <ul id="sliderWrap">
                        <li>
                            <a href="https://forward.nhn.com/" target="_blank"><img src="../image/jobFair01.png"></a>
                            <a href="http://koreaitcampus.co.kr/community/seminar_view.asp?idxnum=96&clkMater=&txtMenu=&GoTopage=1&selMater=" target="_blank"><img src="../image/jobFair02.png"></a>
                            <a href="http://koreaitcampus.co.kr/community/seminar_view.asp?idxnum=94&clkMater=&txtMenu=&GoTopage=1&selMater="target="_blank"><img src="../image/jobFair03.png"></a>
                            <a href="http://ictconference.kr/ICTconference/2019ict/main/main.php"target="_blank"><img src="../image/jobFair04.png"></a>
                        </li>
                        <li>
                            <a href=""target="_blank"><img src="../image/jobFair05.png"></a>
                            <a href=""target="_blank"><img src="../image/jobFair06.png"></a>
                            <a href=""target="_blank"><img src="../image/jobFair07.png"></a>
                            <a href=""target="_blank"><img src="../image/jobFair08.png"></a>
                        </li>
                        <li>
                            <a href=""target="_blank"><img src="../image/jobFair09.png"></a>
                            <a href=""target="_blank"><img src="../image/jobFair10.png"></a>
                            <a href=""target="_blank"><img src="../image/jobFair11.png"></a>
                            <a href=""target="_blank"><img src="../image/jobFair12.png"></a>
                        </li>  
                    </ul>
                    <a href="#" id="prev"><</a>
                    <a href="#" id="next">></a>
                </div>
                <!--slider -->
                
                <!--section title -->
            <div class="section-title-wrapper">
                    <p class="section-title"><span>당신을 위한 </span> 구직정보</p>
                    <div class="logo">
                        <img src="../image/carrier_logo.png" alt="carrier_logo">
                    </div>
                </div>
                <!--section title -->
                
                <hr>
                <!--choice -->
            <form method="post" action="findJobInfo.jsp" class="choice">
                    <!-- section -->
                    <!--checkbox -->
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
                    <!--checkbox-->

                    <!--checkbox -->
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
                    <!--checkbox -->
                    <!-- section -->
                    
                    <span>당신을 위한 구직정보</span>

                    <!--section -->
                    <!--checkbox -->
                    <input type="checkbox" name="region" value="서울" class="region" id="region_1">
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
                    <!--checkbox -->

                    <!--checkbox -->
                    <input type="checkbox" name="region" value="경기" class="region" id="region_2">
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
                    <!--checkbox -->

                    <!--checkbox -->
                    <input type="checkbox" name="region" value="충청" class="region" id="region_3">
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
                    <!--checkbox -->

                    <!--checkbox -->
                    <input type="checkbox" name="region" value="전라" class="region" id="region_4">
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
                    <!--checkbox -->

                    <!--checkbox -->
                    <input type="checkbox" name="region" value="경상" class="region" id="region_5">
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
                    <!--checkbox -->

                    <!--checkbox -->
                    <input type="checkbox" name="region" value="강원" class="region" id="region_6">
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
                    <!--checkbox -->

                    <span>지역의 구직정보</span>
                    <button type="submit" class="btn-go">검색</button>

                <!--choice -->
</form>
                 
                <hr>
      <%
         Connection conn = db.SqlConnectionStart();
         Statement stmt = null;

         String[] interest = request.getParameterValues("interest"); 
         String[] employRegion = request.getParameterValues("region");
         
         String myInterest = "";
         if(interest[0].equals("1"))
            myInterest = "웹";
         else
            myInterest = "앱";
            
         String query = "select * from jobfair where job_interest = '"+myInterest+"' and job_region = '"+employRegion[0]+"' limit 10;";
         
         try {
            if (conn == null) {
               throw new Exception("Connecting Error");
            }
            stmt = conn.createStatement(); 
            
            
            ResultSet rs = stmt.executeQuery(query);
               
            
            if (!rs.next()) {
               out.println("Not thing exsis data");
            } else {
               rs.previous();
            }

            while (rs.next()) {
               
               String url = rs.getString("job_url");
               String title = rs.getString("job_title");
               String region = rs.getString("job_region");
            //   String open_date = rs.getString("open_date");
            //   String start_date = rs.getString("start_date");
            //   String end_date = rs.getString("end_date");
               String agency = rs.getString("job_company");
                   String img_url = rs.getString("job_img");
               
                //   String start_date_temp = start_date.substring(0, 10); 
                //   String end_date_temp = end_date.substring(0, 10);
    
                   String applicaiton_date = rs.getString("job_term");
                   
                   if(title.length() > 14)
                   title = title.substring(0, 14)+"...";
                  
      %>
      <div class="card">
         <div class="img-section">
            <img src='<%= img_url %>' alt="이미지">
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
      <p style="font-size:15px;color:gray;">
                <span style="margin-left:4%;">상호: 도킹잡&nbsp;&nbsp;&nbsp;대표: 이갑성&nbsp;&nbsp;&nbsp;주소: 강원도 춘천시 한림대학길 1 [24252]&nbsp;&nbsp;&nbsp;전화번호: 010-1234-5678&nbsp;&nbsp;&nbsp;사업자번호: 312-15-00712&nbsp;&nbsp;&nbsp;대표메일: kabsung3@naver.com<p>
                <span style="margin-left:35%; color:gray;">CORYRIGHT DOCKINGJOB 2019 ALL RIGHTS RESESRVED</span>
            </p>
   </footer>


</body>
<!-- slider -->
<script type="text/javascript" src="../js/slider.js"></script>
<!-- slider -->
<!-- jquery-->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</html>
