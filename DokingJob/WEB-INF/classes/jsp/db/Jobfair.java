package jsp.db;

public class Jobfair { // �ڶ�ȸ �� ��������
		//pk
	 	private Integer jobId = null;

	    // ���ɺо�
	    private String jobInterest;

	    // ������������
	    private String jobTitle;

	    // ����URL
	    private String jobUrl;

	    // ����ȸ���
	    private String jobCompany;

	    // ����ȸ������
	    private String jobRegion;

	    // �����Ⱓ(���۱Ⱓ ~ �����Ⱓ)
	    private String jobTerm;

	    // �����̹���URL
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
