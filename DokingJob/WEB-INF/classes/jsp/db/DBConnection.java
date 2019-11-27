package jsp.db;

import java.sql.*;

public class DBConnection {
	Connection conn = null;
	
	public DBConnection() {
		try {
			//driver연결
       		Class.forName("com.mysql.jdbc.Driver");
        	
       		// 연결하고자 하는 mysql 데이터베이스가 있는 서버 url/db이름
	        String url = "jdbc:mysql://106.10.52.145/dockingJob2";
	        // mysql 아이디,비밀번호
	        String id = "20175120";
	        String passwd = "20175120";
	        
    	    conn = DriverManager.getConnection(url, id, passwd);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection SqlConnectionStart() {
		return conn;
	}
	
}
