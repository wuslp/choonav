package cnav.poll.dao;

import java.sql.SQLException;
import java.util.List;

import cnav.poll.dto.PollDTO;

public interface PollDAO {

	//투표저장
	public void insertArticle(PollDTO dto) throws SQLException;
	//모든 투표글 개수
	public int getArticleCount() throws SQLException;
	//모든 투표글 불러오기
	public List<PollDTO> getArticles(int startRow, int endRow) throws SQLException;
	//내용 검색 투표글 개수
	public int getArticleCount2(String sel, String search) throws SQLException;
	//내용 검색 투표글 불러오기
	public List<PollDTO> getArticles2(int startRow, int endRow, String sel, String search) throws SQLException; 
	//투표글 하나 불러오기
	public PollDTO getPollArticle(int pollNum) throws SQLException;
	//투표시
	public void plusPoll(String pollNum,String obj_value) throws SQLException;
	
}
