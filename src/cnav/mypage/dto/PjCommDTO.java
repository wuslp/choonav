package cnav.mypage.dto;

public class PjCommDTO {

	private int proNum; 	// 프로젝트 번호
	private int proComNum;		// 프로젝트 댓글 번호
	private String userId; 		// 작성자(담당자)
	private String proReg;		// 작성일
	private String proComment;	// 프로젝트 댓글 내용
	private String code;		// 회사코드
	private String proName; // 프로젝트이름
	
	
	public int getProNum() {
		return proNum;
	}
	public void setProNum(int proNum) {
		this.proNum = proNum;
	}
	public int getProComNum() {
		return proComNum;
	}
	public void setProComNum(int proComNum) {
		this.proComNum = proComNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProReg() {
		return proReg;
	}
	public void setProReg(String proReg) {
		this.proReg = proReg;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProComment() {
		return proComment;
	}
	public void setProComment(String proComment) {
		this.proComment = proComment;
	}
	
	
	
	
	
	
}
