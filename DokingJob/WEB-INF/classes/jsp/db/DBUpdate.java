package jsp.db;

import java.sql.*;
import java.awt.PrintJob;
//restful api
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class DBUpdate {

	private static DBConnection db = new DBConnection(); // ��ŷ�� ���� DB Ŀ�ؼ��� ���� ��ü����
	private static Connection conn = null; // db���� Ŀ�ؼ� ��ü
	private static Statement stm = null; // sql���� ���� ��ΰ�ü
	private static ResultSet rs = null; // db���� ��ȯ�� �����

	// Employemnt DB update �ۼ���
	public static String WriteQueryEmployment(String employ_id, String url, String title, String region,
			String interest_job, String open_date, String start_date, String end_date, String agency, String img_url) {
		String query = "INSERT INTO employment "
				+ "(employ_id, url, title, region, interest_job, open_date, start_date, end_date, agency, img_url) "
				+ "VALUES('" + employ_id + "', '" + url + "', '" + title + "', '" + region + "', '" + interest_job
				+ "', '" + open_date + "', '" + start_date + "', '" + end_date + "', '" + agency + "', '" + img_url
				+ "');";
		System.out.println(query);
		return query;
	}

	@SuppressWarnings("finally")
	public static boolean EmployementUpdate(NodeList jobs) {
		boolean result = false;

		try {
			conn = db.SqlConnectionStart(); // db���� Ŀ�ؼ� ��ü
			stm = conn.createStatement(); // sql���� ���� ���, Ŀ�ؼ� ��ü�� ����
			String query; // ������

/**
 * execute()�� ��ɽ� boolean ��ȯ
 * ���ϰ��� ResultSet�ϰ�� true, �׿ܴ� false
 * executeQuery�� ��ɽ� ResultSet ��ȯ
 * next()�� ������ �̵�, ������ false����
 * rs.getString("�÷�")
 * rs.getInt(�÷�����)
 * executeUpdate�� ��ɽ� int ��ȯ
 * �ݿ��� ���ڵ��� �Ǽ� , create/drop�� ��� -1
 */
//			<jobs> ������ ó��
			for (int i = 0; i < jobs.getLength(); i++) {
				Node job = jobs.item(i); // <job> ��������
				NodeList items = job.getChildNodes(); // ������ <job>�� �ڽ��±׵�
				Node url = items.item(1); // url
				Node title = items.item(5); // title
				Node area = items.item(25); // area
				Node opendate = items.item(17); // opendate
				Node closedate = items.item(19); // closedate
				Node agency = items.item(3); // agency
				System.out.println(
						url.getTextContent() + " / " +
						title.getTextContent() + " / " + 
						area.getTextContent() + " / " + 
						opendate.getTextContent() + " / " + 
						closedate.getTextContent() + " / " + 
						agency.getTextContent()
						);
				
				
				}
				
			
			
			


//			query = WriteQueryEmployment("6", "naver.com", "demo t", "���", "2", "2019-10-01", "2019-11-01", "2019-12-01", "���̹�", "../image/naver.png");

//			int row = stm.executeUpdate(query);
//			System.out.println(row);
			// rs = stm.executeQuery(query);
			// System.out.println(rs);
			// while (rs.next()) {
			// System.out.println(rs.getInt(1) + " " + rs.getString(2));
			// }
		}

		catch (Exception e) {
			System.out.println(e.getMessage());
		}

		finally {
			// connection/statment/resultset ��� close
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stm != null) {
				try {
					stm.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return result;
		}

	}

	public static boolean EducationUpdate() {
		boolean result = false;

		return result;
	}

	// demo ���� �޼ҵ�
	public static void main(String[] args) {
		NodeList jobs = UseRestfulAPI.getEmployment("Ie+7VP4HfJyrLIuOTbUbpf1F4hPUEiVe", "��", 1); // auth, interest,
//		UseRestfulAPI.printJobs(jobs);
//		����Ű, interest(�˻�Ű����)
/**
 * ���� 1
 * ��� 3
 * ��û 16,15
 * ���� 12, 13
 * ��� 5,4
 * ���� 2
 */
//				
		EmployementUpdate(jobs);
	}
}