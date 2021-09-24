package cnav.admin.dao;

import java.sql.SQLException;
import java.util.List;

import cnav.admin.dto.AdminDTO;
import cnav.main.dto.BusinessDTO;


public interface AdminDAO {
	
	// 전체게시글 수 가져오기 
	public int getArticleCount() throws SQLException; 
	// 한페이지의 글 목록 가져오기 (startRow, endRow) 
	public List<AdminDTO> getArticles(int start, int end) throws SQLException; 
	
	// 회사관리자로 전환
	public void authUpdate0(String userId) throws SQLException;
	// 회원으로 전환
	public void authUpdate1(String userId) throws SQLException;

}
