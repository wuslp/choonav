package cnav.mail.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnav.mail.dto.MailDTO;
import cnav.main.dto.UserDTO;

@Repository
public class MailDAOImpl implements MailDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	// 받은 편지함 count
	@Override
	public int recMailCount(String id) throws SQLException {
		int result = sqlSession.selectOne("mail.recCount", id);
		return result;
	}
	
	// 한 페이지 받은 편지함 list
	@Override
	public List<MailDTO> recMailList(int start, int end, String id) throws SQLException {
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		
		List<MailDTO> recMailList = sqlSession.selectList("mail.recMailList", map);
		
		return recMailList;
	}
	
	// 검색한 받은 편지함 count
	@Override
	public int recMailSearchCount(String sel, String search, String id) throws SQLException {
		
		HashMap map = new HashMap();
		map.put("sel", sel);
		map.put("search", search);
		map.put("id", id);
		
		int result = sqlSession.selectOne("mail.recSearchCount", map);
		
		return result;
	}
	
	// 검색한 받은 편지함 list
	@Override
	public List<MailDTO> recMailSearch(int start, int end, String sel, String search, String id) throws SQLException {
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("sel", sel);
		map.put("search", search);
		map.put("id", id);
		
		List<MailDTO> recMailList = sqlSession.selectList("mail.recMailSearch", map);
		
		return recMailList;
	}
	
	
	// 보낸 편지함 count
	@Override
	public int sendMailCount(String id) throws SQLException {
		int result = sqlSession.selectOne("mail.sendCount", id);
		return result;
	}
	
	// 한 페이지 받은 편지함 list
	@Override
	public List<MailDTO> sendMailList(int start, int end, String id) throws SQLException {
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		
		List<MailDTO> sendMailList = sqlSession.selectList("mail.sendMailList", map);
		
		return sendMailList;
	}
	
	// 검색한 보낸 편지함 count
	@Override
	public int sendMailSearchCount(String sel, String search, String id) throws SQLException {
		
		HashMap map = new HashMap();
		map.put("sel", sel);
		map.put("search", search);
		map.put("id", id);
		
		int result = sqlSession.selectOne("mail.sendSearchCount", map);
		
		return result;
	}
	// 검색한 보낸 편지함 list
	@Override
	public List<MailDTO> sendMailSearch(int start, int end, String sel, String search, String id) throws SQLException {
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("sel", sel);
		map.put("search", search);
		map.put("id", id);
		
		List<MailDTO> sendMailList = sqlSession.selectList("mail.sendMailSearch", map);
		
		return sendMailList;
	}
	
	// 메일 보내기
	@Override
	public int insertMail(MailDTO dto) throws SQLException {
		int result = sqlSession.insert("mail.insertMail", dto);
		HashMap map = new HashMap();
		map.put("userId", dto.getUserId());
		map.put("rid", dto.getMailRid());
		String userName = sqlSession.selectOne("mail.getUserName", dto.getUserId());
		String ridName = sqlSession.selectOne("mail.getRidName", dto.getMailRid());
		System.out.println("mail 유저 네임 " + userName);
		System.out.println("mail 보낸 네임 " + ridName);
		map.put("userName", userName);
		map.put("ridName", ridName);
		
		sqlSession.update("mail.updateUserName", map);
		sqlSession.update("mail.updateRidName", map);
		
		return result;
	}

	// 편지함 삭제
	@Override
	public int delete(String no, String id) throws SQLException {
		HashMap map = new HashMap();
		map.put("no", no);
		map.put("id", id);
		
		int result = 0;
		
		if(result == 0) {
			result = sqlSession.update("mail.delRecMail", map);			
			System.out.println("========아아악!!!! REC 1번 =======");			
		}
		if(result == 0) {
			result = sqlSession.update("mail.delSendMail", map);
			System.out.println("========아아악!!!! Send 2번 =======");
		}
		
		return result;
		
	}
	
	// 받은 편지 result = 1로 바꾸기
	@Override
	public void readResult(int num, String id) throws SQLException {
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("id", id);
		sqlSession.update("mail.readResult", map);
		
	}
	// 본문 확인
	@Override
	public MailDTO getMail(int num) throws SQLException {
		MailDTO mail = sqlSession.selectOne("mail.getMail", num);
		
		return mail;
	}
	
	// 보내기, 편지함용 유저 리스트
	@Override
	public List<UserDTO> userList(String code, String id) throws SQLException {
		HashMap map = new HashMap();
		map.put("code", code);
		map.put("id", id);
		List<UserDTO> userList = sqlSession.selectList("mail.userList", map);
		return userList;
	}
	// 메일 본문에서 삭제 (받은 메일함)
	@Override
	public int deleteRecMail(int num, String id) throws SQLException {
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("id", id);
		
		int result = sqlSession.update("mail.deleteRec", map);
		return result;
	}
	// 메일 본문에서 삭제 (보낸 메일함)
	@Override
	public int deleteSendMail(int num, String id) throws SQLException {
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("id", id);
		
		int result = sqlSession.update("mail.deleteSend", map);
		return result;
	}

}
