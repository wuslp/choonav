package cnav.attend.dao;

import java.sql.SQLException;
import java.util.List;

import cnav.attend.dto.AttendDTO;

public interface AttendDAO {

	// 전체 근태리스트 가져오기 
	public int getAttendCount(String id) throws SQLException; //개수 
	public List<AttendDTO> AttendList(int startRow,int endRow,String userId) throws SQLException;//리스트
	//category선택한리스트
	public int getAttendCount2(String id,String category) throws SQLException; //개수 
	public List<AttendDTO> AttendList2(int startRow,int endRow,String userId,String category) throws SQLException;//리스트
	//category, 날짜 선택한리스트
	public int getAttendCount3(String id, String search1, String search2) throws SQLException; //개수 
	public List<AttendDTO> AttendList3(int startRow,int endRow,String userId,String search1, String search2) throws SQLException;//리스트
	
	//출퇴근입력
	public void workInsert(String userId) throws SQLException;
	public void workInsert2(String userId) throws SQLException;
}
