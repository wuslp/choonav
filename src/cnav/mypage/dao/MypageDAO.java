package cnav.mypage.dao;

import java.sql.SQLException;
import java.util.List;

import cnav.main.dto.UserDTO;
import cnav.mypage.dto.UserInfoDTO;

public interface MypageDAO {

	public int getSearchMypjCount(String userId, String code) throws SQLException;
	public int getSearchMytopicCount(String userId, String code) throws SQLException;
	public List getMypjList(String userId, String code, int start, int end) throws SQLException;
	public List getMytopicList(String userId, String code, int start, int end) throws SQLException;
	public int getTopicCommCount(String userId, String code) throws SQLException;
	public List getMytopicCommList(String userId, String code, int start, int end) throws SQLException;
	public UserInfoDTO getUserInfo(String userId, String code) throws SQLException;
	public int updateUserInfo(String userId, String code, UserDTO dto) throws SQLException;
	public int idPwCheck(String userId, String pw) throws SQLException;
	public int updatePw(String userId, String pw) throws SQLException;
	public void deleteUser(String userId) throws SQLException;
}
