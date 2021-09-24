package cnav.mypage.dao;

import java.sql.SQLException;
import java.util.List;

import cnav.main.dto.UserDTO;

public interface MypageDAO {

	public int getSearchMypjCount(String userId, String code) throws SQLException;
	public int getSearchMytopicCount(String userId, String code) throws SQLException;
	public List getMypjList(String userId, String code, int start, int end) throws SQLException;
	public List getMytopicList(String userId, String code, int start, int end) throws SQLException;
	public int getTopicCommCount(String userId, String code) throws SQLException;
	public List getMytopicCommList(String userId, String code, int start, int end) throws SQLException;
	
	// 관리자 맞는지 확인
	public int manageCheck(String id, String code) throws SQLException;
	// 회사 사원 정보 count
	public int userListCount(String code) throws SQLException;
	// 회사 사원 정보 list
	public List userList(int start, int end, String code) throws SQLException;
	// 검색했을때 회사 사원 정보 count
	public int userListSearchCount(String sel, String search, String code) throws SQLException;
	// 검색했을때 회사 사원 정보 list
	public List userListSearch(int start, int end, String sel, String search, String code) throws SQLException;
	// 팝업 -> 한 사람 정보 불러오기
	public UserDTO userOne(String id) throws SQLException;
	// 팝업 -> dept 수정
	public int updateDepUser(UserDTO dto) throws SQLException;
	// 팝업 -> posi 수정
	public int updatePosUser(UserDTO dto) throws SQLException;
}
