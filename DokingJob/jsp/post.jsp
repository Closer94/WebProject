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
		<link rel="stylesheet" href="css/post_detail.css">
		
        
        </style>
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

            var count1=0;
            var checkMul1=0;
            var count2=0;
            var checkMul2=0;
            function changeBackground1(obj){
                if (count1 == 0){
                    if(checkMul2 == 1){
                    alert('하나만 선택가능합니다.');
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
                    alert('하나만 선택가능합니다.');
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
    	<!-- 필요 java package import, 자바빈즈 선언 -->
    	<%@page import ="java.util.ArrayList, comm.PostEntity"  %>
    	<jsp:useBean id="communityDB" class="comm.CommunityDatabase" scope="page"/>
    	<!-- 자바빈즈 선언 끝 -->
    	
    	
        <!--사이드 메뉴-->
        <table id="STATICMENU">
            <tr><td title="맨위로"><button type="button" onclick="goTop()" style="width:40px; height:30px; background:white;margin:0px;">▲</button></td></tr>
            <tr><td title="맨아래로"><button type="button" onclick="goBottom()" style="width:40px; height:30px; background:white;margin:0px;">▼</button></td></tr>
        </table>
        <!--사이드 메뉴-->
        
        <header class = positionHead>
            <table>
                <tr>
                    <td colspan="2" style="width:300px;height:100px;font-size:60px;font-family: 'Jua', sans-serif"><a title="메인페이지로 가기" href="main.html" style="text-decoration:none;">도킹잡</a></td>
                    <td width="600"></td>
                    <td style="width:250px;font-size:15px;text-align:right; height:80px;font-family:'Noto Sans KR', sans-serif;"><a id = "up" href="main.html" title="마이페이지 이동">마이페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id = "up" href="jsp/logout.jsp" title="로그아웃 하기">로그아웃</a>&nbsp;&nbsp;</td>
                </tr>
            </table>
        </header>
        <nav class = positionHead>
            <ul id="ulStyle" >
                <li id="liStyle" title="직업정보 이동" style="margin-left: -30px;"><a href="ProgramerInfo.html">직업정보</a></li>
                <li id="liStyle" title="지원교육정보 이동" style="margin-left: 100px;"><a href="jobEducation.html">지원교육정보</a></li>
                <li id="liStyle" title="지원정책 이동" style="margin-left: 100px;"><a href="supportPolicy.html">지원정책</a></li>
                <li id="liStyle" title="박람회 및 채용정보 이동" style="margin-left: 100px;"><a href="jobFair.html">박람회 및 채용정보</a></li>
                <li id="liStyle" title="커뮤니티 이동" style="margin-left: 100px;"><a href="community_list.jsp">커뮤니티</a></li>
            </ul>
        </nav>
        
        <div style="margin-left:290px; border: 1px solid white; width:937px; background: white">
        
        <% // url request로 post id값 확인
    		String id = request.getParameter("id"); //url상에서 [post?id=()]를 파싱 -> 문서 id
    		if(id!=null){ // id값 요청이 있는경우(= 등록이 아닌경우)
    			int postId = Integer.parseInt(id); // postId로 추후 getPost(Postid)를 이용해 게시글 정보가져오기
    			PostEntity post = communityDB.getPost(postId); // 해당 id로 자바빈즈 메소드를 통해 객체가져오기
    	%>
        
        
        
        <!-- 상세 post 정보 시작 -->
            <table>
                <tr><td style="font-size:30px; font-weight: bold; color:#3493ff;">커뮤니티</td></tr>
                <tr><td style="height:30px;">&nbsp;</td></tr>
                <tr><td style="font-weight: bold; font-size:25px;"><%=post.getTitle() %></td></tr>
                <tr><td style="border-top:2px solid #2e4361; background:#f1f7ff; padding:10px 0px 10px 0px;">&nbsp;<%=post.getWriter_id() %><span style="font-size:13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회수: <%=post.getViewcnt() %></span>&nbsp;&nbsp;<span style="font-size:13px;"><%=post.getDate() %></span></td>
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
       <!-- 상세 post 정보 끝 -->

            <div style="margin-top:20px;margin-left:345px;">
                <input type="button" id="btn" value="추천" onclick="changeBackground1(this)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="btn" value="비추천" onclick="changeBackground2(this)">
            </div>
            <div style="height:40px;">&nbsp;</div>
            <hr style="border: solid 0.5px gray; width:900px;">
            <div style="font-size: 20px; margin:30px;">댓글 <span style="color:#04b4ae;">2</div>

            <table style="margin:30px;">
                <tr>
                    <td>
                        <textarea cols="90" rows="5" onclick="this.value=''">댓글을 남겨주세요.</textarea>
                    </td>
                    <td><input type="submit" value="댓글남기기" id="writeCommentBtn"></td>
                </tr>
            </table>

            <table style="margin:18px; width:900px;">
                <tr><td style="background:#f1f1f1; font-size:13px; padding:10px 0 10px 0;">지나가던웹개발자</td></tr>
                <tr><td style="padding:10px 0 10px 10px; font-size:15px;">웹고인물의 명언이네요.</td></tr>
                <tr><td style="background:#f1f1f1; font-size:13px; padding:10px 0 10px 0;">구글신입사원</td></tr>
                <tr><td style="padding:10px 0 10px 10px; font-size:15px;">갓구글</td></tr>
            </table>
            
            
        <% 
    		} // end : id!=null // 등록이 아닌경우
    		
    		else{ // 새로운 post를 등록하는 경우
    	%>
    	
    	<h1>요청하신 post ID값이 없습니다!</h1>
    	
    	<%   		
    		} // end if : id=null/ //새로운 post 등록인 경우
    	%>
    	
        </div>

        <footer class="positionBody" >
            <hr>
            <p style="font-size:15px;color:gray;">
                <span style="margin-left:4%;">상호: (주)도킹잡&nbsp;&nbsp;&nbsp;대표: 이갑성&nbsp;&nbsp;&nbsp;주소: 강원도 춘천시 한림대학길 1 [24252]&nbsp;&nbsp;&nbsp;전화번호: 010-1234-5678&nbsp;&nbsp;&nbsp;사업자번호: 312-15-00712&nbsp;&nbsp;&nbsp;대표메일: kabsung3@naver.com<p>
                <span style="margin-left:35%; color:gray;">CORYRIGHT DOCKINGJOB 2019 ALL RIGHTS RESESRVED</span>
            </p>
        </footer>
    </body>

</html>
