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
		<link rel="stylesheet" href="css/post_detail.css">
		
        
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

            var count1=0;
            var checkMul1=0;
            var count2=0;
            var checkMul2=0;
            function changeBackground1(obj){
                if (count1 == 0){
                    if(checkMul2 == 1){
                    alert('�ϳ��� ���ð����մϴ�.');
                    }
                    else{
                        obj.style.background = "red";
                        count1=1;
                        checkMul1=1;
                    }
                }
                else{
                    obj.style.background = "#5892f9";
                    count1=0;
                    checkMul1=0;
                }
            }

            function changeBackground2(obj){
                if (count2 == 0){
                    if(checkMul1 == 1){
                    alert('�ϳ��� ���ð����մϴ�.');
                    }
                    else{
                        obj.style.background = "red";
                        count2=1;
                        checkMul2=1;
                    }
                }
                else{
                    obj.style.background = "#5892f9";
                    count2=0;
                    checkMul2=0;
                }
            }
        </script>
    </head>
    <body style="background:#edf1f8;" onload="InitializeStaticMenu();">
    	<!-- �ʿ� java package import, �ڹٺ��� ���� -->
    	<%@page import ="java.util.ArrayList, comm.PostEntity"  %>
    	<jsp:useBean id="communityDB" class="comm.CommunityDatabase" scope="page"/>
    	<!-- �ڹٺ��� ���� �� -->
    	
    	
        <!--���̵� �޴�-->
        <table id="STATICMENU">
            <tr><td title="������"><button type="button" onclick="goTop()" style="width:40px; height:30px; background:white;margin:0px;">��</button></td></tr>
            <tr><td title="�ǾƷ���"><button type="button" onclick="goBottom()" style="width:40px; height:30px; background:white;margin:0px;">��</button></td></tr>
        </table>
        <!--���̵� �޴�-->
        
        <header class = positionHead>
            <table>
                <tr>
                    <td colspan="2" style="width:300px;height:100px;font-size:60px;font-family: 'Jua', sans-serif"><a title="������������ ����" href="main.html" style="text-decoration:none;">��ŷ��</a></td>
                    <td width="600"></td>
                    <td style="width:250px;font-size:15px;text-align:right; height:80px;font-family:'Noto Sans KR', sans-serif;"><a id = "up" href="main.html" title="���������� �̵�">����������</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id = "up" href="jsp/logout.jsp" title="�α׾ƿ� �ϱ�">�α׾ƿ�</a>&nbsp;&nbsp;</td>
                </tr>
            </table>
        </header>
        <nav class = positionHead>
            <ul id="ulStyle" >
                <li id="liStyle" title="�������� �̵�" style="margin-left: -30px;"><a href="ProgramerInfo.html">��������</a></li>
                <li id="liStyle" title="������������ �̵�" style="margin-left: 100px;"><a href="jobEducation.html">������������</a></li>
                <li id="liStyle" title="������å �̵�" style="margin-left: 100px;"><a href="supportPolicy.html">������å</a></li>
                <li id="liStyle" title="�ڶ�ȸ �� ä������ �̵�" style="margin-left: 100px;"><a href="jobFair.html">�ڶ�ȸ �� ä������</a></li>
                <li id="liStyle" title="Ŀ�´�Ƽ �̵�" style="margin-left: 100px;"><a href="community_list.jsp">Ŀ�´�Ƽ</a></li>
            </ul>
        </nav>
        
        <div style="margin-left:290px; border: 1px solid white; width:937px; background: white">
        
        <% // url request�� post id�� Ȯ��
    		String id = request.getParameter("id"); //url�󿡼� [post?id=()]�� �Ľ� -> ���� id
    		if(id!=null){ // id�� ��û�� �ִ°��(= ����� �ƴѰ��)
    			int postId = Integer.parseInt(id); // postId�� ���� getPost(Postid)�� �̿��� �Խñ� ������������
    			PostEntity post = communityDB.getPost(postId); // �ش� id�� �ڹٺ��� �޼ҵ带 ���� ��ü��������
    	%>
        
        
        
        <!-- �� post ���� ���� -->
            <table>
                <tr><td style="font-size:30px; font-weight: bold; color:#3493ff;">Ŀ�´�Ƽ</td></tr>
                <tr><td style="height:30px;">&nbsp;</td></tr>
                <tr><td style="font-weight: bold; font-size:25px;"><%=post.getTitle() %></td></tr>
                <tr><td style="border-top:2px solid #2e4361; background:#f1f7ff; padding:10px 0px 10px 0px;">&nbsp;<%=post.getWriter_id() %><span style="font-size:13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ȸ��: <%=post.getViewcnt() %></span>&nbsp;&nbsp;<span style="font-size:13px;"><%=post.getDate() %></span></td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr><td>&nbsp;</td></tr>
                <tr name = "contents">
                    <td>
                        <%=post.getContent() %>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr><td>&nbsp;</td></tr>
                <tr><td>&nbsp;</td></tr>
            </table>
       <!-- �� post ���� �� -->

            <div style="margin-top:20px;margin-left:345px;">
                <input type="button" id="btn" value="��õ" onclick="changeBackground1(this)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="btn" value="����õ" onclick="changeBackground2(this)">
            </div>
            <div style="height:40px;">&nbsp;</div>
            <hr style="border: solid 0.5px gray; width:900px;">
            <div style="font-size: 20px; margin:30px;">��� <span style="color:#04b4ae;">2</div>

            <table style="margin:30px;">
                <tr>
                    <td>
                        <textarea cols="90" rows="5" onclick="this.value=''">����� �����ּ���.</textarea>
                    </td>
                    <td><input type="submit" value="��۳����" id="writeCommentBtn"></td>
                </tr>
            </table>

            <table style="margin:18px; width:900px;">
                <tr><td style="background:#f1f1f1; font-size:13px; padding:10px 0 10px 0;">����������������</td></tr>
                <tr><td style="padding:10px 0 10px 10px; font-size:15px;">�����ι��� �����̳׿�.</td></tr>
                <tr><td style="background:#f1f1f1; font-size:13px; padding:10px 0 10px 0;">���۽��Ի��</td></tr>
                <tr><td style="padding:10px 0 10px 10px; font-size:15px;">������</td></tr>
            </table>
            
            
        <% 
    		} // end : id!=null // ����� �ƴѰ��
    		
    		else{ // ���ο� post�� ����ϴ� ���
    	%>
    	
    	<h1>��û�Ͻ� post ID���� �����ϴ�!</h1>
    	
    	<%   		
    		} // end if : id=null/ //���ο� post ����� ���
    	%>
    	
        </div>

        <footer class="positionBody" >
            <hr>
            <p style="font-size:15px;color:gray;">
                <span style="margin-left:4%;">��ȣ: (��)��ŷ��&nbsp;&nbsp;&nbsp;��ǥ: �̰���&nbsp;&nbsp;&nbsp;�ּ�: ������ ��õ�� �Ѹ����б� 1 [24252]&nbsp;&nbsp;&nbsp;��ȭ��ȣ: 010-1234-5678&nbsp;&nbsp;&nbsp;����ڹ�ȣ: 312-15-00712&nbsp;&nbsp;&nbsp;��ǥ����: kabsung3@naver.com<p>
                <span style="margin-left:35%; color:gray;">CORYRIGHT DOCKINGJOB 2019 ALL RIGHTS RESESRVED</span>
            </p>
        </footer>
    </body>

</html>
