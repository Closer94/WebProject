<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<jsp:useBean id="db" class="jsp.db.DBConnection" />

<%@ page import = "java.sql.*" %>
<%
String id = request.getParameter("id");
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
	
	if(user_interest_job.equals("1"))
		user_interest_job = "À¥";
	else if(user_interest_job.equals("2"))
		user_interest_job = "¾Û";
	
	String query = "select * from jobfair where job_interest= '"+user_interest_job+"' and job_region = '"+user_region+"' limit 10;";
	

		
	rs = stm.executeQuery(query);
%>

     <meta charset="EUC-KR">
        <title> µµÅ·Àâ(DockingJob) - ¹Ì»ý¿¡¼­ ¿Ï»ýÀ¸·Î </title>
        <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap&subset=korean" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../css/jobFair.css">

    </head>
    <body style="background:#edf1f8;">
        <header class="positionHead">
            <table>
                <tr>
                    <td colspan="2" style="width:300px;height:100px;font-size:60px;font-family: 'Jua', sans-serif"><a title="¸ÞÀÎÆäÀÌÁö·Î °¡±â" href="../main.html" style="text-decoration:none;">µµÅ·Àâ</a></td>
                    <td width="600"></td>
                    <td style="width:250px;font-size:15px;text-align:right; height:80px;font-family:'Noto Sans KR', sans-serif;"><a id = "up" href="modifyProfile.jsp".html" title="¸¶ÀÌÆäÀÌÁö ÀÌµ¿">¸¶ÀÌÆäÀÌÁö</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id = "up" href="Logouut.jsp" title="·Î±×¾Æ¿ô ÇÏ±â">·Î±×¾Æ¿ô</a>&nbsp;&nbsp;</td>
                </tr>
            </table>
        <nav>
            <ul id="ulStyle" >
                <li id="liStyle" title="Á÷¾÷Á¤º¸ ÀÌµ¿" style="margin-left: -30px;"><a href="../ProgramerInfo.html">Á÷¾÷Á¤º¸</a></li>
                <li id="liStyle" title="Áö¿ø±³À°Á¤º¸ ÀÌµ¿" style="margin-left: 100px;"><a href="jobEducation_default.jsp">Áö¿ø±³À°Á¤º¸</a></li>
                <li id="liStyle" title="Áö¿øÁ¤Ã¥ ÀÌµ¿" style="margin-left: 100px;"><a href="../supportPolicy.html">Áö¿øÁ¤Ã¥</a></li>
                <li id="liStyle" title="¹Ú¶÷È¸ ¹× Ã¤¿ëÁ¤º¸ ÀÌµ¿" style="margin-left: 100px;"><a href="jobFair_defualt.jsp">¹Ú¶÷È¸ ¹× Ã¤¿ëÁ¤º¸</a></li>
                <li id="liStyle" title="Ä¿¹Â´ÏÆ¼ ÀÌµ¿" style="margin-left: 100px;"><a href="community_list.jsp">Ä¿¹Â´ÏÆ¼</a></li>
            </ul>
        </nav>
        </header>
        <section class = positionBody>
			
            <!--section title -->
            <div class="section-title-wrapper">
                <p class="section-title"><span>¾î¶² ¼¼¹Ì³ª</span>°¡ ÁÁÀ»±î?</p>
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

                <!--silder ï¿½ï¿½ï¿½ï¿½-->
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
                <!--slider ï¿½ï¿½-->
                
                <!--section title -->
            <div class="section-title-wrapper">
                    <p class="section-title"><span>´ç½ÅÀ» À§ÇÑ</span>±¸Á÷Á¤º¸</p>
                    <div class="logo">
                        <img src="../image/carrier_logo.png" alt="carrier_logo">
                    </div>
                </div>
                <!--section title -->

                <hr>
                <!--choice ï¿½ï¿½ï¿½ï¿½-->
				<form method="post" action="findJobInfo.jsp" class="choice">
                    <!--ï¿½ï¿½ï¿½ÉºÐ¾ï¿½ section ï¿½ï¿½ï¿½ï¿½-->
                    <!--checkbox ï¿½ï¿½ï¿½ï¿½-->
                    <input type="checkbox" name="interest" value="1" class="interest" id="interest_1">
                        <label for="interest_1">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>À¥</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox ï¿½ï¿½-->

                    <!--checkbox ï¿½ï¿½ï¿½ï¿½-->
                    <input type="checkbox" name="interest" value="2" class="interest" id="interest_2">
                        <label for="interest_2">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>¾Û</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox ï¿½ï¿½-->
                    <!--ï¿½ï¿½ï¿½ÉºÐ¾ï¿½ section ï¿½ï¿½-->

                    <span>´ç½ÅÀ» À§ÇÑ ±¸Á÷Á¤º¸</span>

                    <!--ï¿½ï¿½ï¿½ï¿½ section ï¿½ï¿½ï¿½ï¿½-->
                    <!--checkbox ï¿½ï¿½ï¿½ï¿½-->
                    <input type="checkbox" name="region" value="¼­¿ï" class="region" id="region_1">
                        <label for="region_1">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>¼­¿ï</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox ï¿½ï¿½-->

                    <!--checkbox ï¿½ï¿½ï¿½ï¿½-->
                    <input type="checkbox" name="region" value="°æ±â" class="region" id="region_2">
                        <label for="region_2">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>°æ±â</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox ï¿½ï¿½-->

                    <!--checkbox ï¿½ï¿½ï¿½ï¿½-->
                    <input type="checkbox" name="region" value="ÃæÃ»" class="region" id="region_3">
                        <label for="region_3">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>ÃæÃ»</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox ï¿½ï¿½-->

                    <!--checkbox ï¿½ï¿½ï¿½ï¿½-->
                    <input type="checkbox" name="region" value="Àü¶ó" class="region" id="region_4">
                        <label for="region_4">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>Àü¶ó</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox ï¿½ï¿½-->

                    <!--checkbox ï¿½ï¿½ï¿½ï¿½-->
                    <input type="checkbox" name="region" value="°æ»ó" class="region" id="region_5">
                        <label for="region_5">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>°æ»ó</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox ï¿½ï¿½-->

                    <!--checkbox ï¿½ï¿½ï¿½ï¿½-->
                    <input type="checkbox" name="region" value="°­¿ø" class="region" id="region_6">
                        <label for="region_6">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>°­¿ø</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox ï¿½ï¿½-->

                    <span>Áö¿ªÀÇ ±¸Á÷Á¤º¸</span>
                    <!--ï¿½ï¿½ï¿½ï¿½ section ï¿½ï¿½-->

                    <!--È®ï¿½Î¹ï¿½Æ°ï¿½ï¿½ï¿½ï¿½-->
                    <!--ï¿½ï¿½Æ° ï¿½ï¿½ï¿½ï¿½-->
                    <button type="submit" class="btn-go">°Ë»ö</button>
			</form>
                <!--choice ï¿½ï¿½-->

                <hr>

				<%
                    while(rs.next()){                     	
                    	String employ_url = rs.getString("job_url");
                    	String title = rs.getString("job_title");
                    	String region = rs.getString("job_region");
                    	
                    //	String start_date = rs.getString("start_date");
                    //	String end_date = rs.getString("end_date");
                    	String agency = rs.getString("job_company");
                    	String img_url = rs.getString("job_img");

                    //	String start_date_temp = start_date.substring(0, 10); 
                    //	String end_date_temp = end_date.substring(0, 10);
        
                    	String applicaiton_date = rs.getString("job_term");
                    	
                    	if(title.length() > 14)
        					title = title.substring(0, 14)+"...";
        				
                    	out.print("<div class='card'>");
                        out.print("<div class='img-section'>");
                        out.print("<img src='"+img_url+"' alt='ÀÌ¹ÌÁö'>");
                        out.print("</div>");
                        out.print("<div class='content'>");
                        out.print("<p class='title'><a href ="+employ_url+">"+title+"</p>");
                    	out.print("<p class='company'>"+agency+"</p>");
                    	out.print("<p class='place'>"+region+"</p>");
                    	out.print("<p class='date'>"+applicaiton_date+"</p>");
                    	out.print("</div></div>");
                    }
                    %>

        </section>
        <footer class="positionBody" >
            <hr>
            <p style="font-size:15px;color:gray;">
                <span style="margin-left:4%;">»óÈ£: µµÅ·Àâ&nbsp;&nbsp;&nbsp;´ëÇ¥: ÀÌ°©¼º&nbsp;&nbsp;&nbsp;ÁÖ¼Ò: °­¿øµµ ÃáÃµ½Ã ÇÑ¸²´ëÇÐ±æ 1 [24252]&nbsp;&nbsp;&nbsp;ÀüÈ­¹øÈ£: 010-1234-5678&nbsp;&nbsp;&nbsp;»ç¾÷ÀÚ¹øÈ£: 312-15-00712&nbsp;&nbsp;&nbsp;´ëÇ¥¸ÞÀÏ: kabsung3@naver.com<p>
                <span style="margin-left:35%; color:gray;">CORYRIGHT DOCKINGJOB 2019 ALL RIGHTS RESESRVED</span>
            </p>
        </footer>
    </body>

<!-- slider ï¿½ï¿½ï¿½ï¿½-->
    <script type="text/javascript" src="../js/slider.js"></script>
<!-- slider ï¿½ï¿½-->
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