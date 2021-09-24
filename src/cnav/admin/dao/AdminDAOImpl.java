package cnav.admin.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnav.admin.dto.AdminDTO;
import cnav.main.dto.BusinessDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	// Business테이블 레코드 수 가져오기
	@Override
	public int getArticleCount() throws SQLException {
		int result = sqlSession.selectOne("admin.countAll"); 
		return result;
	}

	// 한페이지에 넣을 business 레코드 목록 가져오기 (회사명, 아이디, 권한여부)
	@Override
	public List<AdminDTO> getArticles(int start, int end) throws SQLException {

		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<AdminDTO> businessList = sqlSession.selectList("admin.getArticles", map);
		
		return businessList; 
	}

	// 회사 관리자로 전환
	@Override
	public void authUpdate0(String userId) throws SQLException {
		sqlSession.update("admin.authUpdate0", userId);
	}

	// 회원으로 전환
	@Override
	public void authUpdate1(String userId) throws SQLException {
		sqlSession.update("admin.authUpdate1", userId);
	}


	
}
