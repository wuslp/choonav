package cnav.mypage.dao;

import java.sql.SQLException;
import java.util.List;

import cnav.main.dto.UserDTO;

import cnav.mypage.dto.UserInfoDTO;


public interface MypageDAO {
	// 내 프로젝트 총개수
	public int getSearchMypjCount(String userId, String code) throws SQLException;
	// 내 자유게시글 총개수
	public int getSearchMytopicCount(String userId, String code) throws SQLException;
	// 내 프로젝트 리스트
	public List getMypjList(String userId, String code, int start, int end) throws SQLException;
	// 내 게시글 리스트
	public List getMytopicList(String userId, String code, int start, int end) throws SQLException;
	// 내가 쓴 댓글 총개수 (자유게시판)
	public int getTopicCommCount(String userId, String code) throws SQLException;
	// 내가 쓴 댓글 리스트 (자유게시판)
	public List getMytopicCommList(String userId, String code, int start, int end) throws SQLException;
	// 내가 쓴 댓글 총개수 (프로젝트)
	public int getPjCommCount(String userId, String code) throws SQLException;
	// 내가 쓴 댓글 리스트 (프로젝트)
	public List getMyPjCommList(String userId, String code, int start, int end) throws SQLException;

	
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
	// 계정정보
	public UserInfoDTO getUserInfo(String userId, String code) throws SQLException;
	// 계정정보 수정
	public int updateUserInfo(String userId, String code, UserDTO dto) throws SQLException;
	// 아이디, 비밀번호 체크
	public int idPwCheck(String userId, String pw) throws SQLException;
	// 비밀번호 변경
	public int updatePw(String userId, String pw) throws SQLException;
	// 회원탈퇴
	public void deleteUser(String userId) throws SQLException;

}
