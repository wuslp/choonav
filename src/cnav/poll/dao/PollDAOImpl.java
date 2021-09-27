package cnav.poll.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import cnav.main.dto.CategoryDTO;
import cnav.poll.dto.PollCommentsDTO;
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
	public int getArticleCount(String code) throws SQLException {
		sqlSession.update("poll.updatest2",code);//진행중
		sqlSession.update("poll.updatest1",code);//날짜 지난것 완료로 업데이트
		sqlSession.update("poll.updatest3",code);//진행전
		int count = sqlSession.selectOne("poll.getArticleCount",code);
		return count;
	}
	//글있으면 투표리스트 가져오기
	@Override
	public List<PollDTO> getArticles(int startRow, int endRow,String code) throws SQLException {
		Map<String,	Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("code", code);
		List<PollDTO> pollList = sqlSession.selectList("poll.getArticles",map);
		return pollList;
	}
	//검색한글 개수
	@Override
	public int getArticleCount2(String sel, String search, String code) throws SQLException {
		sqlSession.update("poll.updatest2",code);
		sqlSession.update("poll.updatest1",code);	//날짜 지난것 완료로 업데이트
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sel", sel);
		map.put("search", search);
		map.put("code", code);
		int count = sqlSession.selectOne("poll.getArticleCount2",map);
		return count;
	}
	@Override
	public List<PollDTO> getArticles2(int startRow, int endRow, String sel, String search, String code) throws SQLException {
		Map<String,	Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("sel", sel);
		map.put("search", search);
		map.put("code", code);
		List<PollDTO> pollList = sqlSession.selectList("poll.getArticles2",map);
		return pollList;
	}
	//진행중 완료만
	@Override
	public int getArticleCount3(String sort,String code) throws SQLException {
		sqlSession.update("poll.updatest2",code);
		sqlSession.update("poll.updatest1",code);	//날짜 지난것 완료로 업데이트

		Map<String,	Object> map = new HashMap<String, Object>();
		map.put("sort", sort);
		map.put("code", code);
		int count = sqlSession.selectOne("poll.getArticleCount3",map);

		return count;
	}
	//진행중 완료 구분해서가져오기
	@Override
	public List<PollDTO> getArticles3(int startRow, int endRow, String sort, String code) throws SQLException {
		Map<String,	Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("sort", sort);
		map.put("code", code);
		
		List<PollDTO> pollList = sqlSession.selectList("poll.getArticles3",map);
		return pollList;
	}
	//선택한 글 하나 가져오기
	@Override
	public PollDTO getPollArticle(int pollNum) throws SQLException {
		PollDTO article = sqlSession.selectOne("poll.getPoll",pollNum);
		return article;
	}
	//접속중인 해당아이디의 부서정보 가져오기
	@Override
	public String getUserDept(String userId) throws SQLException {
		String result =sqlSession.selectOne("poll.getUserDept",userId);
		return result;
	}
	//투표 기록 유무
	@Override
	public int recordPoll(int pollNum, String userId) throws SQLException {
		int result=0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pollNum", pollNum);
		map.put("userId", userId);
		result = sqlSession.selectOne("poll.recordPoll",map);
		return result;
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
	//투표시 기록 남기기
	@Override
	public void plusPollUser(String pollNum, String userId) throws SQLException {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pollNum", pollNum);
		map.put("userId", userId);
		sqlSession.insert("poll.plusPollUser",map);
		
	}
	@Override
	public PollDTO getPollArticleRes(String pollNum) throws SQLException {
		PollDTO article = sqlSession.selectOne("poll.getPollRes",pollNum);
		return article;
	}
	//글삭제
	@Override
	public void pollDelete(String pollNum) throws SQLException {
		sqlSession.delete("poll.pollDelete",pollNum);
	}
	//투표글 댓글달기
	@Override
	public int pollComment(PollCommentsDTO pdto) throws SQLException {
		//세션에 저장된것 꺼내서 담아주기. code,userId
		//code
		String code=(String)RequestContextHolder.getRequestAttributes().getAttribute("scode",RequestAttributes.SCOPE_SESSION);
		System.out.println("35번 세션 코드 출력 : "+code);
		String userId=(String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION);
		pdto.setCode(code);
		pdto.setUserId(userId);
		int result = sqlSession.insert("poll.pollComment",pdto);
		
		return result;
	}
	//투표글 댓글 개수
	@Override
	public int countComment(String pollNum) throws SQLException {
		int result=0;
		result = sqlSession.selectOne("poll.countComment",pollNum);
		return result;
	}
	//투표글 리스트 가져오기
	@Override
	public List pollCommList(String pollNum) throws SQLException {
		List comList = new ArrayList();
		comList = sqlSession.selectList("poll.pollCommList",pollNum);
		return comList;
	}
	//댓글 작성자 와 접속중인 아이디가 일치하는지 체크
	@Override
	public String CheckId(String pollComNum, String userId) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pollComNum", pollComNum);
		map.put("userId", userId);
		int checkId = sqlSession.selectOne("poll.CheckId",map); 
		String result = Integer.toString(checkId);
		return result;
	}
	//댓글 삭제
	@Override
	public void commDelete(String pollComNum) throws SQLException {
		sqlSession.delete("poll.commDelete",pollComNum);
	}
	
}
