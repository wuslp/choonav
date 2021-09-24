package cnav.admin.service;

import java.sql.SQLException;
import java.util.Map;

public interface AdminService {
	
	// 전체관리자 mypage리스트 가져오기 
	public Map<String, Object> getArticleList(String pageNum) throws SQLException;
	
	// 회사관리자로 전환
	public void authUpdate0(String userId) throws SQLException;
	
	// 회원으로 전환
	public void authUpdate1(String userId) throws SQLException;

}
