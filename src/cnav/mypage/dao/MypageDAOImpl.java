package cnav.mypage.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnav.mypage.dto.TopicCommDTO;
import cnav.mypage.service.MypageService;
import cnav.project.dto.ProjectDTO;
import cnav.reservation.dto.ReservationDTO;
import cnav.topic.dto.TopicDTO;

@Service
public class MypageDAOImpl implements MypageDAO{

	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@Override
	public int getSearchMypjCount(String userId, String code) throws SQLException {
		HashMap map = new HashMap();
		map.put("userId", userId);
		map.put("code", code);
		
		return sqlSession.selectOne("my.countMypj", map);
	}
	@Override
	public int getSearchMytopicCount(String userId, String code) throws SQLException {
		HashMap map = new HashMap();
		map.put("userId", userId);
		map.put("code", code);
		
		return sqlSession.selectOne("my.countMytopic", map);
	}

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
	@Override
	public int getTopicCommCount(String userId, String code) throws SQLException {
		HashMap map = new HashMap();
		map.put("userId", userId);
		map.put("code", code);
		
		return sqlSession.selectOne("my.countMytopicComm", map);
	}
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

}
