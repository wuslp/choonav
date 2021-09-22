package cnav.poll.dto;

public class PollUserDTO {

	private String pollNum;
	private String userId;
	private String code;
	
	public void setCode(String code) {
		this.code= code;
	}
	public String getCode() {
		return code;
	}
	
	public String getPollNum() {
		return pollNum;
	}
	public void setPollNum(String pollNum) {
		this.pollNum = pollNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
