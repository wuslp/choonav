package cnav.calendar.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnav.calendar.dao.CalendarDAOImpl;
import cnav.calendar.dto.CalendarDTO;

@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	private CalendarDAOImpl calDAO = null;
	
	@Override
	public List getCalList(String code) throws SQLException {
		List<CalendarDTO> list = null;
		list = calDAO.getCalList(code);
		return list;
	}
	
	@Override
	public int insertCal(CalendarDTO dto) throws SQLException {
		System.out.println("s");
		int res = calDAO.insertCal(dto);
		System.out.println("s1");
		return res;
	}

	@Override
	public CalendarDTO getCalContent(CalendarDTO dto) throws SQLException {
		
		return calDAO.getCalContent(dto);
	}

	@Override
	public int calDelete(CalendarDTO dto) throws SQLException {
		return calDAO.calDelete(dto);
	}

	@Override
	public List getMycalList(String userId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List getMyCalList(CalendarDTO dto) throws SQLException {
		List list = calDAO.getMyCalList(dto);
		return list;
	}

	@Override
	public int updateCal(CalendarDTO dto) throws SQLException {
		return calDAO.updateCal(dto);
	}

	

}
