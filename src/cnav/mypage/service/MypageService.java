package cnav.mypage.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cnav.main.dto.UserDTO;
import cnav.mypage.dto.UserInfoDTO;


public interface MypageService {
	// 내 프로젝트
	public Map<String, Object> getMyPjList(String userId, String code, String pageNum) throws SQLException;
	// 내 게시글 (자유게시판)
	public Map<String, Object> getMyTopicList(String userId, String code, String pageNum) throws SQLException;
	// 내가 쓴 댓글 (자유게시판)
	public Map<String, Object> getMyTopCommList(String userId, String code, String pageNum) throws SQLException;
	// 내가 쓴 댓글 (프로젝트)
	public Map<String, Object> getMyPjCommList(String userId, String code, String pageNum) throws SQLException;

	
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
	
	
	// 계정정보
	public UserInfoDTO getUserInfo(String userId, String code) throws SQLException;
	// 계정정보 수정
	public int updateUserInfo(String userId, String code, UserDTO dto) throws SQLException;
	// 비밀번호 변경
	public int pwChenge(String nowPw, String newPw, String userId) throws SQLException;
	// 세션 삭제
	public void removeSessionAttr(String sessionName);
	// 회원 탈퇴
	public int deleteUser(String userId, String pw) throws SQLException;
 	

}
