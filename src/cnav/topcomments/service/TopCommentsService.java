package cnav.topcomments.service;

import java.sql.SQLException;
import java.util.List;

import cnav.topcomments.dto.TopCommentsDTO;


public interface TopCommentsService {

	// 댓글 목록
	public List<TopCommentsDTO> reply(Integer topNum)throws SQLException;	
	
	// 댓글입력
	public void insert(TopCommentsDTO dto) throws SQLException;
	
	// 댓글 삭제
	// rno -> topComNum
	public void delete(int topComNum, int topNum) throws SQLException;

}
