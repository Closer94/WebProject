<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
 <jsp:useBean id="db" class="jsp.db.DBConnection" />
	<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="EUC-KR">
        <title> 도킹잡(DockingJob) 마이페이지 </title>
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
            #addressbtn{
                background-color: #edf1f8;
                width: 100px;
                height: 25px;
                border: 1px solid darkgray;
                outline: none;
            }

            #addressbtn:hover{
                text-decoration:none;
                background: gray;
                color: white;
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

            function changeEmail(){
                var target = document.getElementById("selectEmail");
                var inputEmail = document.getElementById("email2");

                inputEmail.value = target.options[target.selectedIndex].text;
            }

            function completeModify(){
                alert('정보수정이 완료되었습니다.')
            }
        </script>
    </head>
    
    <body style="background:#edf1f8;" class = positionBody>
 
	<%
	String url = "../logIn.html";
	   
	String user_id = (String)session.getAttribute("user_id");
	if(user_id == null || user_id.equals(""))
		response.sendRedirect(url);
	else{
		Connection conn = db.SqlConnectionStart();
		Statement stm = null;
		ResultSet rs = null;

		String name = "";
		String password = "", interest= "", region="", email="", email_check="";
		
		try{
			stm = conn.createStatement();
			
			String query = "select * from user where user_id = '"+user_id+"';";
			rs = stm.executeQuery(query);
			
			while(rs.next()){
				password = rs.getString("password");
				name = rs.getString("nickname");
				interest = rs.getString("interest");
				region = rs.getString("region");
				email = rs.getString("email");
				email_check = rs.getString("email_check");
			}
	
	%>
	
        <div class = positionHead>
                <table style="margin-top:-120px; margin-left:-150px;">
                    <tr>
                        <td colspan="2" style="width:300px;height:100px;font-size:30px;font-family: 'Jua', sans-serif"><a id = "up" title="메인페이지로 가기" href="../main.html" style="text-decoration:none;">도킹잡</a></td>
                        <td width="600"></td>
                        <td style="width:250px;font-size:15px;text-align:right; height:80px;font-family:'Noto Sans KR', sans-serif;"><a id = "up" href="modifyProfile.jsp" title="마이페이지 이동">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id = "up" href="logout.jsp" title="로그아웃 하기">로그아웃</a>&nbsp;&nbsp;</td>
                    </tr>
                </table>
        </div>
        <form action="myinfo_change.jsp" method="post">
        <div class = positionHead>
            <table style="margin-top:-40px; margin-left:-100px;">
                <tr>
                    <td colspan="2" style="width:280px;height:100px;font-size:40px;font-family: 'Jua', sans-serif; text-decoration:none; color: black;">마이페이지</td>
                    <!--<td style="width:120px;height:100px;font-size:20px;font-family: 'Jua', sans-serif"><a id = "menuUp" title="나의 활동 페이지 이동" href="myPage_myActive1.html" >나의 활동</a></td>-->
                    <td style="width:150px;height:100px;font-size:20px;font-family: 'Jua', sans-serif"><a id = "menuUp" title="개인정보수정 페이지 이동" href="modifyProfile.jsp" >개인정보수정</a></td>
                    <td style="width:150px;height:100px;font-size:20px;font-family: 'Jua', sans-serif"><a id = "menuUp" title="비밀번호 변경 페이지 이동" href="modifyPassword.jsp" >비밀번호 변경</a></td>
                    <td style="width:150px;height:100px;font-size:20px;font-family: 'Jua', sans-serif"><a id = "menuUp" title="회원 탈퇴 페이지 이동" href="deleteAccount.jsp" >회원 탈퇴</a></td>
                </tr>
            </table>
        </div>
        <div>
            &nbsp;
        </div>
        <div style="margin-top:-40px; width:1025px; margin-left:81px;"">
            <hr style="border: solid 1.5px black;">
        </div>
        <table style="margin-left:80px; border-collapse: collapse;">
                <tr><td style="font-size:30px; padding:5px;">회원정보수정</td></tr>
            <tr><td colspan="2" style="padding:5px;"><span style="font-size:20px"> <%= name %> </span><span style="color:gray;">님의 회원가입 시 입력한 정보를 수정하실 수 있습니다.</span></td></tr>
            <tr><td>&nbsp;</td></tr>
            <%
            String temp = "<tr><td style='text-align:center; background-color:#f9f9f9; padding:10px; border-bottom:1px solid #d3d3d3;'>닉네임</td>"+
            "<td style='border-bottom:1px solid #d3d3d3;'><input type='text' name='nickname' id='nickname' value='"+name+"' style='width:100px; height:20px; margin-left:20px;padding-left:10px; readonly'></td></tr>";
            out.println(temp);
            %>
            
            <tr>
              <td style="text-align:center; background-color:#f9f9f9; padding:10px; border-bottom:1px solid #d3d3d3;">아이디</td>
           	  <td style="padding-left:20px; border-bottom:1px solid #d3d3d3;"><%= user_id %></td>
            </tr>
            <tr><td style="text-align:center; background-color:#f9f9f9; padding:10px; border-bottom:1px solid #d3d3d3;">관심 분야</td>
                <td style="border-bottom:1px solid #d3d3d3;">
                    <select name="interest" id="interest" style="width:120px; height:25px; margin-left:20px;">
                    <%
                    	if(interest.equals("1")){
                    %>
                       <option selected value="1">웹</option>
                        <option value="2">앱</option>
                        <option value="3">네트워크</option>
                        <option value="4">정보보안</option>
                        <option value="5">데이터베이스</option>
                    <%
                    	}else if(interest.equals("2")){
                    %> 
                        <option value="1">웹</option>
                        <option selected value="2">앱</option>
                        <option value="3">네트워크</option>
                        <option value="4">정보보안</option>
                        <option value="5">데이터베이스</option>
                     <%
                    	}else{
                    %>  
                    	<option value="1">웹</option>
                        <option value="2">앱</option>
                        <option selected value="3">네트워크</option>
                        <option value="4">정보보안</option>
                        <option value="5">데이터베이스</option>
                   <%
                    	}
                    %>
                        
                        
                    </select>
                </td>
            </tr>
            <tr>
                <td style="text-align:center; background-color:#f9f9f9; padding:10px; border-bottom:1px solid #d3d3d3;">이메일 주소</td>
                <td style="border-bottom:1px solid #d3d3d3;">
                	<%
	                    int index = email.indexOf("@");                 
	                    String mail_01 = email.substring(0, index);
	                    String mail_02 = email.substring(index+1);
	                    temp = "<input type='text' name = 'email1' id = 'email1' value='"+mail_01+"' style='width:120px; height:20px; margin-left:20px;padding-left:10px;'>";
	                    
	                    out.print(temp);
	                    out.print("<span>@</span>");

	                    temp = "<input type='text' name = 'email2' id = 'email2' value='"+mail_02+"' style='width:120px; height:20px; margin-left:3px;padding-left:10px;'>";
	                    out.print(temp);
	                    
					%>
                	<select name="selectEmail" id = "selectEmail" onchange=changeEmail() style="width:180px; height:25px; margin-left:10px;">
                        <option selected value="1">직접입력</option>
                        <option value="2">daum.net</option>
                        <option value="3">naver.com</option>
                        <option value="4">hotmail.com</option>
                        <option value="5">gmail.com</option>
                        <option value="6">empal.com</option>
                        <option value="7">dreamwiz.com</option>
                        <option value="8">korea.com</option>
                    </select>
                </td>
            </tr>
    
            <%
            	if(email_check.equals("1")){
			%>
        			<tr>
                    <td rowspan="2" style="text-align:center; background-color:#f9f9f9; padding:10px; border-bottom:1px solid #d3d3d3;">이메일 수신 여부</td>
                    <td style="padding-left:20px;">
                    <input type="radio" checked name="smsReception">수신동의<span style="font-size:12px; color:gray"> (광고성 정보에 대한 동의 포함)</span>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left:20px; border-bottom:1px solid #d3d3d3;">
                    	<input type="radio" name="smsReception">수신하지 않음<span style="font-size:12px; color:gray"> (교육정보, 박람회 정보, 채용정보, 지원정책정보 등 중요한 정보를 받으실 수 있습니다.)</span>
                    </td>
                </tr>
           <% 
            	}
            	else{
           %>
        			<tr>
                    <td rowspan="2" style="text-align:center; background-color:#f9f9f9; padding:10px; border-bottom:1px solid #d3d3d3;">이메일 수신 여부</td>
                    <td style="padding-left:20px;">
                    <input type="radio" name="smsReception">수신동의<span style="font-size:12px; color:gray"> (광고성 정보에 대한 동의 포함)</span>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left:20px; border-bottom:1px solid #d3d3d3;">
                    <input type="radio" checked name="smsReception">수신하지 않음<span style="font-size:12px; color:gray"> (교육정보, 박람회 정보, 채용정보, 지원정책정보 등 중요한 정보를 받으실 수 있습니다.)</span>
                    </td>
                </tr>
            <%	
            	}
            %>

            <tr><td style="text-align:center; background-color:#f9f9f9; padding:10px; border-bottom:1px solid #d3d3d3;">주거 지역</td>
                <td style="border-bottom:1px solid #d3d3d3;">
                    <select name="region" id="region" style="width:120px; height:25px; margin-left:20px;">
			<%	
				if(region.equals("서울")){
			%>
                        <option selected value="1">서울</option>
                        <option value="2">경기</option>
                        <option value="3">강원</option>
                        <option value="4">충청</option>
                        <option value="5">전라</option>
                        <option value="5">경상</option>
			<%
				}else if(region.equals("경기")){
            %>
                    	<option value="1">서울</option>
                        <option selected value="2">경기</option>
                        <option value="3">강원</option>
                        <option value="4">충청</option>
                        <option value="5">전라</option>
                        <option value="5">경상</option> 
			<%
				}else if(region.equals("강원")){
			%>
                    	<option value="1">서울</option>
                        <option value="2">경기</option>
                        <option selected value="3">강원</option>
                        <option value="4">충청</option>
                        <option value="5">전라</option>
                        <option value="5">경상</option>
       		<%
				}else if(region.equals("충청")){
			%>     
                    	<option value="1">서울</option>
                        <option value="2">경기</option>
                        <option value="3">강원</option>
                        <option selected value="4">충청</option>
                        <option value="5">전라</option>
                        <option value="5">경상</option>  
       		<%
				}else if(region.equals("전라")){
			%>  
                    	<option value="1">서울</option>
                        <option value="2">경기</option>
                        <option value="3">강원</option>
                        <option value="4">충청</option>
                        <option selected value="5">전라</option>
                        <option value="5">경상</option>
       		<%
				}else{
			%>  
                    	<option value="1">서울</option>
                        <option value="2">경기</option>
                        <option value="3">강원</option>
                        <option value="4">충청</option>
                        <option value="5">전라</option>
                        <option selected value="5">경상</option> 
			<%
				}
			%>
                    </select>
                </td>
            </tr>
            
            <tr>
                <tr><td colspan="2" style="border-bottom:1px solid #d3d3d3; padding: 10px 0px 10px 0px;">
                    <bold style="font-size:13px; font-weight: bold;">* 이메일주소가 잘못 기재되어 있으면 도킹잡의 업데이트 정보를 받을 수 없으니 기재하신 회원정보를 반드시 확인하시기 바랍니다.</bold>
               </td></tr>
            </tr>
        </table>
        <div style="margin-top:20px;margin-left:480px;">
            <input type="submit" id="btn" value="수정하기" onclick='completeModify()'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="btn" value="취소">
        </div>
		</form>
		
        <footer class="positionBody" >
            <hr>
            <p style="font-size:15px;color:gray;">
                <span style="margin-left:4%;">상호: 도킹잡&nbsp;&nbsp;&nbsp;대표: 이갑성&nbsp;&nbsp;&nbsp;주소: 강원도 춘천시 한림대학길 1 [24252]&nbsp;&nbsp;&nbsp;전화번호: 010-1234-5678&nbsp;&nbsp;&nbsp;사업자번호: 312-15-00712&nbsp;&nbsp;&nbsp;대표메일: kabsung3@naver.com<p>
                <span style="margin-left:35%; color:gray;">CORYRIGHT DOCKINGJOB 2019 ALL RIGHTS RESESRVED</span>
            </p>
        </footer>        
	<%
		}
		catch(Exception e){
			out.println(e.getMessage());
		}
		finally{
			if(rs != null)			rs.close();
			if(stm != null)			stm.close();
			if(conn != null)		conn.close();
		}
	}	
	%>

    </body>
</html>
