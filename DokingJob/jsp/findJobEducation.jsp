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

<title>��ŷ��(DockingJob) - �̻����� �ϻ�����  </title>
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

            /*���̵� �޴� �ҽ�*/
            #STATICMENU { 
            margin: 0pt; 
            padding: 0pt;  
            position: absolute; 
            right: 0px; 
            top: 0px;
            }
            /*���̵� �޴� �ҽ�*/
            tr:nth-child(even) {
                background : aliceblue;
            }
        </style>
        <script>
            //���̵� �޴� �ҽ�
            var stmnLEFT = 50; // ������ ���� 
            var stmnGAP1 = 0; // ���� ���� 
            var stmnGAP2 = 550; // ��ũ�ѽ� ������ ���ʰ� �������� �Ÿ� 
            var stmnBASE = 150; // ��ũ�� ������ġ 
            var stmnActivateSpeed = 20; //��ũ���� �ν��ϴ� ������ (���ڰ� Ŭ���� ������ �ν�)
            var stmnScrollSpeed = 10; //��ũ�� �ӵ� (Ŭ���� ����)
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
            document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //ó���� �����ʿ� ��ġ. left�� �ٲ㵵.
            document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
            RefreshStaticMenu();
            }
            function goTop(){
                document.documentElement.scrollTop=0;
            }
            function goBottom(){
                document.documentElement.scrollTop = document.body.scrollHeight;
            }
            //���̵� �޴� �ҽ�  
        </script>
</head>
<body>
	<jsp:useBean id="db" class="jsp.db.DBConnection" scope="application" />
	
	<body style="background:#edf1f8;" onload="InitializeStaticMenu();">
        <!--���̵� �޴�-->
        <table id="STATICMENU">
            <tr><td title="������"><button type="button" onclick="goTop()" style="width:40px; height:30px; background:white;margin:0px;">��</button></td></tr>
            <tr><td title="�ǾƷ���"><button type="button" onclick="goBottom()" style="width:40px; height:30px; background:white;margin:0px;">��</button></td></tr>
        </table>
        <!--���̵� �޴�-->
        <header class = positionHead>
            <table>
                <tr>
                    <td colspan="2" style="width:300px;height:100px;font-size:60px;font-family: 'Jua', sans-serif"><a title="������������ ����" href="../main.html" style="text-decoration:none;">��ŷ��</a></td>
                    <td width="600"></td>
                    <td style="width:250px;font-size:15px;text-align:right; height:80px;font-family:'Noto Sans KR', sans-serif;"><a id = "up" href="../modifyProfile.jsp".html" title="���������� �̵�">����������</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id = "up" href="logout.jsp" title="�α׾ƿ� �ϱ�">�α׾ƿ�</a>&nbsp;&nbsp;</td>
                </tr>
            </table>
        </header>
        <nav class = positionHead> 
            <ul id="ulStyle" >
                <li id="liStyle" title="�������� �̵�" style="margin-left: -30px;"><a href="../ProgramerInfo.html">��������</a></li>
                <li id="liStyle" title="������������ �̵�" style="margin-left: 100px;"><a href="jobEducation_default.jsp">������������</a></li>
                <li id="liStyle" title="������å �̵�" style="margin-left: 100px;"><a href="../supportPolicy.html">������å</a></li>
                <li id="liStyle" title="�ڶ�ȸ �� ä������ �̵�" style="margin-left: 100px;"><a href="jobFair_default.jsp">�ڶ�ȸ �� ä������</a></li>
                <li id="liStyle" title="Ŀ�´�Ƽ �̵�" style="margin-left: 100px;"><a href="../community.html">Ŀ�´�Ƽ</a></li>
            </ul>
    </nav>
        <section class = positionBody>
            <div style="margin-left:44%;">
                <h1>��ü ���� �ȳ�</h1>
            </div>
				<form method="post" action="findJobEducation.jsp">
                <table border="1" style="margin-left: 17px; text-align: center; border-collapse: collapse; border-color: gainsboro;">
                    <tr style="color: black; background: #72bee0;">
                        <th><select name="educationArea" style="width: 100px; height: 40px;">
                            <option value="1">����</option>
                            <option value="����">����</option>
                            <option value="���">���</option>
                            <option value="����">����</option>
                            <option value="��û">��û</option>
                            <option value="����">����</option>
                            <option value="���">���</option>
                            <option value="����">����</option>
                        </select></th>
                        <th><select name="educationType" style="width: 100px; height: 40px; padding: 0%;">
                            <option value="1">��������</option>
                            <option value="������">������</option>
                            <option value="�������">�������</option>
                        </select></th>
                        <th><select name="educationField" style="width: 150px; height: 40px; padding: 0%;">
                            <option value="0">�о�</option>
                            <option value="1">��</option>
                            <option value="2">��</option>
                            <option value="3">��Ʈ��ũ</option>
                            <option value="4">����</option>
                            <option value="5">������</option>
                        </select></th>
                        <th style="width: 1000px;">�п���_������</th>
                        <th style="width: 150px;">������</th>
                        <th style="width: 200px; height: 40px; padding: 0%;">�ƷñⰣ</th>
                        <th style="width: 100px"><input type="image" src="../image/findImage.jpg" style="margin-top: 1px; margin-bottom: -1px;"></th>
                    </tr>
					</form>
	<%
		String name = request.getParameter("name");
		Connection conn = db.SqlConnectionStart(); //����̹� ����
		Statement stmt = null;

		String educationArea = request.getParameter("educationArea");
		String educationType = request.getParameter("educationType");
		String educationField = request.getParameter("educationField");
		String educationDate = request.getParameter("educationDate");
		
		
		
		try {
			if (conn == null) {
				throw new Exception("�����ͺ��̽� ���� ����");
			}
			stmt = conn.createStatement(); //����� ���¿��� stmt��

			//DB�� ����ִ� ������ �����ͼ� rs��ü�� ����(���)
			ResultSet rs = stmt.executeQuery("select * from education");

			if (!rs.next()) {
				out.println("�ش��ϴ� ������ �����ϴ�.");
			} else {
				rs.previous();
			}

			//��ü�� ���� ������ TRUE
			while (rs.next()) {
				String edu_id = rs.getString("edu_id");
				String type = rs.getString("type");
				String interest_job = rs.getString("interest_job");
            	
				String url = rs.getString("url");
				String title = rs.getString("title");
				String application_date = rs.getString("application_date");
				
				String training_date = rs.getString("training_date");
				String region = rs.getString("region");
				String agency = rs.getString("agency");
				String cost = rs.getString("cost");
				
				
            	if (educationArea.equals(region) && educationType.equals(type) && educationField.equals(interest_job)) {
                	if(interest_job.equals("1"))
                		interest_job = "��";
                	else
                		interest_job = "��";
                	
                	if(cost.equals("0"))
                		cost = "���׹���";
                	else
                		 cost = String.format("%,d", Integer.parseInt(cost));
                	
    				
	%>	
					<tr height="50">
						<td><%= region %></td>
						<td><%= type %></td>
						<td><%= interest_job %></td>
						<td><a href="<%=url%>"><%=title %></a></td>
						<td><%=cost %></td>
						<td><%=training_date%></td>
						<td><span style="background:red; padding:5px; height:30px; text-align: center; color:white;">������</span></td>
						
						
					</tr>		
	<%					
				}
			}
		} finally {
		}
	%>
	</table>
                
            </section>
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
        <footer class="positionBody" >
            <hr>
            <p style="font-size:15px;color:gray;">
                <span style="margin-left:4%;">��ȣ: ��ŷ��&nbsp;&nbsp;&nbsp;��ǥ: �̰���&nbsp;&nbsp;&nbsp;�ּ�: ������ ��õ�� �Ѹ����б� 1 [24252]&nbsp;&nbsp;&nbsp;��ȭ��ȣ: 010-1234-5678&nbsp;&nbsp;&nbsp;����ڹ�ȣ: 312-15-00712&nbsp;&nbsp;&nbsp;��ǥ����: kabsung3@naver.com<p>
                <span style="margin-left:35%; color:gray;">CORYRIGHT DOCKINGJOB 2019 ALL RIGHTS RESESRVED</span>
            </p>
        </footer>  

</body>
</html>