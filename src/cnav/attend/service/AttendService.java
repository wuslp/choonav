package cnav.attend.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface AttendService {

	public Map<String, Object> attendList(String pageNum) throws SQLException;
	
	
}
