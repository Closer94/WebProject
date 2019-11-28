package comm;

import jsp.db.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import comm.PostEntity;

public class CommunityDatabase {

	private DBConnection db = new DBConnection(); // dockingJob2 DB

	// 데이터베이스 연결 관련 변수 선언
	private Connection con = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;

	public CommunityDatabase() { // 생성자, 데이터베이스 연결
		con = db.SqlConnectionStart(); // connection
	}

	// 게시판의 모든 레코드를 반환하는 메소드
	public ArrayList<PostEntity> getPostList(){
		ArrayList<PostEntity> list = new ArrayList<PostEntity>(); // 게시판글을 저장할 list
		
		String SQL = "select * from community";
		try {
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(SQL);
			// ResultSet의 결과중 모든 행을 PostEntity객체에 저장
			
			while(rs.next()) {
				// 한 행의 게시판글 정보를 저장할 빈즈객체 생성
				PostEntity post = new PostEntity();
				
				// 생성한 빈즈에 db로 부터 읽어온 한행의 record 정보 삽입
				post.setId(rs.getInt("cm_id")); // 글 id
				post.setWriter_id(rs.getString("cm_writer_id")); // 작성자 
				post.setTitle(rs.getString("cm_title")); // 제목
				post.setContent(rs.getString("cm_content")); // 내용
				post.setDate(rs.getString("cm_date")); // 게시글 등록일
				post.setViewcnt(rs.getString("cm_viewcnt"));// 조회수
				post.setGoodcnt(rs.getString("cm_goodcnt")); // 추천수
				
				// ArrayList에 방금 읽어온 게시글 빈즈객체인 post를 추가
				list.add(post);
			}
			rs.close();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		// 완성된 ArrayList 객체반환
		return list;
	}
	
	// 주 키 id의 레코드를 반환하는 메소드
	public PostEntity getPost(int id) {
		String SQL = "select * from community where cm_id = ?";
		PostEntity post = new PostEntity();
		
		try {
			pstmt = con.prepareStatement(SQL); // 향상된 Statement
			pstmt.setInt(1, id); // SQL 문의 ?를 매개변수인 id 로 설정
			ResultSet rs = pstmt.executeQuery(); // result값 가져오기
			
			rs.next(); // 가져올 record가 하나이므로 1번만 next
			post.setId(rs.getInt("cm_id")); // 글 id
			post.setWriter_id(rs.getString("cm_writer_id")); // 작성자 
			post.setTitle(rs.getString("cm_title")); // 제목
			post.setContent(rs.getString("cm_content")); // 내용
			post.setDate(rs.getString("cm_date")); // 게시글 등록일
			post.setViewcnt(rs.getString("cm_viewcnt"));// 조회수
			post.setGoodcnt(rs.getString("cm_goodcnt")); // 추천수
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return post;
	}

}
