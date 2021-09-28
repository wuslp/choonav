package cnav.topic.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnav.topic.dto.TopicDTO;

@Repository
public class TopicDAOImpl implements TopicDAO{

	
	@Autowired
	private SqlSessionTemplate sqlSession = null; 

	// 전체 게시글 수 가져오기 
	@Override
	public int getArticleCount(String scode) throws SQLException {
		// 게시판 전체글 개수 가져오기 (board 테이블활용해보기) 
		int result = sqlSession.selectOne("topic.countAll", scode); 
		System.out.println(result);
		return result;
	}
	// 한페이지 게시글 목록 가져오기 
	@Override
	public List<TopicDTO> getArticles(int start, int end, String scode) throws SQLException {
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("scode", scode);
		
		List<TopicDTO> topicList = sqlSession.selectList("topic.getArticles", map);
		
		return topicList;
	}
	// 검색 게시글 수 가져오기 
	@Override
	public int getSearchArticleCount(String sel, String search, String scode) throws SQLException {
		
		HashMap map = new HashMap();
		map.put("sel", sel);
		map.put("search", search);
		map.put("scode", scode);
		
		int result = sqlSession.selectOne("topic.countSearch", map);
		
		return result;
	}
	
	// 검색 게시글 목록 가져오기 
	@Override
	public List<TopicDTO> getSearchArticles(int start, int end, String sel, String search, String scode) throws SQLException {
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("sel", sel);
		map.put("search", search);
		map.put("scode", scode);
		
		List<TopicDTO> topicList = sqlSession.selectList("topic.getSearchArticles", map);
		
		return topicList;
	}
	
	// 게시글 저장
	@Override
	public void insertArticle(TopicDTO dto, String scode, String sid) throws SQLException {
		String code= scode;
		String userId = sid;
		dto.setCode(code);
		dto.setUserId(userId);
		sqlSession.insert("topic.insertArticle", dto);
	}
	
	// 게시글 1개 가져오기
	@Override
	public TopicDTO getArticle(int topNum) throws SQLException {
		TopicDTO article = sqlSession.selectOne("topic.getOneArticle", topNum);
		
		return article;
	}
	
	// 조회수 +1
	@Override
	public void readcountUp(int topNum) throws SQLException {
		sqlSession.update("topic.readcountUp", topNum);
	}
	
	// 게시물 삭제
	@Override
	public void deleteArticle(int topNum) throws SQLException {
		sqlSession.delete("topic.deleteArticle", topNum);
	}
	
	// 게시물수정 폼
	@Override
	public TopicDTO getUpdateArticle(int topNum) throws SQLException {
		TopicDTO article = sqlSession.selectOne("topic.getUpdateArticle", topNum); 
		return article;
	}
	// 게시물수정 처리
	@Override
	public int updateArticle(TopicDTO dto) throws SQLException {
		int result = sqlSession.update("topic.updateArticle", dto); 
		return result;
	}
	
	// 게시글 1개에 대한 userId로 name 뽑기
	@Override
	public String getName(String userId) throws SQLException {
		return sqlSession.selectOne("topic.getName", userId);
	}

	
}
