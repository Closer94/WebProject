<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Login JSP</title>
</head>
<body>
<h2> Login JSP File</h2>

<jsp:useBean id="db" class="jsp.db.DBConnection" />

<%@ page import = "java.sql.*" %>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");

String url = "../logIn.html";

Connection conn = db.SqlConnectionStart();
Statement stm = null;
ResultSet rs = null;
try {
	stm = conn.createStatement();

	String query = "select * from user where user_id = '"+id+"' and password = '"+password+"';";
	rs = stm.executeQuery(query);

	while(rs.next()){
        session.setAttribute("user_id", id); // 인증되었음 세션에 남김
        session.setAttribute("user_interest", rs.getString("interest"));
        session.setAttribute("user_region", rs.getString("region"));
        url = "../ProgramerInfo.html";
	}	
	
	out.println(query);
}
catch(Exception e) {
	out.println(e.getMessage());
}
finally{
	if(rs != null)			rs.close();
	if(stm != null)			stm.close();
	if(conn != null)		conn.close();
}


if(url.equals("../logIn.html")){
	out.println("<script> alert('로그인 실패'); </script>");
}
else{
	out.println("<script> alert('로그인 성공'); </script>");
}


%>
<% 
//out.println("<script> location.href='"+url+"' </script>");
response.sendRedirect(url);

%>


</body>
</html>