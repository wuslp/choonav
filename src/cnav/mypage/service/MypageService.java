package cnav.mypage.service;

import java.sql.SQLException;
import java.util.Map;

public interface MypageService {

	public Map<String, Object> getMyPjList(String userId, String code, String pageNum) throws SQLException;
	public Map<String, Object> getMyTopicList(String userId, String code, String pageNum) throws SQLException;
	public Map<String, Object> getMyTopCommList(String userId, String code, String pageNum) throws SQLException;
	
}
