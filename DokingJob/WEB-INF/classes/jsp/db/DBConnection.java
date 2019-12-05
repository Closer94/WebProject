package jsp.db;

import java.sql.*;

public class DBConnection {
	static Connection conn = null;
	
	public DBConnection() {
		try {

       		Class.forName("com.mysql.jdbc.Driver");

	        String url = "jdbc:mysql://106.10.52.145/dockingJob2";
	        
	        String id = "20175120";
	        String passwd = "20175120";
	        
    	    conn = DriverManager.getConnection(url, id, passwd);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection SqlConnectionStart() {
		return conn;
	}
	
}
