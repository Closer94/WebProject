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

	private static DBConnection db = new DBConnection(); // 도킹잡 서버 DB 커넥션을 위한 객체생성
	private static Connection conn = null; // db와의 커넥션 객체
	private static Statement stm = null; // sql문을 날릴 통로객체
	private static ResultSet rs = null; // db에서 반환한 결과값

	// Employemnt DB update 작성문
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
			conn = db.SqlConnectionStart(); // db와의 커넥션 객체
			stm = conn.createStatement(); // sql문을 날리 통로, 커넥션 객체와 연결
			String query; // 쿼리문

/**
 * execute()로 명령시 boolean 반환
 * 리턴값이 ResultSet일경우 true, 그외는 false
 * executeQuery로 명령시 ResultSet 반환
 * next()로 다음행 이동, 없을시 false리턴
 * rs.getString("컬럼")
 * rs.getInt(컬럼순번)
 * executeUpdate로 명령시 int 반환
 * 반영된 레코드의 건수 , create/drop의 경우 -1
 */
//			<jobs> 데이터 처리
			for (int i = 0; i < jobs.getLength(); i++) {
				Node job = jobs.item(i); // <job> 가져오기
				NodeList items = job.getChildNodes(); // 가져온 <job>의 자식태그들
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
				
			
			
			


//			query = WriteQueryEmployment("6", "naver.com", "demo t", "경기", "2", "2019-10-01", "2019-11-01", "2019-12-01", "네이버", "../image/naver.png");

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
			// connection/statment/resultset 모두 close
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

	// demo 메인 메소드
	public static void main(String[] args) {
		NodeList jobs = UseRestfulAPI.getEmployment("Ie+7VP4HfJyrLIuOTbUbpf1F4hPUEiVe", "웹", 1); // auth, interest,
//		UseRestfulAPI.printJobs(jobs);
//		인증키, interest(검색키워드)
/**
 * 서울 1
 * 경기 3
 * 충청 16,15
 * 전라 12, 13
 * 경상 5,4
 * 강원 2
 */
//				
		EmployementUpdate(jobs);
	}
}