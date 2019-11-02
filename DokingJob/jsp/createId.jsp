<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>JSP File</title>
</head>
<body>
<h1> Result! </h1>

<jsp:useBean id="db" class="jsp.db.DBConnection" scope="application"/>

<%@ page import = "java.sql.*" %>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");
String passwordcheck = request.getParameter("passwordcheck");

String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");

String nickname = request.getParameter("nickname");
String email = request.getParameter("email");

String interest = request.getParameter("interest");
String address = request.getParameter("address");

String birthday = year+month+day;
boolean emailcheck = true;
address = "seoul";
interest = "000001";

Connection conn = db.SqlConnectionStart();
Statement stm = null;
ResultSet rs = null;
try {
	stm = conn.createStatement();

	String query = "insert into user values('"+id+
					"', '"+ password +
					"', '"+nickname+
					"', '"+interest+
					"', '"+address+
					"', '"+email+
					"', '"+birthday+
					"', "+emailcheck+");";
	
	stm.executeUpdate(query);
}
catch(Exception e) {
	out.println(e.getMessage());
}
finally{
	if(rs != null)			rs.close();
	if(stm != null)			stm.close();
	if(conn != null)		conn.close();
}


%>

<h3> 회원가입 되셨습니다 ! </h3>
id : <%= id %><br>
password : <%= password %><br>
passwordcheck : <%= passwordcheck %><br>
year : <%= year %><br>
month : <%= month %><br>
day : <%= day %><br>
nickname : <%= nickname %><br>
email : <%= email %><br>
interest : <%= interest  %><br>

</body>
</html>