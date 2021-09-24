package cnav.calendar.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnav.calendar.dto.CalendarDTO;

@Repository
public class CalendarDAOImpl implements CalendarDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;

	@Override
	public List getCalList(String code) throws SQLException {
		List list = null;
		list = sqlSession.selectList("cal.getCalList", code);
		return list;
	}
	
	@Override
	public int insertCal(CalendarDTO dto) throws SQLException {
		System.out.println("dao");
		int res = sqlSession.insert("cal.insertCal", dto);
		System.out.println("1");
		return res;
	}

	@Override
	public CalendarDTO getCalContent(CalendarDTO dto) throws SQLException {
		return sqlSession.selectOne("cal.getCalContent",dto);
	}

	@Override
	public int calDelete(CalendarDTO dto) throws SQLException {
		return sqlSession.delete("cal.calDelete", dto);
	}

	@Override
	public List getMyCalList(CalendarDTO dto) throws SQLException {
		List list = sqlSession.selectList("cal.getMyCalList",dto);
		return list;
	}

	@Override
	public int updateCal(CalendarDTO dto) throws SQLException {
		return sqlSession.update("cal.updateCal",dto);
	}

	

}
