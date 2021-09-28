package cnav.procomments.dto;

import java.sql.Timestamp;

public class ProCommentsDTO {
	private Integer proNum;		// 프로젝트 번호
	private Integer proComNum;	// 댓글 고유 번호 
	private String userId;		// 작성자
	private Timestamp proReg;	// 작성일자
	private String proComment;	// 작성내용
	private String code;		// 회사코드 
	private String name;		// 담당자
	
	public Integer getProNum() {
		return proNum;
	}
	public void setProNum(Integer proNum) {
		this.proNum = proNum;
	}
	public Integer getProComNum() {
		return proComNum;
	}
	public void setProComNum(Integer proComNum) {
		this.proComNum = proComNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getProReg() {
		return proReg;
	}
	public void setProReg(Timestamp proReg) {
		this.proReg = proReg;
	}
	public String getProComment() {
		return proComment;
	}
	public void setProComment(String proComment) {
		this.proComment = proComment;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
