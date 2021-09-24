package cnav.mypage.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cnav.main.dto.UserDTO;

public interface MypageService {

	public Map<String, Object> getMyPjList(String userId, String code, String pageNum) throws SQLException;
	public Map<String, Object> getMyTopicList(String userId, String code, String pageNum) throws SQLException;
	public Map<String, Object> getMyTopCommList(String userId, String code, String pageNum) throws SQLException;
	
	// 회사 코드 내에 있는 세션 로그인한 사람이 관리자가 맞는지 확인
	public int manageCheck(String id, String code) throws SQLException;
	// 관리자 코드랑 같은 유저 리스트 뽑기
	public Map<String, Object> userList(String pageNum, String code) throws SQLException;
	// 회사 코드 안에서 관리자가 검색한 유저 리스트 뽑기
	public Map<String, Object> userListSearch(String pageNum, String sel, String search, String code) throws SQLException;
	
	// 팝업 -> 한명 불러오기
	public UserDTO userOne(String id) throws SQLException;
	// 팝업 -> 사원 정보 dept 수정
	public int updateDepUser(UserDTO dto) throws SQLException;
	// 팝업 -> 사원 정보 posi 수정
	public int updatePosUser(UserDTO dto) throws SQLException;
	
	
}
