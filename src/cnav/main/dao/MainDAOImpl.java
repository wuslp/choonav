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

}
