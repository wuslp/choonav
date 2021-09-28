package cnav.topic.dto;

import java.sql.Timestamp;

public class TopicDTO {

	private Integer topNum;
	private String topTitle;
	private String topContent;
	private Timestamp topDate;
	private String userId;
	private Integer readcount;
	private Integer recnt; // 게시글 댓글 수
	private String code;
	
	private String name; // users테이블의 name가져오기
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Integer getRecnt() {
		return recnt;
	}
	public void setRecnt(Integer recnt) {
		this.recnt = recnt;
	}
	public Integer getReadcount() {
		return readcount;
	}
	public void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}
	public Integer getTopNum() {
		return topNum;
	}
	public void setTopNum(Integer topNum) {
		this.topNum = topNum;
	}
	public String getTopTitle() {
		return topTitle;
	}
	public void setTopTitle(String topTitle) {
		this.topTitle = topTitle;
	}
	public String getTopContent() {
		return topContent;
	}
	public void setTopContent(String topContent) {
		this.topContent = topContent;
	}
	public Timestamp getTopDate() {
		return topDate;
	}
	public void setTopDate(Timestamp topDate) {
		this.topDate = topDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	// toString()
	// boardVO -> TopicDTO
	// bno -> topNum
	// title -> topTitle
	// content -> topContent
	// writer -> userId
	// userName
	// regdate -> topDate
	// viewcnt -> readcount
	// recnt -> recnt
	@Override
	public String toString() {
        return "TopicDTO [topNum=" + topNum + ", topTitle=" + topTitle + ", topContent=" + topContent + ", userId=" + userId
                + ", topDate=" + topDate + ", readcount=" + readcount + ", recnt=" + recnt + "]";
    }
}
