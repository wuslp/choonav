package cnav.mail.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnav.mail.dao.MailDAOImpl;
import cnav.mail.dto.MailDTO;
import cnav.main.dto.UserDTO;

@Repository
public class MailServiceImpl implements MailService {
	
	@Autowired
	private MailDAOImpl MailDAO = null;

	// 받은 메일함 목록 가져오기
	@Override
	public Map<String, Object> recMailList(String pageNum, String id) throws SQLException {
		int pageSize = 10;
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		List<MailDTO> recMailList = null;
		int count = 0;
		int number = 0;
		
		count = MailDAO.recMailCount(id); // DB 저장된 받은 메일 갯수
		System.out.println("받은메일 count : " + count);
		
		if(count > 0) {
			recMailList = MailDAO.recMailList(startRow, endRow, id);
		}
		number = count - (currentPage - 1) * pageSize;
		
		Map<String, Object> result = new HashMap<>();
		result.put("pageSize", pageSize);
		result.put("pageNum", pageNum);
		result.put("currentPage", currentPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("recMailList", recMailList);
		result.put("count", count);
		result.put("number", number);
 
		
		return result;
	}
	
	// 검색한 받은 메일함 가져오기
	@Override
	public Map<String, Object> recMailSearch(String pageNum, String sel, String search, String id) throws SQLException {
		int pageSize = 10;
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		List<MailDTO> recMailList = null;
		int count = 0;
		int number = 0;
		
		count = MailDAO.recMailSearchCount(sel, search, id); // DB 저장된 받은 메일 갯수
		System.out.println("받은메일 검색 count : " + count);
		
		if(count > 0) {
			recMailList = MailDAO.recMailSearch(startRow, endRow, sel, search, id);
		}
		number = count - (currentPage - 1) * pageSize;
		
		Map<String, Object> result = new HashMap<>();
		result.put("pageSize", pageSize);
		result.put("pageNum", pageNum);
		result.put("currentPage", currentPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("recMailList", recMailList);
		result.put("count", count);
		result.put("number", number);

		
		return result;
	}
	
	// 보낸 메일함 목록 가져오기
	@Override
	public Map<String, Object> sendMailList(String pageNum, String id) throws SQLException {
		int pageSize = 10;
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		List<MailDTO> sendMailList = null;
		int count = 0;
		int number = 0;
		
		count = MailDAO.sendMailCount(id); // DB 저장된 보낸 메일 갯수
		System.out.println("보낸 메일 count : " + count);
		
		if(count > 0) {
			sendMailList = MailDAO.sendMailList(startRow, endRow, id);
		}
		number = count - (currentPage - 1) * pageSize;
		
		Map<String, Object> result = new HashMap<>();
		result.put("pageSize", pageSize);
		result.put("pageNum", pageNum);
		result.put("currentPage", currentPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("sendMailList", sendMailList);
		result.put("count", count);
		result.put("number", number);
		
		
		return result;
	}
	
	// 검색한 보낸 메일함 가져오기
	@Override
	public Map<String, Object> sendMailSearch(String pageNum, String sel, String search, String id) throws SQLException {
		int pageSize = 10;
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		List<MailDTO> sendMailList = null;
		int count = 0;
		int number = 0;
		
		count = MailDAO.sendMailSearchCount(sel, search, id); // DB 저장된 받은 메일 갯수 
		System.out.println("보낸 메일 검색 count : " + count);
		
		if(count > 0) {
			sendMailList = MailDAO.sendMailSearch(startRow, endRow, sel, search, id);
		}
		number = count - (currentPage - 1) * pageSize;
		
		Map<String, Object> result = new HashMap<>();
		result.put("pageSize", pageSize);
		result.put("pageNum", pageNum);
		result.put("currentPage", currentPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("sendMailList", sendMailList);
		result.put("count", count);
		result.put("number", number);
		
		
		return result;
	}
	
	// 메일 보내기
	@Override
	public int insertMail(MailDTO dto) throws SQLException {
		int result = MailDAO.insertMail(dto);
		
		return result;
	}

	// 메일 리스트에서 삭제
	@Override
	public int delete(String no, String id) throws SQLException {
		int result = MailDAO.delete(no, id);
		return result;
	}
	
	// 받은 메일 확인
	@Override
	public MailDTO getMail(int num, String id) throws SQLException {
		// 읽었으면 result 1로 바꿔주기
		MailDAO.readResult(num, id);
		// 받은 메일 본문
		MailDTO mail = MailDAO.getMail(num);
		
		return mail;
	}
	
	// 메일함, 보내기용 유저 리스트
	@Override
	public List<UserDTO> userList(String code, String id) throws SQLException {
		List<UserDTO> userList = MailDAO.userList(code, id);
		
		return userList;
	}
	
	// 메일 본문에서 삭제 (받은 메일함)
	@Override
	public int deleteRecMail(int num, String id) throws SQLException {
		int result = MailDAO.deleteRecMail(num, id);
		return result;
	}
	// 메일 본문에서 삭제 (보낸 메일함)
	@Override
	public int deleteSendMail(int num, String id) throws SQLException {
		int result = MailDAO.deleteSendMail(num, id);
		return result;
	}

}
