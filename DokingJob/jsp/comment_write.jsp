<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Added comment </title>
</head>
<body>

<jsp:useBean id="db" class="jsp.db.DBConnection" />

<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%
request.setCharacterEncoding("EUC-KR");

String comment_content = request.getParameter("comment_content");
String url = "../logIn.html";
String user_id = (String)session.getAttribute("user_id");
String post_Id = request.getParameter("postId");

if(user_id == null || user_id.equals(""))
	response.sendRedirect(url);

url = "post.jsp?id="+post_Id;
Connection conn = db.SqlConnectionStart();
Statement stm = null;
ResultSet rs = null;
try {
	stm = conn.createStatement();
	
	String query = "insert into comment(comment_writer_id, comment_content, cm_id) "
				 + "values ('"+user_id+"', '" + comment_content + "', "+post_Id+");";
	
	stm.executeUpdate(query);
	//out.println(query);
}
catch(Exception e) {
	out.println(e.getMessage());
}
finally{
	if(rs != null)			rs.close();
	if(stm != null)			stm.close();
	if(conn != null)		conn.close();
}

response.sendRedirect(url);
%>

</body>
</html>