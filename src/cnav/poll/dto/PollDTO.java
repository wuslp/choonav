package cnav.poll.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PollDTO {

	private Integer pollNum;
	private String userId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date stDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	private String target;
	private String pollTitle;
	private String pollCon;
	private String ans1;
	private String ans2;
	private String ans3;
	private String ans4;
	private Integer res1;
	private Integer res2;
	private Integer res3;
	private Integer res4;
	private Integer total;
	private String pollStatus;
	private String code;
	
	public String getPollStatus() {
		return pollStatus;
	}
	public void setPollStatus(String pollStatus) {
		this.pollStatus = pollStatus;
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
	public Date getStDate() {
		return stDate;
	}
	public void setStDate(Date stDate) {
		this.stDate = stDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getPollTitle() {
		return pollTitle;
	}
	public void setPollTitle(String pollTitle) {
		this.pollTitle = pollTitle;
	}
	public String getPollCon() {
		return pollCon;
	}
	public void setPollCon(String pollCon) {
		this.pollCon = pollCon;
	}
	public String getAns1() {
		return ans1;
	}
	public void setAns1(String ans1) {
		this.ans1 = ans1;
	}
	public String getAns2() {
		return ans2;
	}
	public void setAns2(String ans2) {
		this.ans2 = ans2;
	}
	public String getAns3() {
		return ans3;
	}
	public void setAns3(String ans3) {
		this.ans3 = ans3;
	}
	public String getAns4() {
		return ans4;
	}
	public void setAns4(String ans4) {
		this.ans4 = ans4;
	}
	public Integer getRes1() {
		return res1;
	}
	public void setRes1(Integer res1) {
		this.res1 = res1;
	}
	public Integer getRes2() {
		return res2;
	}
	public void setRes2(Integer res2) {
		this.res2 = res2;
	}
	public Integer getRes3() {
		return res3;
	}
	public void setRes3(Integer res3) {
		this.res3 = res3;
	}
	public Integer getRes4() {
		return res4;
	}
	public void setRes4(Integer res4) {
		this.res4 = res4;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public void setCode(String code) {
		this.code=code;
	}
	public String getCode() {
		return code;
	}
	

}
