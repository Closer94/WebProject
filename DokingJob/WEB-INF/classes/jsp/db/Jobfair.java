package jsp.db;

public class Jobfair { // 박람회 및 구직정보
		//pk
	 	private Integer jobId = null;

	    // 관심분야
	    private String jobInterest;

	    // 구직정보제목
	    private String jobTitle;

	    // 구직URL
	    private String jobUrl;

	    // 구직회사명
	    private String jobCompany;

	    // 구직회사지역
	    private String jobRegion;

	    // 구직기간(시작기간 ~ 마감기간)
	    private String jobTerm;

	    // 구직이미지URL
	    private String jobImg;

	    public Integer getJobId() {
	        return jobId;
	    }

	    public void setJobId(Integer jobId) {
	        this.jobId = jobId;
	    }

	    public String getJobInterest() {
	        return jobInterest;
	    }

	    public void setJobInterest(String jobInterest) {
	        this.jobInterest = jobInterest;
	    }

	    public String getJobTitle() {
	        return jobTitle;
	    }

	    public void setJobTitle(String jobTitle) {
	        this.jobTitle = jobTitle;
	    }

	    public String getJobUrl() {
	        return jobUrl;
	    }

	    public void setJobUrl(String jobUrl) {
	        this.jobUrl = jobUrl;
	    }

	    public String getJobCompany() {
	        return jobCompany;
	    }

	    public void setJobCompany(String jobCompany) {
	        this.jobCompany = jobCompany;
	    }

	    public String getJobRegion() {
	        return jobRegion;
	    }

	    public void setJobRegion(String jobRegion) {
	        this.jobRegion = jobRegion;
	    }

	    public String getJobTerm() {
	        return jobTerm;
	    }

	    public void setJobTerm(String jobTerm) {
	        this.jobTerm = jobTerm;
	    }

	    public String getJobImg() {
	        return jobImg;
	    }

	    public void setJobImg(String jobImg) {
	        this.jobImg = jobImg;
	    }
	    
	    public String toString() {
	    	return jobId +"/"+ jobInterest +"/" +jobTitle +"/"+ jobUrl +"/"+ jobCompany +"/"+ jobRegion +"/"+ jobTerm +"/"+ jobImg; 
	    }
	
}
