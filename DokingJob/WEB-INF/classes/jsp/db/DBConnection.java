package jsp.db;

import java.sql.*;

public class DBConnection {
	Connection conn = null;
	
	public DBConnection() {
		try {
			//driver����
       		Class.forName("com.mysql.jdbc.Driver");
        	
       		// �����ϰ��� �ϴ� mysql �����ͺ��̽��� �ִ� ���� url/db�̸�
	        String url = "jdbc:mysql://106.10.52.145/dockingJob2";
	        // mysql ���̵�,��й�ȣ
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
