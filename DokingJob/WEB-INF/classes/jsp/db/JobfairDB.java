package jsp.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;

public class JobfairDB {
	private DBConnection db = new DBConnection(); // ��ŷ�� ���� DB Ŀ�ؼ��� ���� ��ü����
	private Connection con = db.SqlConnectionStart(); // db���� Ŀ�ؼ� ��ü
	private PreparedStatement pstmt = null; // sql���� ���� ��ΰ�ü
	private ResultSet rs = null; // db���� ��ȯ�� �����

	public boolean InsertDB(ArrayList<Jobfair> CleanJobs) { // DB Insert
		boolean success = false;
		String sql = "insert into jobfair (job_interest, job_title, job_url, job_company, job_region, job_term, job_img) "
				+ "values(?,?,?,?,?,?,?)";
		int count = 0;
		
		System.out.println("INSERT DB ����");
		System.out.println("connection ��ü : " + con);
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
				count += pstmt.executeUpdate(); // insert���� -> ������� �� Ȯ��
				pstmt.clearParameters(); // �Ķ���� ���Ҵ�
			}
			System.out.println(count + "�� �������");
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return success;
	}
	
	public static void main(String args[]) {
		JobAPI jobapi = new JobAPI(); // api�� ������������ ��ü����
		ArrayList<Jobfair> CleanJobs = jobapi.getJobs("http://api.career.co.kr/open?id=wJyjPX8fmKsbV/DsFtmEnA==&uc=C1&jc=H002&kw=��&ac1=1&ck=&gubun=0",
				"��", "����"); // // uri�� �̿��� ������ ������ ��������
		new JobfairDB().InsertDB(CleanJobs); // ������ ������ ������ INSERT DB
	}

}
