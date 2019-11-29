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

//�α��� �ߴ��� ���ߴ��� Ȯ��
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
	
	String query = "select * from employment where interest_job = '"+user_interest_job+"' and region = '"+user_region+"' limit 10;";
	rs = stm.executeQuery(query);
%>

     <meta charset="EUC-KR">
        <title>
            ��ŷ��(DockingJob) - �̻����� �ϻ�����
        </title>
        <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap&subset=korean" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../css/jobFair.css">

    </head>
    <body style="background:#edf1f8;">
        <header class="positionHead">
            <table>
                <tr>
                    <td colspan="2" style="width:300px;height:100px;font-size:60px;font-family: 'Jua', sans-serif"><a title="������������ ����" href="../main.html" style="text-decoration:none;">��ŷ��</a></td>
                    <td width="600"></td>
                    <td style="width:250px;font-size:15px;text-align:right; height:80px;font-family:'Noto Sans KR', sans-serif;"><a id = "up" href="../modifyProfile.jsp" title="���������� �̵�">����������</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id = "up" href="logout.jsp" title="�α׾ƿ� �ϱ�">�α׾ƿ�</a>&nbsp;&nbsp;</td>
                </tr>
            </table>
        <nav>
            <ul id="ulStyle" >
                <li id="liStyle" title="�������� �̵�" style="margin-left: -10px;"><a href="../ProgramerInfo.html">��������</a></li>
                <li id="liStyle" title="������������ �̵�" style="margin-left: 100px;"><a href="jobEducation_default.jsp">������������</a></li>
                <li id="liStyle" title="������å �̵�" style="margin-left: 100px;"><a href="../supportPolicy.html">������å</a></li>
                <li id="liStyle" title="�ڶ�ȸ �� ä������ �̵�" style="margin-left: 100px;"><a href="jobFair_default.jsp">�ڶ�ȸ �� ä������</a></li>
                <li id="liStyle" title="Ŀ�´�Ƽ �̵�" style="margin-left: 100px;"><a href="../community.html">Ŀ�´�Ƽ</a></li>
            </ul>
        </nav>
        </header>

        <section class = positionBody>

            <!--section title -->
            <div class="section-title-wrapper">
                <p class="section-title"><span>� ���̳�</span>�� ������?</p>
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


                <!--silder ����-->
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
                <!--slider ��-->
                
                <!--section title -->
            <div class="section-title-wrapper">
                    <p class="section-title"><span>����� ����</span> ��������</p>
                    <div class="logo">
                        <img src="../image/carrier_logo.png" alt="carrier_logo">
                    </div>
                </div>
                <!--section title -->

                <hr>
                <!--choice ����-->
				<form method="post" action="findJobInfo.jsp" class="choice">
                    <!--���ɺо� section ����-->
                    <!--checkbox ����-->
                    <input type="checkbox" name="interest" value="1" class="interest" id="interest_1">
                        <label for="interest_1">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>��</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox ��-->

                    <!--checkbox ����-->
                    <input type="checkbox" name="interest" value="2" class="interest" id="interest_2">
                        <label for="interest_2">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>��</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox ��-->
                    <!--���ɺо� section ��-->

                    <span>�����ڸ� ����</span>

                    <!--���� section ����-->
                    <!--checkbox ����-->
                    <input type="checkbox" name="region" value="����" class="region" id="region_1">
                        <label for="region_1">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>����</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox ��-->

                    <!--checkbox ����-->
                    <input type="checkbox" name="region" value="���" class="region" id="region_2">
                        <label for="region_2">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>���</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox ��-->

                    <!--checkbox ����-->
                    <input type="checkbox" name="region" value="��û" class="region" id="region_3">
                        <label for="region_3">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>��û</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox ��-->

                    <!--checkbox ����-->
                    <input type="checkbox" name="region" value="����" class="region" id="region_4">
                        <label for="region_4">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>����</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox ��-->

                    <!--checkbox ����-->
                    <input type="checkbox" name="region" value="���" class="region" id="region_5">
                        <label for="region_5">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>���</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox ��-->

                    <!--checkbox ����-->
                    <input type="checkbox" name="region" value="����" class="region" id="region_6">
                        <label for="region_6">
                            <div class="icon">
                                <div class="box">
                                    <svg>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                        <circle cx="50%" cy="50%" r="40%"></circle>
                                    </svg>
                                    <div class="title">
                                        <p>����</p>
                                    </div>
                                </div>
                            </div>
                        </label>
                    </input>
                    <!--checkbox ��-->

                    <span>������ ��������</span>
                    <!--���� section ��-->

                    <!--Ȯ�ι�ư����-->
                    <!--��ư ����-->
                    <button type="submit" class="btn-go">�˻�</button>
</form>
                <!--choice ��-->

                <hr>

				<%
                    while(rs.next()){ 
                    	String employ_url = rs.getString("url");
                    	String title = rs.getString("title");
                    	String region = rs.getString("region");
                    	
                    	String start_date = rs.getString("start_date");
                    	String end_date = rs.getString("end_date");
                    	String agency = rs.getString("agency");
                    	String img_url = rs.getString("img_url");

                    	String start_date_temp = start_date.substring(0, 10); 
                    	String end_date_temp = end_date.substring(0, 10);
        
                    	String applicaiton_date = start_date_temp+" ~ " + end_date_temp;
                    	
                    	if(title.length() > 14)
        					title = title.substring(0, 14)+"...";
        				
                    	out.print("<div class='card'>");
                        out.print("<div class='img-section'>");
                        out.print("<img src='"+img_url+"' alt='��������'>");
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
                <span style="margin-left:4%;">��ȣ: (��)��ŷ��&nbsp;&nbsp;&nbsp;��ǥ: �̰���&nbsp;&nbsp;&nbsp;�ּ�: ������ ��õ�� �Ѹ����б� 1 [24252]&nbsp;&nbsp;&nbsp;��ȭ��ȣ: 010-1234-5678&nbsp;&nbsp;&nbsp;����ڹ�ȣ: 312-15-00712&nbsp;&nbsp;&nbsp;��ǥ����: kabsung3@naver.com<p>
                <span style="margin-left:35%; color:gray;">CORYRIGHT DOCKINGJOB 2019 ALL RIGHTS RESESRVED</span>
            </p>
        </footer>
    </body>

<!-- slider ����-->
    <script type="text/javascript" src="../js/slider.js"></script>
<!-- slider ��-->
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