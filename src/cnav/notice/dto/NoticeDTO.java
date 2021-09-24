package cnav.notice.dto;

import java.sql.Timestamp;

public class NoticeDTO {

	private Integer notiNum;
	private String notiTitle;
	private String notiContent;
	private Timestamp notiDate;
	private String userId;
	private Integer readcount;
	private String code;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Integer getNotiNum() {
		return notiNum;
	}
	public void setNotiNum(Integer notiNum) {
		this.notiNum = notiNum;
	}
	public String getNotiTitle() {
		return notiTitle;
	}
	public void setNotiTitle(String notiTitle) {
		this.notiTitle = notiTitle;
	}
	public String getNotiContent() {
		return notiContent;
	}
	public void setNotiContent(String notiContent) {
		this.notiContent = notiContent;
	}
	public Timestamp getNotiDate() {
		return notiDate;
	}
	public void setNotiDate(Timestamp notiDate) {
		this.notiDate = notiDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getReadcount() {
		return readcount;
	}
	public void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}
	
}
