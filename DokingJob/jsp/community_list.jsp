<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>
            도킹잡(DockingJob) - 미생에서 완생으로
        </title>
        <link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Stylish&display=swap&subset=korean" rel="stylesheet">
        <link rel="stylesheet" href="css/community_list.css">

        
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
    <!-- 필요 java package import, 자바빈즈 선언 -->
    	<%@ page import="java.util.ArrayList, comm.PostEntity" %>
    	<jsp:useBean id="communityDB" class="comm.CommunityDatabase" scope="page"/>
  	<!-- 자바빈즈 선언 끝 -->
    
        <!--사이드 메뉴-->
        <table id="STATICMENU">
            <tr><td title="맨위로"><button type="button" onclick="goTop()" style="width:40px; height:30px; background:white;margin:0px;">▲</button></td></tr>
            <tr><td title="맨아래로"><button type="button" onclick="goBottom()" style="width:40px; height:30px; background:white;margin:0px;">▼</button></td></tr>
        </table>
        <!--사이드 메뉴-->
        <header class = "positionHead">
            <table>
                <tr>
                    <td colspan="2" style="width:300px;height:100px;font-size:60px;font-family: 'Jua', sans-serif"><a  id = "titleMenu"  title="메인페이지로 가기" href="../main.html" style="text-decoration:none;">도킹잡</a></td>
                    <td width="600"></td>
                    <td style="width:250px;font-size:15px;text-align:right; height:80px;font-family:'Noto Sans KR', sans-serif;"><a id = "titleMenu" href="modifyProfile.jsp" title="마이페이지로 이동">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a  id = "titleMenu" href="logout.jsp" title="로그아웃 하기">로그아웃</a>&nbsp;&nbsp;</td>
                </tr>
            </table>
        <nav>
                <ul id="ulStyle">
                    <li id="liStyle" title="직업정보 이동" style="margin-left: -45px;"><a id = "titleMenu"  href="../ProgramerInfo.html">직업정보</a></li>
                    <li id="liStyle" title="지원교육정보 이동" style="margin-left: 100px;"><a id = "titleMenu"  href="jobEducation_default.jsp">지원교육정보</a></li>
                    <li id="liStyle" title="지원정책 이동" style="margin-left: 100px;"><a id = "titleMenu"  href="../supportPolicy.html">지원정책</a></li>
                    <li id="liStyle" title="박람회 및 채용정보" 이동" style="margin-left: 100px;"><a id = "titleMenu"  href="jobFair_default.jsp">박람회 및 채용정보</a></li>
                    <li id="liStyle" title="커뮤니티 이동" style="margin-left: 100px;"><a id = "titleMenu"  href="community_list.jsp">커뮤니티</a></li>
                </ul>
        </nav>
        </header>
        <section class = "positionBody">
        <%
    		// 게시글 목록을 위한 배열리스트 자바빈즈이용해 확보
    		ArrayList<PostEntity> list = communityDB.getPostList();
    		int counter = list.size();
    		int row = 0;
    		
    		if(counter > 0){
    	%>
           <form name='my_form'>
            <table style="margin-left:30px; border-collapse: collapse;">    
                <tr>
                    <th style="width:50px; padding:10px 17px 10px 17px; border-top:1px solid black; border-bottom:1px solid #d3d3d3;">번호</th>
                    <th style="width:100px; padding:10px 200px 10px 315px; border-top:1px solid black; border-bottom:1px solid #d3d3d3;">제목</th>
                    <th style="width:100px; padding:10px 17px 10px 17px; border-top:1px solid black; border-bottom:1px solid #d3d3d3;">작성자</th>
                    <th style="width:100px; padding:10px 17px 10px 17px; border-top:1px solid black; border-bottom:1px solid #d3d3d3;">작성일</th>
                    <th style="width:50px; padding:10px 17px 10px 17px; border-top:1px solid black; border-bottom:1px solid #d3d3d3;">조회수</th>
                    <th style="width:50px; padding:10px 17px 10px 17px; border-top:1px solid black; border-bottom:1px solid #d3d3d3;">추천</th>
                </tr>
                
               <% 
               		for(PostEntity post : list){ // post객체로 하나씩 가져오기
               %>               
                <tr style="border-bottom:1px solid #d3d3d3;">
                    <td style="text-align:center; padding-left:-5px; width:68px"><%= post.getId() %></td>
                    <td><a id = "defaultUp" href="post.jsp?id=<%=post.getId()%>"><%= post.getTitle() %></a></td> <!-- post?id=() 형식으로 ()를 각 포스트 객체id값의 파라미터로 설정하여 url넘김 -->
                    <td style="text-align:center;"><%= post.getWriter_id() %></td>
                    <td style="text-align:center;"><%= post.getDate() %></td>
                    <td style="text-align:center;"><%= post.getViewcnt() %></td>
                    <td style="text-align:center;"><%= post.getGoodcnt() %></td>
                </tr>
                
              <%
               		} // end for
    			} // end if
                
              %>
            </table>
        </form>
        </section>
        <div style="margin-top:10px; margin-left:1245px;">
           <input id = "btn" type="button" value="글쓰기" onclick=location.href="../writeForm.html"></td>
        </div>
		<!-- 
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
		-->
        <table style="margin-left:954px; margin-top:10px;">
			<tr>
                <td>
                    <select style="width:100px;height:30px ">
                        <option value="1">제목+본문</option>
                        <option value="2">제목만</option>
                        <option value="3">작성자</option>
                        <option value="4">코멘트내용</option>
                        <option value="5">코멘트작성자</option>
                    </select>
                </td>
                <td><input class="searchInput" type="text" placeholder="  검색" style="height:23px;"></td>
                <td><input type="submit" id = 'btn' value ="검색" style="height:30px;"></td>
            </tr>
            <tr></tr>
        </table>

        <footer class="positionBody" >
            <hr>
            <p style="font-size:15px;color:gray;">
                <span style="margin-left:4%;">상호: 도킹잡&nbsp;&nbsp;&nbsp;대표: 이갑성&nbsp;&nbsp;&nbsp;주소: 강원도 춘천시 한림대학길 1 [24252]&nbsp;&nbsp;&nbsp;전화번호: 010-1234-5678&nbsp;&nbsp;&nbsp;사업자번호: 312-15-00712&nbsp;&nbsp;&nbsp;대표메일: kabsung3@naver.com<p>
                <span style="margin-left:35%; color:gray;">CORYRIGHT DOCKINGJOB 2019 ALL RIGHTS RESESRVED</span>
            </p>
        </footer>
    </body>
</html>
