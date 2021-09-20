package cnav.topcomments.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnav.topcomments.dto.TopCommentsDTO;

@Repository
public class TopCommentsDAOImpl implements TopCommentsDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;

	// 댓글 목록
	@Override
	public List<TopCommentsDTO> reply(Integer topNum) throws SQLException {
		return sqlSession.selectList("topComments.reply", topNum);
	}

	// 댓글 입력
	@Override
	public void insert(TopCommentsDTO dto)  throws SQLException {
		sqlSession.insert("topComments.insert", dto);
	}



	// 댓글 삭제
	@Override
	public void delete(int topComNum)  throws SQLException {
		sqlSession.delete("topComments.delete", topComNum);		
	} 


	
}
