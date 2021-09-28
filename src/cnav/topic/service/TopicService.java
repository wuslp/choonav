package cnav.topic.service;

import java.sql.SQLException;
import java.util.Map;

import cnav.topic.dto.TopicDTO;

public interface TopicService {

	// CRUD Create, Read, Update, Delete
	
	// 게시판 list 페이지 목록 가져오기 (list) 
	public Map<String, Object> getArticleList(String pageNum, String scode) throws SQLException;
	// 게시판 검색한 list 페이지 목록 가져오기 (list 검색) 
	public Map<String, Object> getArticleSearch(String pageNum, String sel, String search, String scode) throws SQLException;

	// 게시글 등록 처리 (writePro)
	public void insertArticle(TopicDTO dto, String scode, String sid) throws SQLException;
	
	// 게시판 글 1개 가져오기 (content)
	public TopicDTO getArticle(int topNum) throws SQLException;

	// 게시글 삭제 처리 (deletePro)
	public void deleteArticle(int topNum) throws SQLException;
	
	// 게시글 수정폼 처리 (modifyForm)
	public TopicDTO getUpdateArticle(int topNum) throws SQLException;
	// 게시글 수정프로 (modifyPro)
	public int updateArticle(TopicDTO dto) throws SQLException;
	
}
