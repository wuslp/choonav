package cnav.mail.dao;

import java.sql.SQLException;
import java.util.List;

import cnav.mail.dto.MailDTO;
import cnav.main.dto.UserDTO;

public interface MailDAO {
	// 받은 편지함 count
	public int recMailCount(String id) throws SQLException;
	
	// 한 페이지 받은 편지함 목록(startRow, endRow)
	public List<MailDTO> recMailList(int start, int end, String id) throws SQLException;
	
	// 받은 편지함 검색 게시글 count
	public int recMailSearchCount(String sel, String search, String id) throws SQLException;
	
	// 한 페이지 받은 편지함 검색 목록
	public List<MailDTO> recMailSearch(int start, int end, String sel, String search, String id) throws SQLException;
	
	// 보낸 편지함 count
	public int sendMailCount(String id) throws SQLException;
	
	// 한 페이지 보낸 편지함 목록(startRow, endRow)
	public List<MailDTO> sendMailList(int start, int end, String id) throws SQLException;
	
	// 보낸 편지함 검색 게시글 count
	public int sendMailSearchCount(String sel, String search, String id) throws SQLException;
	
	// 한 페이지 보낸 편지함 검색 목록
	public List<MailDTO> sendMailSearch(int start, int end, String sel, String search, String id) throws SQLException;
	
	// 메일 보내기
	public int insertMail(MailDTO dto) throws SQLException;
	
	// 메일함 선택 삭제
	public int delete(String no, String id) throws SQLException;
	
	// 받은 메일 읽었으면 result = 1로 바꿔주기
	public void readResult(int num, String id) throws SQLException;
	
	// 받은 메일 본문 확인
	public MailDTO getMail(int num) throws SQLException;
	
	// 메일 본문에서 삭제(받은 메일함)
	public int deleteRecMail(int num, String id) throws SQLException;
	// 메일 본문에서 삭제(보낸 메일함)
	public int deleteSendMail(int num, String id) throws SQLException;
	
	// 보내기, 편지함용 유저 확인
	public List<UserDTO> userList(String code, String id) throws SQLException;
}
