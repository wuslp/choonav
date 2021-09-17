package cnav.mail.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cnav.mail.dto.MailDTO;

public interface MailService {
	
	// 받은 편지함 list
	public Map<String, Object> recMailList(String pageNum, String id) throws SQLException;
	// 받은 편지함 검색 list
	public Map<String, Object> recMailSearch(String pageNum, String sel, String search, String id) throws SQLException;
	// 보낸 편지함 list
	public Map<String, Object> sendMailList(String pageNum, String id) throws SQLException;
	// 보낸 편지함 검색 list
	public Map<String, Object> sendMailSearch(String pageNum, String sel, String search, String id) throws SQLException;
	
	// 메일 보내기
	public int insertMail(MailDTO dto) throws SQLException;
	
	// 메일함 선택 삭제
	public int delete(String no) throws SQLException;
	
	// 받은 메일 본문
	public MailDTO getMail(int num) throws SQLException;
	
	// 메일 본문에서 삭제
	public int deleteMail(int num) throws SQLException;
	
}
