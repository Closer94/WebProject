package jsp.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;

public class JobfairDB {
	private DBConnection db = new DBConnection(); // 도킹잡 서버 DB 커넥션을 위한 객체생성
	private Connection con = db.SqlConnectionStart(); // db와의 커넥션 객체
	private PreparedStatement pstmt = null; // sql문을 날릴 통로객체
	private ResultSet rs = null; // db에서 반환한 결과값

	public boolean InsertDB(ArrayList<Jobfair> CleanJobs) { // DB Insert
		boolean success = false;
		String sql = "insert into jobfair (job_interest, job_title, job_url, job_company, job_region, job_term, job_img) "
				+ "values(?,?,?,?,?,?,?)";
		int count = 0;
		
		System.out.println("INSERT DB 실행");
		System.out.println("connection 객체 : " + con);
		try {
			for (Jobfair job : CleanJobs) {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, job.getJobInterest());
				pstmt.setString(2, job.getJobTitle());
				pstmt.setString(3, job.getJobUrl());
				pstmt.setString(4, job.getJobCompany());
				pstmt.setString(5, job.getJobRegion());
				pstmt.setString(6, job.getJobTerm());
				pstmt.setString(7, job.getJobImg());
				count += pstmt.executeUpdate(); // insert실행 -> 영향받은 행 확인
				pstmt.clearParameters(); // 파라미터 재할당
			}
			System.out.println(count + "행 영향받음");
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return success;
	}
	
	public static void main(String args[]) {
		JobAPI jobapi = new JobAPI(); // api를 가져오기위한 객체생성
		ArrayList<Jobfair> CleanJobs = jobapi.getJobs("http://api.career.co.kr/open?id=wJyjPX8fmKsbV/DsFtmEnA==&uc=C1&jc=H002&kw=웹&ac1=1&ck=&gubun=0",
				"웹", "서울"); // // uri를 이용해 정제된 데이터 가져오기
		new JobfairDB().InsertDB(CleanJobs); // 위에서 정제된 데이터 INSERT DB
	}

}
