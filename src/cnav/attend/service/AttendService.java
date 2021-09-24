package cnav.attend.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface AttendService {

	//리스트불러오기
	public Map<String, Object> attendList(String pageNum) throws SQLException;//전체
	public Map<String, Object> attendList2(String pageNum,String category) throws SQLException;//카테고리
	public Map<String, Object> attendList3(String pageNum,String category,String search1,String search2) throws SQLException;//카테고리,날짜
	//출퇴근입력
	public void workInsert() throws SQLException;
	public void workInsert2() throws SQLException;
	//출근 기록 여부
	public int WTrecodeCheck() throws SQLException;
	//출근 기록
	public String getWorktimeRecode() throws SQLException;
	//퇴근 기록 여부
	public int LTrecodeCheck() throws SQLException;
	//퇴근 기록
	public String getLeavetimeRecode() throws SQLException;

	
}
