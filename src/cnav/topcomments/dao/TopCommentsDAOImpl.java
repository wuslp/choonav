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

	// 댓글 입력시 게시글의 recnt +1
	@Override
	public void upRecnt(int topNum) throws SQLException {
		sqlSession.update("topComments.upRecnt", topNum);
	}
	

	// 댓글 삭제
	@Override
	public void delete(int topComNum)  throws SQLException {
		sqlSession.delete("topComments.delete", topComNum);		
	}

	// 댓글 삭제시 게시글 댓글수 -1
	@Override
	public void downRecnt(int topNum) throws SQLException {
		sqlSession.update("topComments.downRecnt", topNum);
	}

	// 댓글 입력전 이름 가져오기
	@Override
	public String getName(String userId) throws SQLException {
		return sqlSession.selectOne("topComments.getName", userId);
	}

	// 게시글 삭제시 해당게시글 댓글 모두 삭제
	public void delComments(int topNum) throws SQLException {
		sqlSession.update("topComments.delComments", topNum);
	}
	
	
}
