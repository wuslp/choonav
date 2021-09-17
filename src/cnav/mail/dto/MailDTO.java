package cnav.mail.dto;

import java.sql.Timestamp;

public class MailDTO {
	
	private Integer mailNum;
	private String userId;
	private String mailRid;
	private String mailSub;
	private String mailContent;
	private String mailFile;
	private String mailResult;
	private Timestamp mailReg;
	

	public Integer getMailNum() {
		return mailNum;
	}
	public void setMailNum(Integer mailNum) {
		this.mailNum = mailNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMailRid() {
		return mailRid;
	}
	public void setMailRid(String mailRid) {
		this.mailRid = mailRid;
	}
	public String getMailSub() {
		return mailSub;
	}
	public void setMailSub(String mailSub) {
		this.mailSub = mailSub;
	}
	public String getMailContent() {
		return mailContent;
	}
	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}
	public String getMailFile() {
		return mailFile;
	}
	public void setMailFile(String mailFile) {
		this.mailFile = mailFile;
	}
	public String getMailResult() {
		return mailResult;
	}
	public void setMailResult(String mailResult) {
		this.mailResult = mailResult;
	}
	public Timestamp getMailReg() {
		return mailReg;
	}
	public void setMailReg(Timestamp mailReg) {
		this.mailReg = mailReg;
	}

}
