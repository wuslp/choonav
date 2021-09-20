package cnav.calendar.dao;

import java.sql.SQLException;
import java.util.List;

import cnav.calendar.dto.CalendarDTO;

public interface CalendarDAO {

	// 전체 일정정보 가져오기
	public List getCalList(String code) throws SQLException;
	// 내 일정정보 가져오기
	public List getMyCalList(CalendarDTO dto) throws SQLException;
	// 일정정보 저장하기
	public int insertCal(CalendarDTO dto) throws SQLException;
	// 일정상세 정보 가져오기
	public CalendarDTO getCalContent(CalendarDTO dto) throws SQLException;
	// 일정정보 삭제
	public int calDelete(CalendarDTO dto) throws SQLException;
	// 일정정보 수정
	public int updateCal(CalendarDTO dto) throws SQLException;
}
