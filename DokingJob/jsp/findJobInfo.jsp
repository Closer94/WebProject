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
            ��ŷ��(DockingJob) - �̻����� �ϻ�����
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
   

/*���̵� �޴� �ҽ�*/
#STATICMENU { 
margin: 0pt; 
padding: 0pt;  
position: absolute; 
right: 0px; 
top: 0px;
}
/*���̵� �޴� �ҽ�*/

 /*slider ����*/
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
    /*width:80vw;*/ /*javascript�̿��� slider.offsetWidth px �� �ʱ�ȭ*/ 
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
/*slider ��*/


/*card ����*/
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

/*choice ����*/

/*select icon ����*/
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
        /*�ִϸ��̼ǵ� ����
        animation: circle-fill   ease;
        animation-fill-mode: forwards;*/
   }

   /* �ִϸ��̼ǵ� ����
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
/*select icon ��*/

/*button ����*/
button,
button::after {
transition: width 0.3s ease; /*all ���� ��Ÿ���� �͵� tansition*/
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

/* btn-go ���� */
.btn-go::after {
height: 100%;
left: 0;
top: 0;
width: 0;
}

.btn-go:hover:after {
width: 100%;
}
/*button��*/

/*search app ��*/

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

/*section-title ����*/
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

/*section-title ��*/
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
                    <input type="checkbox" name="region" value="1" class="region" id="region_1">
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
                    <input type="checkbox" name="region" value="2" class="region" id="region_2">
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
                    <input type="checkbox" name="region" value="3" class="region" id="region_3">
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
                    <input type="checkbox" name="region" value="4" class="region" id="region_4">
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
                    <input type="checkbox" name="region" value="5" class="region" id="region_5">
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
                    <input type="checkbox" name="region" value="6" class="region" id="region_6">
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

                <!--choice ��-->
</form>
                 
                <hr>
		<%
			Connection conn = db.SqlConnectionStart(); //����̹� ����
			Statement stmt = null;

			String[] interest = request.getParameterValues("interest"); //������ ���ɺо߸� ����ִ� ����
			
			String[] employRegion = request.getParameterValues("region"); //������ ������ ����ִ� ����
			
			try {
				if (conn == null) {
					throw new Exception("�����ͺ��̽� ���� ����");
				}
				stmt = conn.createStatement(); //����� ���¿��� stmt��

				//DB�� ����ִ� ������ �����ͼ� rs��ü�� ����(���)
				ResultSet rs = stmt.executeQuery("select * from employment where interest_job = '"+interest[0]+"' and region = '"+employRegion[0]+"' limit 10;");
            	
				if (!rs.next()) {
					out.println("�ش��ϴ� ������ �����ϴ�.");
				} else {
					rs.previous();
				}
				//��ü�� ���� ������ TRUE
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
				<img src='<%= img_url %>' alt="īī��">
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
			<span style="margin-left: 4%;">��ȣ: (��)��ŷ��&nbsp;&nbsp;&nbsp;��ǥ:
				�̰���&nbsp;&nbsp;&nbsp;�ּ�: ������ ��õ�� �Ѹ����б� 1
				[24252]&nbsp;&nbsp;&nbsp;��ȭ��ȣ: 010-1234-5678&nbsp;&nbsp;&nbsp;����ڹ�ȣ:
				312-15-00712&nbsp;&nbsp;&nbsp;��ǥ����: kabsung3@naver.com
				<p>
					<span style="margin-left: 35%; color: gray;">CORYRIGHT
						DOCKINGJOB 2019 ALL RIGHTS RESESRVED</span>
				</p>
	</footer>


</body>
<!-- slider ����-->
<script type="text/javascript" src="../js/slider.js"></script>
<!-- slider ��-->
<!-- jquery-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</html>