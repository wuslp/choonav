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



}
