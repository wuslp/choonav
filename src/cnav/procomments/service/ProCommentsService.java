package cnav.procomments.service;

import java.sql.SQLException;
import java.util.List;

import cnav.procomments.dto.ProCommentsDTO;

public interface ProCommentsService {

	// 댓글 목록
	public List<ProCommentsDTO> comment(Integer proNum) throws SQLException;
	
	// 댓글 작성 
	public void create(ProCommentsDTO dto) throws SQLException;
	
	// 댓글 삭제 
	public void delcom(int proComNum) throws SQLException;
}
