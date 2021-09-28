package cnav.procomments.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnav.procomments.dao.ProCommentsDAOImpl;
import cnav.procomments.dto.ProCommentsDTO;
import cnav.project.dao.ProjectDAO;

@Service
public class ProCommentsServiceImpl implements ProCommentsService {

	@Autowired
	private ProCommentsDAOImpl proCommentsDAO=null;
	
	
	// 댓글 목록 
	@Override
	public List<ProCommentsDTO> comment(Integer proNum) throws SQLException{
		return proCommentsDAO.comment(proNum);
	}
	
	//댓글 등록
	@Override
	public void create(ProCommentsDTO dto) throws SQLException{
		//유저아이디=담당자 
		String name=proCommentsDAO.getName(dto.getUserId());
		dto.setName(name);
		proCommentsDAO.create(dto);
	}
	// 댓글 삭제 
	@Override
	public void delcom(int proComNum) throws SQLException{
		proCommentsDAO.delcom(proComNum);
	}
}
