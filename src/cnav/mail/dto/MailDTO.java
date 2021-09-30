package cnav.mail.dto;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class MailDTO {
	
	private Integer mailNum;
	private String userId;
	private String mailRid;
	private String mailSub;
	private String mailContent;
	private String fileName;
	private String mailResult;
	private Timestamp mailReg;
	private String userName;
	private String ridName;
	private MultipartFile uploadFile;
	
	

	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRidName() {
		return ridName;
	}
	public void setRidName(String ridName) {
		this.ridName = ridName;
	}
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

	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
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
