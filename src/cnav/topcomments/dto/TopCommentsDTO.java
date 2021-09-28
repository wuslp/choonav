package cnav.topcomments.dto;

import java.sql.Timestamp;

public class TopCommentsDTO {
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	private Integer topComNum; // 댓글번호 re_no
	private Integer topNum;// 글번호 num
	private String userId;// 작성자 id
	private Timestamp topReg;// 작성일 reg
	private String topComment;// 내용 recontent
	private String code;// 회사 코드
	
	private String name; // users테이블의 이름
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
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
	
	// toString()
	// replyVO -> TopCommentsDTO
	// rno -> topComNum
	// bno -> topNum
	// replytext -> topComment
	// replyer -> userId
	// userName
	// regdate -> topReg
	// updatedate
	@Override
	public String toString() {
        return "TopCommentsDTO [topComNum=" + topComNum + ", topNum=" + topNum + ", topComment=" + topComment + ", userId=" + userId
                + ", topReg=" + topReg + "]";
    }
}
