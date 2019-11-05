<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate();
	//response.sendRedirect("../logIn.html");
	out.print("<script> alert('Logout 성공'); </script>");
	out.print("<script> history.back(); </script>");
	
%>


</body>
</html>