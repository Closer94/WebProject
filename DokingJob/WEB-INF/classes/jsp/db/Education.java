package jsp.db;

public class Education {
    private Integer eduId;

    // 교육지역(서울, 경기, 강원, 충청, 전라, 경상, 제주)
    private String eduRegion;

    // 국비, 기업
    private String eduType;

    // 교육 분야
    private String eduInterest;

    // 과정명
    private String eduTitle;

    // 수강료
    private String eduFee;

    // 학원명,기관명
    private String eduInstitute;

    // 훈련기간
    private String eduTerm;

    // 교육URl
    private String eduUrl;

    public Integer getEduId() {
        return eduId;
    }

    public void setEduId(Integer eduId) {
        this.eduId = eduId;
    }

    public String getEduRegion() {
        return eduRegion;
    }

    public void setEduRegion(String eduRegion) {
        this.eduRegion = eduRegion;
    }

    public String getEduType() {
        return eduType;
    }

    public void setEduType(String eduType) {
        this.eduType = eduType;
    }

    public String getEduInterest() {
        return eduInterest;
    }

    public void setEduInterest(String eduInterest) {
        this.eduInterest = eduInterest;
    }

    public String getEduTitle() {
        return eduTitle;
    }

    public void setEduTitle(String eduTitle) {
        this.eduTitle = eduTitle;
    }

    public String getEduFee() {
        return eduFee;
    }

    public void setEduFee(String eduFee) {
        this.eduFee = eduFee;
    }

    public String getEduInstitute() {
        return eduInstitute;
    }

    public void setEduInstitute(String eduInstitute) {
        this.eduInstitute = eduInstitute;
    }

    public String getEduTerm() {
        return eduTerm;
    }

    public void setEduTerm(String eduTerm) {
        this.eduTerm = eduTerm;
    }

    public String getEduUrl() {
        return eduUrl;
    }

    public void setEduUrl(String eduUrl) {
        this.eduUrl = eduUrl;
    }
}
