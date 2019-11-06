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
	out.print("<script> alert('Logout 성공'); </script>");
	out.print("<script> location.href='../main.html'; </script>");
	
%>


</body>
</html>