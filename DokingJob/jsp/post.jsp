<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="EUC-KR">
        <title>
            µµ≈∑¿‚(DockingJob) - πÃª˝ø°º≠ øœª˝¿∏∑Œ
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
                margin-top: 40px;
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


            /*ÏÇ¨Ïù¥Îìú Î©îÎâ¥ ÏÜåÏä§*/
            #STATICMENU {
            margin: 0pt;
            padding: 0pt;
            position: absolute;
            right: 0px;
            top: 0px;
            }
            /*ÏÇ¨Ïù¥Îìú Î©îÎâ¥ ÏÜåÏä§*/

            #btn{
                border-radius:30px;
                background-color: #5892f9;
                width: 90px;
                height: 35px;
                border: 1px solid darkgray;
                outline: none;
                color: white;
                font-weight: bold;

            }
            #btn:hover{
                text-decoration:none;
                background: red;
                color: white;
                font-weight: bold;
                transition: all 0.3s ease;
            }
            #writeCommentBtn{
                background-color: #5892f9;
                width: 90px;
                height: 80px;
                border: 1px solid darkgray;
                outline: none;
                color: white;
                font-weight: bold;
                margin-bottom: 5px;

            }
            #writeCommentBtn:hover{
                text-decoration:none;
                background: white;
                color: #5892f9;
                font-weight: bold;
                transition: all 0.3s ease;
            }
        </style>


        <script>
            //ªÁ¿ÃµÂ ∏ﬁ¥∫ º“Ω∫
            var stmnLEFT = 50; // ø¿∏•¬  ø©πÈ
            var stmnGAP1 = 0; // ¿ß¬  ø©πÈ
            var stmnGAP2 = 550; // Ω∫≈©∑—Ω√ ∫Í∂ÛøÏ¿˙ ¿ß¬ ∞˙ ∂≥æÓ¡ˆ¥¬ ∞≈∏Æ
            var stmnBASE = 150; // Ω∫≈©∑— Ω√¿€¿ßƒ°
            var stmnActivateSpeed = 20; //Ω∫≈©∑—¿ª ¿ŒΩƒ«œ¥¬ µÙ∑π¿Ã (º˝¿⁄∞° ≈¨ºˆ∑œ ¥¿∏Æ∞‘ ¿ŒΩƒ)
            var stmnScrollSpeed = 10; //Ω∫≈©∑— º”µµ (≈¨ºˆ∑œ ¥¿∏≤)
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
            document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //√≥¿Ωø° ø¿∏•¬ ø° ¿ßƒ°. left∑Œ πŸ≤„µµ.
            document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px';
            RefreshStaticMenu();
            }
            function goTop(){
                document.documentElement.scrollTop=0;
            }
            function goBottom(){
                document.documentElement.scrollTop = document.body.scrollHeight;
            }
            //ªÁ¿ÃµÂ ∏ﬁ¥∫ º“Ω∫

            var count1=0;
            var checkMul1=0;
            var count2=0;
            var checkMul2=0;

            function changeBackground1(obj){
                if (count1 == 0){
                    if(checkMul2 == 1){
                    alert('«œ≥™∏∏ º±≈√∞°¥…«’¥œ¥Ÿ.');
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
                    alert('«œ≥™∏∏ º±≈√∞°¥…«’¥œ¥Ÿ.');
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

            function completeComment(){
                alert('¥Ò±€¿Ã µÓ∑œµ«æ˙Ω¿¥œ¥Ÿ.')
            }

        </script>

        <script type="text/javascript">


        </script>
    </head>
    <body style="background:#edf1f8;" onload="InitializeStaticMenu();">
    	<!-- « ø‰ java package import, ¿⁄πŸ∫Û¡Ó º±æ -->
    	<%@page import ="java.util.ArrayList, comm.PostEntity"  %>
    	<%@ page import = "java.sql.*" %>
	     <jsp:useBean id="commentDB" class="jsp.db.DBConnection" scope="page" />
    	<jsp:useBean id="communityDB" class="comm.CommunityDatabase" scope="page"/>
    	<!-- ¿⁄πŸ∫Û¡Ó º±æ ≥° -->


        <!--ªÁ¿ÃµÂ ∏ﬁ¥∫-->
        <table id="STATICMENU">
            <tr><td title="∏«¿ß∑Œ"><button type="button" onclick="goTop()" style="width:40px; height:30px; background:white;margin:0px;">°„</button></td></tr>
            <tr><td title="∏«æ∆∑°∑Œ"><button type="button" onclick="goBottom()" style="width:40px; height:30px; background:white;margin:0px;">°Â</button></td></tr>
        </table>
        <!--ªÁ¿ÃµÂ ∏ﬁ¥∫-->

        <header class = positionHead>
            <table>
                <tr>
                    <td colspan="2" style="width:300px;height:100px;font-size:60px;font-family: 'Jua', sans-serif"><a title="∏ﬁ¿Œ∆‰¿Ã¡ˆ∑Œ ∞°±‚" href="../main.html" style="text-decoration:none;">µµ≈∑¿‚</a></td>
                    <td width="600"></td>
                    <td style="width:250px;font-size:15px;text-align:right; height:80px;font-family:'Noto Sans KR', sans-serif;"><a id = "up" href="modifyProfile.jsp" title="∏∂¿Ã∆‰¿Ã¡ˆ ¿Ãµø">∏∂¿Ã∆‰¿Ã¡ˆ</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id = "up" href="logout.jsp" title="∑Œ±◊æ∆øÙ «œ±‚">∑Œ±◊æ∆øÙ</a>&nbsp;&nbsp;</td>
                </tr>
            </table>
        </header>
        <nav class = positionHead>
            <ul id="ulStyle" >
                <li id="liStyle" title="¡˜æ˜¡§∫∏ ¿Ãµø" style="margin-left: -30px;"><a href="../ProgramerInfo.html">¡˜æ˜¡§∫∏</a></li>
                <li id="liStyle" title="¡ˆø¯±≥¿∞¡§∫∏ ¿Ãµø" style="margin-left: 100px;"><a href="jobEducation_default.jsp">¡ˆø¯±≥¿∞¡§∫∏</a></li>
                <li id="liStyle" title="¡ˆø¯¡§√• ¿Ãµø" style="margin-left: 100px;"><a href="../supportPolicy.html">¡ˆø¯¡§√•</a></li>
                <li id="liStyle" title="π⁄∂˜»∏ π◊ √§øÎ¡§∫∏ ¿Ãµø" style="margin-left: 100px;"><a href="jobFair_default.jsp">π⁄∂˜»∏ π◊ √§øÎ¡§∫∏</a></li>
                <li id="liStyle" title="ƒøπ¬¥œ∆º ¿Ãµø" style="margin-left: 100px;"><a href="community_list.jsp">ƒøπ¬¥œ∆º</a></li>
            </ul>
        </nav>

        <div style="margin-left:290px; border: 1px solid white; width:937px; background: white">

        <% // url request∑Œ post id∞™ »Æ¿Œ
    		String id = request.getParameter("id"); //urlªÛø°º≠ [post?id=()]∏¶ ∆ƒΩÃ -> πÆº≠ id
    		if(id!=null){ // id∞™ ø‰√ª¿Ã ¿÷¥¬∞ÊøÏ(= µÓ∑œ¿Ã æ∆¥—∞ÊøÏ)
    			int postId = Integer.parseInt(id); // postId∑Œ √ﬂ»ƒ getPost(Postid)∏¶ ¿ÃøÎ«ÿ ∞‘Ω√±€ ¡§∫∏∞°¡Æø¿±‚
    			PostEntity post = communityDB.getPost(postId); // «ÿ¥Á id∑Œ ¿⁄πŸ∫Û¡Ó ∏ﬁº“µÂ∏¶ ≈Î«ÿ ∞¥√º∞°¡Æø¿±‚
    	%>

        <!-- ªÛºº post ¡§∫∏ Ω√¿€ -->
            <table>
                <tr><td style="font-size:30px; font-weight: bold; color:#3493ff;">ƒøπ¬¥œ∆º</td></tr>
                <tr><td style="height:30px;">&nbsp;</td></tr>
                <tr><td style="font-weight: bold; font-size:25px;"><%=post.getTitle() %></td></tr>
                <tr><td style="border-top:2px solid #2e4361; background:#f1f7ff; padding:10px 0px 10px 0px;">&nbsp;<%=post.getWriter_id() %><span style="font-size:13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;¡∂»∏ºˆ:  <%=post.getViewcnt() %> </span>&nbsp;&nbsp;<span style="font-size:13px;"><%=post.getDate() %></span></td>
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
       <!-- ªÛºº post ¡§∫∏ ≥° -->
	<% communityDB.IncreaseGoodcnt(postId); %>
            <div style="margin-top:20px;margin-left:345px;">
                <input type="button" id="btn" value="√ﬂ√µ" onclick="changeBackground1(this)">
            </div>

            <div style="height:40px;">&nbsp;</div>

		    <%
				Connection conn1 = commentDB.SqlConnectionStart();
				Statement stm1 = null;
				ResultSet rs1 = null;
				try {
					stm1 = conn1.createStatement();

					String query1 = "select count(*) as total_cnt from comment where cm_id = '"+postId+"';";

					String count = "0";
					rs1 = stm1.executeQuery(query1);
					if(rs1.next())
						count = rs1.getString("total_cnt");
		    %>

            <hr style="border: solid 0.5px gray; width:900px;">
            <div style="font-size: 20px; margin:30px;">¥Ò±€ <span style="color:#04b4ae;"><%= count %></div>

			<form action="comment_write.jsp" method="post">
            <table style="margin:30px;">
                <tr>
                    <td>
                        <textarea cols="90" name="comment_content" rows="5" onclick="this.value=''">¥Ò±€¿ª ≥≤∞‹¡÷ººø‰.</textarea>

                    </td>
                    <td><input type="submit" value="¥Ò±€≥≤±‚±‚" onclick='completeComment()' id="writeCommentBtn"></td>
                </tr>
                <input type=text style='display:none;' name='postId' value=<%= postId%>>
            </table>
            </form>
            <%

				if(!count.equals("0")){
					String query2 = "select * from comment where cm_id = "+postId+";";
					rs1 = stm1.executeQuery(query2);

					while(rs1.next()){
						String commnet_writer = rs1.getString("comment_writer_id");
						String comment_content = rs1.getString("comment_content");

						out.print("<table style='margin:18px; width:900px;'>");
						out.print("<tr><td style='background:#f1f1f1; font-size:13px; padding:10px 0 10px 0;'>"+commnet_writer+"</td></tr>");
						out.print("<tr><td style='padding:10px 0 10px 10px; font-size:15px;'>"+comment_content+"</td></tr>");
					}
				}

            %>
				</table>
            <%
			}catch(Exception e) {
				out.println(e.getMessage());
			}
			finally{
				if(rs1 != null)			rs1.close();
				if(stm1 != null)			stm1.close();
				if(conn1 != null)		conn1.close();
			}
            %>

        <%
    		} // end : id!=null

    		else{ //
    	%>

    	<h1>ID is not exists</h1>

    	<%
    		} // end if : id=null/
    	%>
        </div>

        <footer class="positionBody" >
            <hr>
            <p style="font-size:15px;color:gray;">
                <span style="margin-left:4%;">ªÛ»£: (¡÷)µµ≈∑¿‚&nbsp;&nbsp;&nbsp;¥Î«•: ¿Ã∞©º∫&nbsp;&nbsp;&nbsp;¡÷º“: ∞≠ø¯µµ √·√µΩ√ «—∏≤¥Î«–±Ê 1 [24252]&nbsp;&nbsp;&nbsp;¿¸»≠π¯»£: 010-1234-5678&nbsp;&nbsp;&nbsp;ªÁæ˜¿⁄π¯»£: 312-15-00712&nbsp;&nbsp;&nbsp;¥Î«•∏ﬁ¿œ: kabsung3@naver.com<p>
                <span style="margin-left:35%; color:gray;">CORYRIGHT DOCKINGJOB 2019 ALL RIGHTS RESESRVED</span>
            </p>
        </footer>
    </body>
</html>
