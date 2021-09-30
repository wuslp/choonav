package cnav.procomments.dao;

import java.sql.SQLException;
import java.util.List;

import cnav.procomments.dto.ProCommentsDTO;

public interface ProCommentsDAO  {

	// 댓글 목록
	public List<ProCommentsDTO> comment(Integer proNum) throws SQLException;
	
	// 댓글 작성
	public void create(ProCommentsDTO dto) throws SQLException;
	
	//댓글 삭제
	public void delcom(int proComNum) throws SQLException;

	// 유저 아디=이름
	public String getName(String userId) throws SQLException;

	// 게시글 삭제시, 해당 프로젝트 댓글 전체 삭제 
	public void delComs(String proNum) throws SQLException;
}
