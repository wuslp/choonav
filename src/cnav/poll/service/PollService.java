package cnav.poll.service;

import java.sql.SQLException;
import java.util.Map;

import cnav.poll.dto.PollDTO;

public interface PollService {

	//CRUD
	//작성 등록시키기
	public void insertArticle(PollDTO dto) throws SQLException;
	//모든 리스트 불러오기
	public Map<String, Object> getArticleList(String pageNum) throws SQLException;
	//서치 리스트 가져오기
	public Map<String, Object> getSearchArticleList(String pageNum, String sel, String search) throws SQLException;
	//투표글 하나 가져오기
	public PollDTO getPollArticle(int pollNum) throws SQLException;
	//투표시
	public void plusPoll(String pollNum,String obj_value) throws SQLException;
}
