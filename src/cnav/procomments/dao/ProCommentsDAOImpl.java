package cnav.procomments.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnav.procomments.dto.ProCommentsDTO;

@Repository
public class ProCommentsDAOImpl implements ProCommentsDAO {

	@Autowired
	private SqlSessionTemplate sqlSession=null;
			
	// 댓글 등록 
	@Override
	public void create(ProCommentsDTO dto) throws SQLException{
		sqlSession.insert("proComments.create",dto);
	}
	// 유저아이디=이름
	@Override
	public String getName(String userId) throws SQLException{
		return sqlSession.selectOne("project.getName",userId);
	}
	// 댓글 목록
	@Override
	public List<ProCommentsDTO> comment(Integer proNum) throws SQLException {
		return sqlSession.selectList("proComments.comment",proNum);
		
	}
	// 댓글 삭제 
	@Override
	public void delcom(int proComNum) throws SQLException {
		sqlSession.delete("proComments.delete", proComNum);
		
	}
	@Override
	public void delComs(String proNum) throws SQLException {
		sqlSession.delete("proComments.delComs",proNum);
		
	}
}
