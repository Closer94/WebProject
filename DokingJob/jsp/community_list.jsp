<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>
            ��ŷ��(DockingJob) - �̻����� �ϻ�����
        </title>
        <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap&subset=korean" rel="stylesheet">
        <link rel="stylesheet" href="css/community_list.css">

        
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
    
    
    <body style="background:#edf1f8;" onload="InitializeStaticMenu();">
    <!-- �ʿ� java package import, �ڹٺ��� ���� -->
    	<%@ page import="java.util.ArrayList, comm.PostEntity" %>
    	<jsp:useBean id="communityDB" class="comm.CommunityDatabase" scope="page"/>
  	<!-- �ڹٺ��� ���� �� -->
    
        <!--���̵� �޴�-->
        <table id="STATICMENU">
            <tr><td title="������"><button type="button" onclick="goTop()" style="width:40px; height:30px; background:white;margin:0px;">��</button></td></tr>
            <tr><td title="�ǾƷ���"><button type="button" onclick="goBottom()" style="width:40px; height:30px; background:white;margin:0px;">��</button></td></tr>
        </table>
        <!--���̵� �޴�-->
        <header class = "positionHead">
            <table>
                <tr>
                    <td colspan="2" style="width:300px;height:100px;font-size:60px;font-family: 'Jua', sans-serif"><a  id = "titleMenu"  title="������������ ����" href="main.html" style="text-decoration:none;">��ŷ��</a></td>
                    <td width="600"></td>
                    <td style="width:250px;font-size:15px;text-align:right; height:80px;font-family:'Noto Sans KR', sans-serif;"><a id = "titleMenu" href="../modifyProfile.jsp" title="������������ �̵�">����������</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a  id = "titleMenu" href="jsp/logout.jsp" title="�α׾ƿ� �ϱ�">�α׾ƿ�</a>&nbsp;&nbsp;</td>
                </tr>
            </table>
        <nav>
                <ul id="ulStyle">
                    <li id="liStyle" title="�������� �̵�" style="margin-left: -45px;"><a id = "titleMenu"  href="ProgramerInfo.html">��������</a></li>
                    <li id="liStyle" title="������������ �̵�" style="margin-left: 100px;"><a id = "titleMenu"  href="./jsp/jobEducation.jsp">������������</a></li>
                    <li id="liStyle" title="������å �̵�" style="margin-left: 100px;"><a id = "titleMenu"  href="supportPolicy.html">������å</a></li>
                    <li id="liStyle" title="�ڶ�ȸ �� ä������" �̵�" style="margin-left: 100px;"><a id = "titleMenu"  href="./jsp/jobFair_default.jsp">�ڶ�ȸ �� ä������</a></li>
                    <li id="liStyle" title="Ŀ�´�Ƽ �̵�" style="margin-left: 100px;"><a id = "titleMenu"  href="community_list.jsp">Ŀ�´�Ƽ</a></li>
                </ul>
        </nav>
        </header>
        <section class = "positionBody">
        <%
    		// �Խñ� ����� ���� �迭����Ʈ �ڹٺ����̿��� Ȯ��
    		ArrayList<PostEntity> list = communityDB.getPostList();
    		int counter = list.size();
    		int row = 0;
    		
    		if(counter > 0){
    	%>
           <form name='my_form'>
            <table style="margin-left:30px; border-collapse: collapse;">    
                <tr>
                    <th style="width:50px; padding:10px 17px 10px 17px; border-top:1px solid black; border-bottom:1px solid #d3d3d3;">��ȣ</th>
                    <th style="width:100px; padding:10px 200px 10px 315px; border-top:1px solid black; border-bottom:1px solid #d3d3d3;">����</th>
                    <th style="width:100px; padding:10px 17px 10px 17px; border-top:1px solid black; border-bottom:1px solid #d3d3d3;">�ۼ���</th>
                    <th style="width:100px; padding:10px 17px 10px 17px; border-top:1px solid black; border-bottom:1px solid #d3d3d3;">�ۼ���</th>
                    <th style="width:50px; padding:10px 17px 10px 17px; border-top:1px solid black; border-bottom:1px solid #d3d3d3;">��ȸ��</th>
                    <th style="width:50px; padding:10px 17px 10px 17px; border-top:1px solid black; border-bottom:1px solid #d3d3d3;">��õ</th>
                </tr>
                
               <% 
               		for(PostEntity post : list){ // post��ü�� �ϳ��� ��������
               %>               
                <tr style="border-bottom:1px solid #d3d3d3;">
                    <td style="text-align:center; padding-left:-5px; width:68px"><%= post.getId() %></td>
                    <td><a id = "defaultUp" href="post.jsp?id=<%=post.getId()%>"><%= post.getTitle() %></a></td> <!-- post?id=() �������� ()�� �� ����Ʈ ��üid���� �Ķ���ͷ� �����Ͽ� url�ѱ� -->
                    <td style="text-align:center;"><%= post.getWriter_id() %></td>
                    <td style="text-align:center;"><%= post.getDate() %></td>
                    <td style="text-align:center;"><%= post.getViewcnt() %></td>
                    <td style="text-align:center;"><%= post.getGoodcnt() %></td>
                </tr>
                
              <%
               		} // end for
    			} // end if
                
              %>
                <tr style="border-bottom:1px solid #d3d3d3;">
                    <td style="text-align:center; padding-left:-5px;">21523</td>
                    <td><a id = "defaultUp" href="postForm.html">��Ʈ��ũ�����ڰ� �ǰ������� ��Ʈ��ũ ������ �� �𸣰ھ��.��</a></td>
                    <td style="text-align:center;">�뺣�̽�</td>
                    <td style="text-align:center;">2019.07.15</td>
                    <td style="text-align:center;">10</td>
                    <td style="text-align:center;">7</td>
            </table>
        </form>
        </section>
        <div style="margin-top:10px; margin-left:1245px;">
           <input id = "btn" type="button" value="�۾���" onclick="location.href='writeForm.html'"></td>
        </div>

        <section class = "positionBody">
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

        <table style="margin-left:954px; margin-top:10px;">
            <tr>
                <td>
                    <select style="width:100px;height:30px ">
                        <option value="1">����+����</option>
                        <option value="2">����</option>
                        <option value="3">�ۼ���</option>
                        <option value="4">�ڸ�Ʈ����</option>
                        <option value="5">�ڸ�Ʈ�ۼ���</option>
                    </select>
                </td>
                <td><input class="searchInput" type="text" placeholder="  �˻�" style="height:23px;"></td>
                <td><input type="submit" id = 'btn' value ="�˻�" style="height:30px;"></td>
            </tr>
            <tr></tr>
        </table>

        <footer class="positionBody" >
            <hr>
            <p style="font-size:15px;color:gray;">
                <span style="margin-left:4%;">��ȣ: ��ŷ��&nbsp;&nbsp;&nbsp;��ǥ: �̰���&nbsp;&nbsp;&nbsp;�ּ�: ������ ��õ�� �Ѹ����б� 1 [24252]&nbsp;&nbsp;&nbsp;��ȭ��ȣ: 010-1234-5678&nbsp;&nbsp;&nbsp;����ڹ�ȣ: 312-15-00712&nbsp;&nbsp;&nbsp;��ǥ����: kabsung3@naver.com<p>
                <span style="margin-left:35%; color:gray;">CORYRIGHT DOCKINGJOB 2019 ALL RIGHTS RESESRVED</span>
            </p>
        </footer>
    </body>
</html>
