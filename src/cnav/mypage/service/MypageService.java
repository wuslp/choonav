package cnav.mypage.service;

import java.sql.SQLException;
import java.util.Map;

import cnav.main.dto.UserDTO;
import cnav.mypage.dto.UserInfoDTO;

public interface MypageService {

	public Map<String, Object> getMyPjList(String userId, String code, String pageNum) throws SQLException;
	public Map<String, Object> getMyTopicList(String userId, String code, String pageNum) throws SQLException;
	public Map<String, Object> getMyTopCommList(String userId, String code, String pageNum) throws SQLException;
	public UserInfoDTO getUserInfo(String userId, String code) throws SQLException;
	public int updateUserInfo(String userId, String code, UserDTO dto) throws SQLException;
	public int pwChenge(String nowPw, String newPw, String userId) throws SQLException;
	// 세션 삭제
	public void removeSessionAttr(String sessionName);
	public int deleteUser(String userId, String pw) throws SQLException;
 	
}
