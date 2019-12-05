<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%
	request.setCharacterEncoding("euc-kr");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP File</title>
</head>
<body>
<h1> Result! </h1>

<jsp:useBean id="db" class="jsp.db.DBConnection" />

<%@ page import = "java.sql.*" %>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");

String nickname = request.getParameter("nickname");
String email = request.getParameter("email");

String interest = request.getParameter("interest");
String address = request.getParameter("address");

boolean emailcheck = true;

Connection conn = db.SqlConnectionStart();
Statement stm = null;
ResultSet rs = null;
try {
	stm = conn.createStatement();

	String query = "insert into user values('"+id+
					"', '"+ password +
					"', '"+nickname+
					"', '"+interest+
					"', '"+email+
					"', '"+address+
					"', "+emailcheck+");";
	
	stm.executeUpdate(query);
}
catch(Exception e) {
	out.println(e.getMessage());
	response.sendRedirect("createId.jsp");
}
finally{
	if(rs != null)			rs.close();
	if(stm != null)			stm.close();
	if(conn != null)		conn.close();
}


%>

<h3> Success!! </h3>
id : <%= id %><br>
password : <%= password %><br>
nickname : <%= nickname %><br>
email : <%= email %><br>
interest : <%= interest  %><br>
address : <%= address  %><br>

<% 
response.sendRedirect("../main.html");
%>
</body>
</html>