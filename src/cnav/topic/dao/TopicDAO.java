package cnav.topic.dao;

import java.sql.SQLException;
import java.util.List;

import cnav.topic.dto.TopicDTO;

public interface TopicDAO {

	// CRUD
	// 전체게시글 수 가져오기 
	public int getArticleCount() throws SQLException; 
	// 한페이지의 글 목록 가져오기 (startRow, endRow) 
	public List<TopicDTO> getArticles(int start, int end) throws SQLException; 
	// 검색 게시글 수 가져오기 
	public int getSearchArticleCount(String sel, String search) throws SQLException; 
	// 검색 게시글 목록 가져오기 
	public List<TopicDTO> getSearchArticles(int start, int end, String sel, String search) throws SQLException;
	
	// 게시글 저장
	public void insertArticle(TopicDTO dto) throws SQLException;
	
	// 게시글 한개 정보 가져오기
	public TopicDTO getArticle(int topNum) throws SQLException;
	
	// 조회수 +1 
	public void readcountUp(int topNum) throws SQLException;
	
	// 게시물 삭제
	public void deleteArticle(int topNum) throws SQLException;

	// 게시물 수정
	public TopicDTO getUpdateArticle(int topNum) throws SQLException;
	public int updateArticle(TopicDTO dto) throws SQLException;



}
