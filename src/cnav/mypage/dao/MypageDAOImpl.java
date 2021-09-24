package cnav.mypage.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cnav.mail.dto.MailDTO;
import cnav.main.dto.UserDTO;
import cnav.mypage.dto.PjCommDTO;
import cnav.mypage.dto.TopicCommDTO;
import cnav.mypage.dto.UserInfoDTO;
import cnav.mypage.service.MypageService;
import cnav.project.dto.ProjectDTO;
import cnav.reservation.dto.ReservationDTO;
import cnav.topic.dto.TopicDTO;

@Service
public class MypageDAOImpl implements MypageDAO{

	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	// 내프로젝트 총개수
	@Override
	public int getSearchMypjCount(String userId, String code) throws SQLException {
		HashMap map = new HashMap();
		map.put("userId", userId);
		map.put("code", code);
		
		return sqlSession.selectOne("my.countMypj", map);
	}
	
	// 내게시물 총개수
	@Override
	public int getSearchMytopicCount(String userId, String code) throws SQLException {
		HashMap map = new HashMap();
		map.put("userId", userId);
		map.put("code", code);
		
		return sqlSession.selectOne("my.countMytopic", map);
	}
	
	// 내프로젝트 리스트 가져오기
	@Override
	public List getMypjList(String userId, String code, int start, int end) throws SQLException {
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("code", code);
		map.put("userId", userId);
		
		
		List<ProjectDTO> list = sqlSession.selectList("my.selectMypjlist", map);
		
		return list;
	}

	// 내게시물 리스트 가져오기
	@Override
	public List getMytopicList(String userId, String code, int start, int end) throws SQLException {
		System.out.println("topic service");
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("code", code);
		map.put("userId", userId);
		
		
		List<TopicDTO> list = sqlSession.selectList("my.selectMytopiclist", map);
		System.out.println("dao"+list);
		return list;
	}
	
	// 내가쓴 댓글 개수 (자유게시판)
	@Override
	public int getTopicCommCount(String userId, String code) throws SQLException {
		HashMap map = new HashMap();
		map.put("userId", userId);
		map.put("code", code);
		
		return sqlSession.selectOne("my.countMytopicComm", map);
	}
	
	// 내가쓴 댓글 리스트 가져오기 (자유게시판)
	@Override
	public List getMytopicCommList(String userId, String code, int start, int end) throws SQLException {
		System.out.println("topic service");
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("code", code);
		map.put("userId", userId);
		
		
		List<TopicCommDTO> list = sqlSession.selectList("my.selectMytopicCommlist", map);
		System.out.println("dao"+list);
		
		return list;
	}
	
	// 관리자 맞는지, 코드 맞는지 확인
	@Override
	public int manageCheck(String id, String code) throws SQLException {
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("code", code);
		int count = sqlSession.selectOne("my.manageCheck", map);
		return count;
	}
	
	// 회사 사원 정보 count
	@Override
	public int userListCount(String code) throws SQLException {
		int result = sqlSession.selectOne("my.userListCount", code);
		return result;
	}
	// 회사 사원 정보 list
	@Override
	public List userList(int start, int end, String code) throws SQLException {
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("code", code);
		
		List<UserDTO> userList = sqlSession.selectList("my.userList", map);
		
		return userList;
	}
	// 검색한 회사 사원 정보 count
	@Override
	public int userListSearchCount(String sel, String search, String code) throws SQLException {
		HashMap map = new HashMap();
		map.put("sel", sel);
		map.put("search", search);
		map.put("code", code);
		
		int result = sqlSession.selectOne("my.userListSearchCount", map);
		return result;
	}
	// 검색한 회사 사원 정보 list
	@Override
	public List userListSearch(int start, int end, String sel, String search, String code) throws SQLException {
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("sel", sel);
		map.put("search", search);
		map.put("code", code);
		
		List<UserDTO> userListSearch = sqlSession.selectList("my.userListSearch", map);
		return userListSearch;
	}
	// 팝업 -> 한명 정보 가져오기
	@Override
	public UserDTO userOne(String id) throws SQLException {
		UserDTO userOne = sqlSession.selectOne("my.userOne", id);
		return userOne;
	}
	// dept 수정
	@Override
	public int updateDepUser(UserDTO dto) throws SQLException {
		int result = sqlSession.update("my.updateDeUser", dto);
		return result;
	}
	// posi 수정
	@Override
	public int updatePosUser(UserDTO dto) throws SQLException {
		int result = sqlSession.update("my.updatePosUser", dto);
		return result;
	}
	
	// 계정정보
	@Override
	public UserInfoDTO getUserInfo(String userId, String code) throws SQLException {
		HashMap map = new HashMap();
		map.put("userId", userId);
		map.put("code", code);
		
		UserInfoDTO dto = sqlSession.selectOne("my.selectUserInfo", map);
		return dto;
	}
	
	// 계정정보 수정
	@Override
	public int updateUserInfo(String userId, String code, UserDTO dto) throws SQLException {
		HashMap map = new HashMap();
		map.put("userId", userId);
		map.put("email", dto.getEmail());
		map.put("tel", dto.getTel());
		
		int result = sqlSession.update("my.UpdateUser", map);
		return result;
	}
	
	// id, pw 체크
	@Override
	public int idPwCheck(String userId, String pw) throws SQLException {
		HashMap map = new HashMap();
		map.put("userId", userId);
		map.put("pw", pw);
		
		int result = sqlSession.selectOne("my.idPwCheck", map);
		return result;
	}
	
	// pw 변경
	@Override
	public int updatePw(String userId, String pw) throws SQLException {
		HashMap map = new HashMap();
		map.put("userId", userId);
		map.put("pw", pw);
		
		int result = sqlSession.update("my.updatePw", map);
		return result;
	}
	
	// 회원탈퇴
	@Override
	public void deleteUser(String userId) throws SQLException {
		sqlSession.delete("my.deleteUser", userId);
	}

	// 내가쓴 댓글 개수 (프로젝트)
	@Override
	public int getPjCommCount(String userId, String code) throws SQLException {
		HashMap map = new HashMap();
		map.put("userId", userId);
		map.put("code", code);
		
		return sqlSession.selectOne("my.countMyPjComm", map);
	}

	// 내가쓴 댓글 리스트 (프로젝트)
	@Override
	public List getMyPjCommList(String userId, String code, int start, int end) throws SQLException {
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("code", code);
		map.put("userId", userId);
		
		
		List<PjCommDTO> list = sqlSession.selectList("my.selectMyPjCommlist", map);
		
		return list;
	}

}
