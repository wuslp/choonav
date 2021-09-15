package cnav.main.dao;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnav.main.dto.BusinessDTO;
import cnav.main.dto.CategoryDTO;
import cnav.main.dto.UserDTO;

@Repository
public class MainDAOImpl implements MainDAO{

	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	//회원가입 처리
	@Override
	public void addUser(UserDTO dto) throws SQLException {
		System.out.println("받은 회사코드"+dto.getCode());
		System.out.println("받은 아이디"+dto.getUserId());
		sqlSession.insert("main.addUser",dto);
	}

	//회사정보 등록처리
	@Override
	public void addBiz(BusinessDTO bdto, CategoryDTO cdto) throws SQLException {
		sqlSession.insert("main.addBiz",bdto);
		sqlSession.insert("main.addCat",cdto);
		
	}

	//id, pw 체크 해 줄것
	@Override
	public int idPwCheck(UserDTO dto) throws SQLException {
		//dto 주면서 db에 두개 같은애가 있는지 체크, 결과는 int 로 리턴
		int result = sqlSession.selectOne("main.idPwCheck", dto);
		
		return result;//결과 돌려주기.일치 1 불일치0
	}

	//회사코드 체크
	@Override
	public int codeCheck(BusinessDTO dto) throws SQLException {
		int result = sqlSession.selectOne("main.codeCheck", dto);
		return result;
	}

}
