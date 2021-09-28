package cnav.notice.dao;

import java.sql.SQLException;
import java.util.List;

import cnav.notice.dto.NoticeDTO;

public interface NoticeDAO {

	// CRUD
	// 전체게시글 수 가져오기 
	public int getArticleCount(String scode) throws SQLException; 
	// 한페이지의 글 목록 가져오기 (startRow, endRow) 
	public List<NoticeDTO> getArticles(int start, int end, String scode) throws SQLException; 
	// 검색 게시글 수 가져오기 
	public int getSearchArticleCount(String sel, String search, String scode) throws SQLException; 
	// 검색 게시글 목록 가져오기 
	public List<NoticeDTO> getSearchArticles(int start, int end, String sel, String search, String scode) throws SQLException;
	
	// 게시글 저장
	public void insertArticle(NoticeDTO dto, String scode, String sid) throws SQLException;
	
	// 게시글 한개 정보 가져오기
	public NoticeDTO getArticle(int notiNum) throws SQLException;
	
	// 조회수 +1 
	public void readcountUp(int notiNum) throws SQLException;
	
	// 게시물 삭제
	public void deleteArticle(int notiNum) throws SQLException;

	// 게시물 수정
	public NoticeDTO getUpdateArticle(int notiNum) throws SQLException;
	public int updateArticle(NoticeDTO dto) throws SQLException;
}
