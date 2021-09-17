package cnav.project.dto;

public class ProjectDTO {
	
	private Integer proNum; 	// 프로젝트 번호
	private String proName;		// 제목
	private String proContent;	// 내용
	private String userId; 		// 작성자(담당자)
	private String proStart;	// 시작일
	private String proEnd;		// 종료일
	private String dept;		// 부서
	private String proState;	// 진행상태
	public Integer getProNum() {
		return proNum;
	}
	public void setProNum(Integer proNum) {
		this.proNum = proNum;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProContent() {
		return proContent;
	}
	public void setProContent(String proContent) {
		this.proContent = proContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProStart() {
		return proStart;
	}
	public void setProStart(String proStart) {
		this.proStart = proStart;
	}
	public String getProEnd() {
		return proEnd;
	}
	public void setProEnd(String proEnd) {
		this.proEnd = proEnd;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getProState() {
		return proState;
	}
	public void setProState(String proState) {
		this.proState = proState;
	}
	
	
}