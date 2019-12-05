<%@page import="jsp.db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="db" class="jsp.db.DBConnection" scope="application" />
	<%
					
					Connection conn = db.SqlConnectionStart(); //드라이버 연결
					Statement stmt = null;
					PreparedStatement pstm = null; // sql문을 날릴 통로객체
					int cnt = 1;
					
					String user_id = (String)session.getAttribute("user_id");
					String title = request.getParameter("title");
					String content = request.getParameter("editor1");
					//날짜
					java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String today = formatter.format(new java.util.Date());
					int viewcnt = 0;
					int goodcnt = 0;
					
					try {
						if (conn == null) {
							throw new Exception("fail connection");
						}
						stmt = conn.createStatement(); //연결된 상태에서 stmt로
						
						//out.println("title: " + title);
						//out.println("content: " + content);
						
						String query = "insert into community (cm_writer_id, cm_title, cm_content, cm_date, cm_viewcnt, cm_goodcnt) "
								+ "values(?,?,?,?,?,?)";
						pstm = conn.prepareStatement(query);
						pstm.setString(1, user_id);
						pstm.setString(2, title);
						pstm.setString(3, content);
						pstm.setString(4, today);
						pstm.setInt(5, viewcnt);
						pstm.setInt(6, goodcnt);
						
						pstm.executeUpdate();
						pstm.clearParameters(); // 파라미터 재할당					
					}catch(Exception e) {
						out.println(e.getMessage());
					} finally{
						if(stmt != null)		stmt.close();
						if(conn != null)		conn.close();
					}
					
					response.sendRedirect("community.html");
					
%>
</body>
</html>