package cnav.mail.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cnav.mail.dto.MailDTO;
import cnav.main.dto.UserDTO;

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
	public int delete(String no, String id) throws SQLException;
	
	// 받은 메일 본문
	public MailDTO getMail(int num, String id) throws SQLException;
	
	// 메일 본문에서 삭제 (받은 편지함)
	public int deleteRecMail(int num, String id) throws SQLException;
	// 메일 본문에서 삭제 (보낸 편지함)
	public int deleteSendMail(int num, String id) throws SQLException;
	
	// 메일함, 보내기용 유저 리스트
	public List<UserDTO> userList(String code, String id) throws SQLException;
	
}
