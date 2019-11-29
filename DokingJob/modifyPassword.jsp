<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="EUC-KR">
        <title>
            ��ŷ�� ����������
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
                margin-top: 110px;
            }
            #up {
                display: inline-block;
                transition: .3s;
                -webkit-transform: scale(1);
                transform: scale(1);
                text-decoration: none;
                color: #000000;
            }
            #up:hover {
                -webkit-transform: scale(1.1);
                transform: scale(1.1);
                text-decoration: underline;

            }
            #menuUp {
                text-decoration:none;
                color: black;
            }
            #menuUp:hover{
                color: #4a94f2;
            }
            #defaultUp{
                text-decoration:none;
                color: black;
            }
            #defaultUp:hover{
                text-decoration:underline;
            }
            #btn{
                background-color: #5892f9;
                width: 100px;
                height: 50px;
                border: 1px solid darkgray;
                outline: none;
                color: white;
                font-weight: bold;

            }
            #btn:hover{
                text-decoration:none;
                background: white;
                color: #5892f9;
                font-weight: bold;
                transition: all 0.3s ease;
            }
        </style>
        <script>
            var n = 1
            function check_all() {
                if(n == 1){
                    n--;
                    for(i=0; i < my_form.mycheck.length; i++) {
                            my_form.mycheck[i].checked = true;
                    }
                }
                else{
                    n++;
                    for(i=0; i < my_form.mycheck.length; i++) {
                    my_form.mycheck[i].checked = false;
                    }
                }
            }
            function completeModify(){

                alert('��й�ȣ ������ �Ϸ�Ǿ����ϴ�.')
            }
        </script>
    </head>
    <body style="background:#edf1f8;" class = positionBody>
        <div class = positionHead>
                <table style="margin-top:-120px; margin-left: -150px;">
                    <tr>
                        <td colspan="2" style="width:300px;height:100px;font-size:30px;font-family: 'Jua', sans-serif"><a id = "up" title="������������ ����" href="main.html" style="text-decoration:none;">��ŷ��</a></td>
                        <td width="600"></td>
                        <td style="width:250px;font-size:15px;text-align:right; height:80px;font-family:'Noto Sans KR', sans-serif;"><a id = "up" href="modifyProfile.jsp" title="���������� �̵�">����������</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id = "up" href="jsp/logout.jsp" title="�α׾ƿ� �ϱ�">�α׾ƿ�</a>&nbsp;&nbsp;</td>
                    </tr>
                </table>
        </div>
        <div class = positionHead>
            <table style="margin-top:-40px; margin-left:-100px;">
                <tr>
                    <td colspan="2" style="width:280px;height:100px;font-size:40px;font-family: 'Jua', sans-serif; text-decoration:none; color: black;">����������</td>
                    <!--<td style="width:120px;height:100px;font-size:20px;font-family: 'Jua', sans-serif"><a id = "menuUp" title="���� Ȱ�� ������ �̵�" href="myPage_myActive1.html" >���� Ȱ��</a></td>-->
                    <td style="width:150px;height:100px;font-size:20px;font-family: 'Jua', sans-serif"><a id = "menuUp" title="������������ ������ �̵�" href="modifyProfile.jsp" >������������</a></td>
                    <td style="width:150px;height:100px;font-size:20px;font-family: 'Jua', sans-serif"><a id = "menuUp" title="��й�ȣ ���� ������ �̵�" href="modifyPassword.jsp" >��й�ȣ ����</a></td>
                    <td style="width:150px;height:100px;font-size:20px;font-family: 'Jua', sans-serif"><a id = "menuUp" title="ȸ�� Ż�� ������ �̵�" href="deleteAccount.jsp" >ȸ�� Ż��</a></td>
                </tr>
            </table>
        </div>
        <div>
            &nbsp;
        </div>
        <div style="margin-top:-40px; width:1025px; margin-left:81px;"">
            <hr style="border: solid 1.5px black;">
        </div>
        <table style="margin-top:40px; margin-left:120px; border-collapse: collapse;">
                <tr><td rowspan="3"><img src="image/modifyPassword.JPG"></td><td style="font-size:25px; font-weight: bold;">&nbsp;&nbsp;�ֱ�����<span style="color:#5297f2;">(6����)</span>��й�ȣ ������ ���� ���������� �����ϰ� ��ȣ�ϼ���.</td></tr>
        </table>
        <form method='post' action='jsp/myinfo_change.jsp'>
            <fieldset style="width:800px; margin-top:10px; margin-left:180px; border-collapse: collapse; border-color:#e7e7e7;">
                <legend style="font-size:20px; font-weight: bold; text-align: center;">[��й�ȣ ����]</legend>
                <table style="margin-left: 30px; margin-top: 40px;">
                    <tr>
                        <td style="font-weight:bold;">���� ��й�ȣ &nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td colspan="3" style="padding:0.6em; border: 1px solid #dadada;background-color: white;">
                            <input type="password" name='old_password' id='old_password' placeholder="���� ��й�ȣ�� �Է��� �ּ���." size ="40" style="border-style:none; height:25px; font-size:15px;">
                        </td>
                    </tr>
                    <tr>
                        <td style="padding:10px;">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="font-weight:bold;">�� ��й�ȣ &nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td colspan="3" style="padding:0.6em; border: 1px solid #dadada;background-color: white;">
                            <input type="password" name='new_password' id='new_password' placeholder="�� ��й�ȣ�� �Է��� �ּ���." size ="40" style="border-style:none; height:25px; font-size:15px;">
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td><img src="image/passwordTip.jpg"></td>
                        <td colspan="2">
                            <ui>
                                <li style="font-size:14px; font-weight: bold; color: #797a7c;">��й�ȣ�� 8~32���� ���� ��/�ҹ���, ����, Ư�����ڸ� �����Ͽ� ����Ͻ� �� �־��!</li>
                                <li style="font-size:14px; font-weight: bold; color: #797a7c;">���� ��й�ȣ�� ���� ���� ����Ʈ�� ��й�ȣ�� ���� ���, ����Ǳ� �����ϴ�.</li>
                                <li style="font-size:14px; font-weight: bold; color: #797a7c;">��й�ȣ�� Ư�����ڸ� �߰��Ͽ� ����Ͻø� ����ϱ⵵ ����, ��й�ȣ �������� �������ϴ�.</li>
                            </ui>
                        </td>
                    </tr>
                </table>
            </fieldset>
        
        <div style="margin-top:20px;margin-left:480px;">
            <input type="submit" id="btn" value="�����ϱ�" onclick='completeModify()'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="btn" value="���">
        </div>
        </form>
        <footer class="positionBody" >
            <hr>
            <p style="font-size:15px;color:gray;">
                <span style="margin-left:4%;">��ȣ: ��ŷ��&nbsp;&nbsp;&nbsp;��ǥ: �̰���&nbsp;&nbsp;&nbsp;�ּ�: ������ ��õ�� �Ѹ����б� 1 [24252]&nbsp;&nbsp;&nbsp;��ȭ��ȣ: 010-1234-5678&nbsp;&nbsp;&nbsp;����ڹ�ȣ: 312-15-00712&nbsp;&nbsp;&nbsp;��ǥ����: kabsung3@naver.com<p>
                <span style="margin-left:35%; color:gray;">CORYRIGHT DOCKINGJOB 2019 ALL RIGHTS RESESRVED</span>
            </p>
        </footer>
    </body>
</html>
