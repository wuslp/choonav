package cnav.attend.dao;

import java.sql.SQLException;
import java.util.List;

import cnav.attend.dto.AttendDTO;

public interface AttendDAO {

	// 전체 근태리스트 가져오기 
	public int getAttendCount(String id,String code) throws SQLException; //개수 - 로그인중인 id와 회사코드로
	public List<AttendDTO> AttendList(int startRow,int endRow,String userId,String code) throws SQLException;//리스트
	//category선택한리스트
	public int getAttendCount2(String id,String category,String code) throws SQLException; //개수 
	public List<AttendDTO> AttendList2(int startRow,int endRow,String userId,String category,String code) throws SQLException;//리스트
	//category, 날짜 선택한리스트
	public int getAttendCount3(String id, String search1, String search2, String code) throws SQLException; //개수 
	public List<AttendDTO> AttendList3(int startRow,int endRow,String userId,String search1, String search2, String code) throws SQLException;//리스트
	
	//출퇴근입력
	public void workInsert(String userId,String code) throws SQLException;
	public void workInsert2(String userId, String code) throws SQLException;
	//출근기록 체크
	public int WTrecodeCheck(String userId,String code) throws SQLException;
	//출근 기록
	public String getWorktimeRecode(String userId, String code) throws SQLException;
	//퇴근기록 체크
	public int LTrecodeCheck(String userId,String code) throws SQLException;
	//퇴근 기록
	public String getLeavetimeRecode(String userId, String code) throws SQLException;
		
}
