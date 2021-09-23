package cnav.mail.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnav.mail.dto.MailDTO;

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
		
		
		return result;
	}

	// 편지함 삭제
	@Override
	public int delete(String no) throws SQLException {
		int result = sqlSession.delete("mail.deleteMail", no);
		return result;
		
	}
	
	// 받은 편지 result = 1로 바꾸기
	@Override
	public void readResult(int num) throws SQLException {
		sqlSession.update("mail.readResult", num);
		
	}
	// 본문 확인
	@Override
	public MailDTO getMail(int num) throws SQLException {
		MailDTO mail = sqlSession.selectOne("mail.getMail", num);
		
		return mail;
	}
	
	// 본문에서 삭제
	@Override
	public int deleteMail(int num) throws SQLException {
		int result = sqlSession.delete("mail.delete", num);
		return result;
	}

}
