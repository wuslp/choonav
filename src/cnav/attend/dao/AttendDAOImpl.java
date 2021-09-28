package cnav.attend.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnav.attend.dto.AttendDTO;

@Repository
public class AttendDAOImpl implements AttendDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;

	//리스트 시작
	@Override
	public int getAttendCount(String id, String code) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", id);
		map.put("code", code);
		int result = sqlSession.selectOne("attend.countAll",map); 
		return result;
	}
	//본인 근태기록 가져오기
	@Override
	public List<AttendDTO> AttendList(int startRow, int endRow, String userId,String code) throws SQLException {
		
		//파라미터 한개밖에안되서 hashMap 에 저장해서 보낼거다
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("userId", userId);
		map.put("code", code);
				
		List<AttendDTO> attList= sqlSession.selectList("attend.getList",map);
		/*
		 * int result =sqlSession.update("attend.setLeaveNull",map);
		 * System.out.println("90번 퇴근체크안된기록 있는지 : "+result);
		 */
		return attList;
	}
	//category 선택 개수
	@Override
	public int getAttendCount2(String id, String category,String code) throws SQLException {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId",id);
		map.put("category", category);
		map.put("code", code);
		System.out.println("95번 카테고리 선택"+category);
		int result = sqlSession.selectOne("attend.countCat",map);
		System.out.println("93번"+result);
		return result;
	}
	//category 선택 리스트
	@Override
	public List<AttendDTO> AttendList2(int startRow, int endRow, String userId, String category,String code) throws SQLException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("userId", userId);
		map.put("category", category);
		map.put("code", code);
		List<AttendDTO> catList = sqlSession.selectList("attend.getAttList",map);
		return catList;
	}
	//날짜 선택 개수
	@Override
	public int getAttendCount3(String id, String search1, String search2, String code) throws SQLException {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id",id);
		//map.put("category", category);
		map.put("search1", search1);
		map.put("search2", search2);
		map.put("search2", search2);
		map.put("code", code);
		System.out.println("91번 날짜 선택"+search1+"날짜"+search2);
		int result = sqlSession.selectOne("attend.countDate",map);
		System.out.println("90번"+result);
		return result;
	}
	//날짜 선택 리스트
	@Override
	public List<AttendDTO> AttendList3(int startRow, int endRow, String userId, String search1,String search2, String code) throws SQLException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("userId", userId);
		//map.put("category", category);
		map.put("search1", search1);
		map.put("search2", search2);
		map.put("code", code);
		List<AttendDTO> catDateList = sqlSession.selectList("attend.getDateList",map);
		
		return catDateList;
	}//리스트 끝
	
	//출퇴근 입력
	@Override
	public void workInsert(String userId, String code) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("code", code);
		sqlSession.insert("attend.worktime",map);
		sqlSession.update("attend.workAttendance",map);
	}

	@Override
	public void workInsert2(String userId, String code) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("code", code);

		sqlSession.update("attend.worktime2",map);
		sqlSession.update("attend.leaveAttendance",map);
		sqlSession.update("attend.AttendanceSet",map);
	}
	//출근 기록 여부 체크 
	@Override
	public int WTrecodeCheck(String userId, String code) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("code", code);
		int recodeCheck=sqlSession.selectOne("attend.workRecodeCheck",map);
		return recodeCheck;
	}
	//출근 기록 가져오기
	@Override
	public String getWorktimeRecode(String userId, String code) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("code", code);
		String result = sqlSession.selectOne("attend.workRecode",map);
		return result;
	}
	//퇴근 기록 여부 체크 
	@Override
	public int LTrecodeCheck(String userId, String code) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("code", code);
		int recodeCheck=sqlSession.selectOne("attend.leaveRecodeCheck",map);
		return recodeCheck;
	}

	//퇴근기록 가져오기
	@Override
	public String getLeavetimeRecode(String userId, String code) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("code", code);
		String result = sqlSession.selectOne("attend.leaveRecode",map);
		return result;
	}

	



}
