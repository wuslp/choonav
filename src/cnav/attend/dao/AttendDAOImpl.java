package cnav.attend.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnav.attend.dto.AttendDTO;

@Repository
public class AttendDAOImpl implements AttendDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;

	@Override
	public int getAttendCount(String id) throws SQLException {
		int result = sqlSession.selectOne("attend.countAll",id); 
		return result;
	}

	@Override
	public List<AttendDTO> AttendList(int startRow, int endRow, String userId) throws SQLException {
		
		//파라미터 한개밖에안되서 hashMap 에 저장해서 보낼거다
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("userId", userId);
				
		List<AttendDTO> attList= sqlSession.selectList("attend.getList",map);
		return attList;
	}
	//category 선택
	@Override
	public int getAttendCount2(String id, String category) throws SQLException {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id",id);
		map.put("category", category);
		System.out.println("95번 카테고리 선택"+category);
		int result = sqlSession.selectOne("attend.countCat",map);
		System.out.println("93번"+result);
		return result;
	}

	@Override
	public List<AttendDTO> AttendList2(int startRow, int endRow, String userId, String category) throws SQLException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("userId", userId);
		map.put("category", category);
		List<AttendDTO> catList = sqlSession.selectList("attend.getAttList",map);
		return catList;
	}

	@Override
	public void workInsert(String userId) throws SQLException {
		sqlSession.insert("attend.worktime",userId);
		sqlSession.update("attend.workAttendance",userId);
	}

	@Override
	public void workInsert2(String userId) throws SQLException {
		sqlSession.update("attend.worktime2",userId);
		sqlSession.update("attend.leaveAttendance",userId);
	}



}
