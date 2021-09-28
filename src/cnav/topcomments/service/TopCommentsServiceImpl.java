package cnav.topcomments.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnav.topcomments.dao.TopCommentsDAOImpl;
import cnav.topcomments.dto.TopCommentsDTO;

@Service  // component-scan 이용해 자동으로 빈으로 등록시킬것임 (객체생성) 
public class TopCommentsServiceImpl implements TopCommentsService {

	@Autowired
	private TopCommentsDAOImpl topCommentsDAO = null;

	// 댓글 목록
	@Override
	public List<TopCommentsDTO> reply(Integer topNum) throws SQLException {
		return topCommentsDAO.reply(topNum);
	}

	// 댓글 입력
	@Override
	public void insert(TopCommentsDTO dto) throws SQLException {
		String name = topCommentsDAO.getName(dto.getUserId());
		dto.setName(name);
		topCommentsDAO.insert(dto);
		int topNum = dto.getTopNum();
		topCommentsDAO.upRecnt(topNum);
	}



	// 댓글 삭제
	@Override
	public void delete(int topComNum, int topNum) throws SQLException {
		topCommentsDAO.delete(topComNum);
		topCommentsDAO.downRecnt(topNum);
	}

	
}
