package cnav.poll.dto;

public class PollCommentsDTO {

	private Integer pollComNum;
	private Integer pollNum ;
	private String userId;
	private String pollReg;
	private String pollComment;
	private String code;
	
	public Integer getPollComNum() {
		return pollComNum;
	}
	public void setPollComNum(Integer pollComNum) {
		this.pollComNum = pollComNum;
	}
	public Integer getPollNum() {
		return pollNum;
	}
	public void setPollNum(Integer pollNum) {
		this.pollNum = pollNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPollReg() {
		return pollReg;
	}
	public void setPollReg(String pollReg) {
		this.pollReg = pollReg;
	}
	public String getPollComment() {
		return pollComment;
	}
	public void setPollComment(String pollComment) {
		this.pollComment = pollComment;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
