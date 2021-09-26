package cnav.poll.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cnav.main.dto.CategoryDTO;
import cnav.poll.dto.PollCommentsDTO;
import cnav.poll.dto.PollDTO;

public interface PollService {

	//CRUD
	//작성 등록시키기
	public void insertArticle(PollDTO dto) throws SQLException;
	//모든 리스트 불러오기
	public Map<String, Object> getArticleList(String pageNum) throws SQLException;
	//서치 리스트 가져오기
	public Map<String, Object> getSearchArticleList(String pageNum, String sel, String search) throws SQLException;
	//진행중 완료 리스트
	public Map<String, Object> getSortArticle(String pageNum,String sort) throws SQLException; 
	//투표글 하나 가져오기
	public PollDTO getPollArticle(int pollNum) throws SQLException;
	//투표유무 기록 가져오기
	public int recordPoll(int pollNum,String userId) throws SQLException;
	//접속중인 해당 userId의 부서정보 가져오기
	public String getUserDept(String userId) throws SQLException;
	
	//투표시
	public void plusPoll(String pollNum,String obj_value) throws SQLException;
	//투표시 userId 리스트에추가
	public void plusPollUser(String pollNum,String userId) throws SQLException;
	//결과 값 컬럼 가져오려고
	public PollDTO getPollArticleRes(String pollNum) throws SQLException;
	
	//투표글 삭제
	public void pollDelete(String pollNum) throws SQLException;
	//투표댓글 등록
	public int pollComment(PollCommentsDTO pdto) throws SQLException;
	//댓글 불러오기
	public List pollCommList(int pollNum) throws SQLException;
	//댓글 작성자랑 세션Id 일치하는지 확인
	public String CheckId(String pollComNum) throws SQLException;
	//댓글 삭제
	public void commDelete(String pollComNum) throws SQLException;
}
