package cnav.mypage.dto;

import java.sql.Timestamp;

public class TopicCommDTO {

	private Integer topComNum; // 댓글번호 re_no
	private Integer topNum;// 글번호 num
	private String userId;// 작성자 id
	private Timestamp topReg;// 작성일 reg
	private String topComment;// 내용 recontent
	private String topTitle; // 글제목
	private String code;
	
	public Integer getTopComNum() {
		return topComNum;
	}
	public void setTopComNum(Integer topComNum) {
		this.topComNum = topComNum;
	}
	public Integer getTopNum() {
		return topNum;
	}
	public void setTopNum(Integer topNum) {
		this.topNum = topNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getTopReg() {
		return topReg;
	}
	public void setTopReg(Timestamp topReg) {
		this.topReg = topReg;
	}
	public String getTopComment() {
		return topComment;
	}
	public void setTopComment(String topComment) {
		this.topComment = topComment;
	}
	public String getTopTitle() {
		return topTitle;
	}
	public void setTopTitle(String topTitle) {
		this.topTitle = topTitle;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	
}
