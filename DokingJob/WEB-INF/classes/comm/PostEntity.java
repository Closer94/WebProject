package comm;

public class PostEntity {
	private int id; // cm_id
	private String writer_id; // cm_write_id;
	private String title; // cm_title
	private String content; // cm_content
	private String date; // cm_date
	private String viewcnt; // cm_viewcnt
	private String goodcnt; // cm_goodcnt
	
	public PostEntity(int id, String writer_id, String title, String content, String date, String viewcnt,
			String goodcnt) {
		this.id = id;
		this.writer_id = writer_id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.viewcnt = viewcnt;
		this.goodcnt = goodcnt;
	}
	
	public PostEntity() {
		// 기본값으로 초기화 하여 객체생성 
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(String viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getGoodcnt() {
		return goodcnt;
	}
	public void setGoodcnt(String goodcnt) {
		this.goodcnt = goodcnt;
	}
	
	@Override
	public String toString() {
		return "PostEntity [id=" + id + ", writer_id=" + writer_id + ", title=" + title + ", content=" + content
				+ ", date=" + date + ", viewcnt=" + viewcnt + ", goodcnt=" + goodcnt + "]";
	}

}
