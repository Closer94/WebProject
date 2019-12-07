<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
<jsp:useBean id="db" class="jsp.db.DBConnection" />
<%@ page import = "java.sql.*" %>

<%
	request.setCharacterEncoding("EUC-KR");
%>
<%

	String name = request.getParameter("nickname");
	String interest = request.getParameter("interest");
	String email1 = request.getParameter("email1");
	String email2  = request.getParameter("email2");
	String emailcheck = request.getParameter("selectEmail");
	String region = request.getParameter("region");

	String password = request.getParameter("new_password");
	String query = "";
	String url = "../logIn.html";
	   
	String user_id = (String)session.getAttribute("user_id");
	if(user_id == null || user_id.equals(""))
		response.sendRedirect(url);
	
	else{
		Connection conn = db.SqlConnectionStart();
		Statement stm = null;
		ResultSet rs = null;

		try{
			
			stm = conn.createStatement();
			
			
			
			if(password == null){
				url = "modifyProfile.jsp";
				
				query = "update user set nickname = '"+name+
						"', interest = '"+interest+
						
						"', email = '"+email1+"@"+email2+
						"', email_check = '"+emailcheck+
						"' where user_id = '"+user_id+"';";
				out.println(query);
		        session.setAttribute("user_interest", interest);
		        session.setAttribute("user_region", region);
			}
			else{
				query = "update user set password = '"+password+"'where user_id = '"+user_id+"';";
				url = "modifyPassword.jsp";
			}
			
			stm.executeUpdate(query);

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
	
	response.sendRedirect(url);
	%>
</body>
</html>
