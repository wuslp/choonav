package cnav.poll.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnav.poll.dto.PollDTO;

@Repository
public class PollDAOImpl implements PollDAO{

	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	//글 등록시키기
	@Override
	public void insertArticle(PollDTO dto) throws SQLException {

		sqlSession.insert("poll.insertArticle",dto);
	}
	//전체 개수 가져오기
	@Override
	public int getArticleCount() throws SQLException {
		sqlSession.update("poll.updatest");//날짜 지난것 완료로 업데이트	
		int count = sqlSession.selectOne("poll.getArticleCount");
		return count;
	}
	@Override
	public List<PollDTO> getArticles(int startRow, int endRow) throws SQLException {
		Map<String,	Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<PollDTO> pollList = sqlSession.selectList("poll.getArticles",map);
		return pollList;
	}
	//검색한글 개수
	@Override
	public int getArticleCount2(String sel, String search) throws SQLException {
		sqlSession.update("poll.updatest");	//날짜 지난것 완료로 업데이트
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sel", sel);
		map.put("search", search);
		int count = sqlSession.selectOne("poll.getArticleCount2",map);
		return count;
	}
	@Override
	public List<PollDTO> getArticles2(int startRow, int endRow, String sel, String search) throws SQLException {
		Map<String,	Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("sel", sel);
		map.put("search", search);
		List<PollDTO> pollList = sqlSession.selectList("poll.getArticles2",map);
		return pollList;
	}
	//선택한 글 하나 가져오기
	@Override
	public PollDTO getPollArticle(int pollNum) throws SQLException {
		PollDTO article = sqlSession.selectOne("poll.getPoll",pollNum);
		return article;
	}
	//투표시 숫자추가
	@Override
	public void plusPoll(String pollNum, String obj_value) throws SQLException {
		Map<String,	Object> map = new HashMap<String, Object>();
		map.put("pollNum", pollNum);
		map.put("obj_value", obj_value);
		
		sqlSession.update("poll.plusPoll1",map);
		//sqlSession.update("poll.plusPoll2",map);
		//sqlSession.update("poll.plusPoll3",map);
		//sqlSession.update("poll.plusPoll4",map);
		
	}

}
