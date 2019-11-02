package jsp.db;

import java.sql.*;

public class DBConnection {
	public static Connection SqlConnectionStart() {
		Connection conn = null;

		try {
       		Class.forName("com.mysql.jdbc.Driver");
        	
	        String url = "jdbc:mysql://106.10.52.145/dockingJob";
	        String id = "20175120";
	        String passwd = "20175120";
	        
    	    conn = DriverManager.getConnection(url, id, passwd);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}
