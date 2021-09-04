package cnav.attend.dao;

import java.sql.SQLException;
import java.util.List;

import cnav.attend.dto.AttendDTO;

public interface AttendDAO {

	// 전체 근태리스트 개수 가져오기 
	public int getAttendCount(String id) throws SQLException;  
			
	public List<AttendDTO> AttendList(int startRow,int endRow,String userId) throws SQLException;

	
}
