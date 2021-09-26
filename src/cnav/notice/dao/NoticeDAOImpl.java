package cnav.notice.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnav.notice.dto.NoticeDTO;

//import cnav.topic.dto.TopicDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{

	
	@Autowired
	private SqlSessionTemplate sqlSession = null; 

	// 전체 게시글 수 가져오기 
	@Override
	public int getArticleCount(String scode) throws SQLException {
		// 게시판 전체글 개수 가져오기 (board 테이블활용해보기) 
		int result = sqlSession.selectOne("notice.countAll", scode); 
		
		return result;
	}
	// 한페이지 게시글 목록 가져오기 
	@Override
	public List<NoticeDTO> getArticles(int start, int end, String scode) throws SQLException {
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("scode", scode);
		
		List<NoticeDTO> noticeList = sqlSession.selectList("notice.getArticles", map);
		
		return noticeList;
	}
	// 검색 게시글 수 가져오기 
	@Override
	public int getSearchArticleCount(String sel, String search, String scode) throws SQLException {
		
		HashMap map = new HashMap();
		map.put("sel", sel);
		map.put("search", search);
		map.put("scode", scode);
		
		int result = sqlSession.selectOne("notice.countSearch", map);
		
		return result;
	}
	
	// 검색 게시글 목록 가져오기 
	@Override
	public List<NoticeDTO> getSearchArticles(int start, int end, String sel, String search, String scode) throws SQLException {
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("sel", sel);
		map.put("search", search);
		map.put("scode", scode);
		
		List<NoticeDTO> noticeList = sqlSession.selectList("notice.getSearchArticles", map);
		
		return noticeList;
	}
	
	// 게시글 저장
	@Override
	public void insertArticle(NoticeDTO dto, String scode, String sid) throws SQLException {
		String code= scode;
		String userId = sid;
		dto.setCode(code);
		dto.setUserId(userId);
		
		sqlSession.insert("notice.insertArticle", dto);
	}
	
	// 게시글 1개 가져오기
	@Override
	public NoticeDTO getArticle(int notiNum) throws SQLException {
		NoticeDTO article = sqlSession.selectOne("notice.getOneArticle", notiNum);
		
		return article;
	}
	
	// 조회수 +1
	@Override
	public void readcountUp(int notiNum) throws SQLException {
		sqlSession.update("notice.readcountUp", notiNum);
	}
	
	// 게시물 삭제
	@Override
	public void deleteArticle(int notiNum) throws SQLException {
		sqlSession.delete("notice.deleteArticle", notiNum);
	}
	
	// 게시물수정 폼
	@Override
	public NoticeDTO getUpdateArticle(int notiNum) throws SQLException {
		NoticeDTO article = sqlSession.selectOne("notice.getUpdateArticle", notiNum); 
		return article;
	}
	// 게시물수정 처리
	@Override
	public int updateArticle(NoticeDTO dto) throws SQLException {
		int result = sqlSession.update("notice.updateArticle", dto); 
		return result;
	}

	
}
