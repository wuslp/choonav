package cnav.main.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public void addBiz(BusinessDTO bdto, CategoryDTO cdto, UserDTO udto) throws SQLException {
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("userId", udto.getUserId());
		map.put("code", bdto.getCode());		
		sqlSession.insert("main.addBiz",bdto);
		sqlSession.insert("main.addCat",cdto);
		sqlSession.update("main.addUserBiz",map);
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

	//회원 정보 가져오기
	@Override
	public UserDTO getUserInfo(UserDTO dto) throws SQLException {
		UserDTO udto =sqlSession.selectOne("main.getUserInfo",dto); 
		return udto;
	}

	//회사코드로 카테고리 가져오기
	@Override
	public CategoryDTO takeCategory(String scode) throws SQLException {
		CategoryDTO cdto = sqlSession.selectOne("main.takeCat",scode);
		return cdto;
	}

	//회원정보있는지 확인
	@Override
	public int countUser(UserDTO dto) throws SQLException {
		int result =0;
		if(dto.getUserId()==null) {
			result = sqlSession.selectOne("main.checkUser",dto);	
		}else {
			result = sqlSession.selectOne("main.checkPw",dto);
		}
		return result;
	}

	//회원정보 가져오기
	@Override
	public UserDTO getUserIdPw(UserDTO dto) throws SQLException {
		UserDTO	udto;
		if(dto.getUserId()==null) {
			udto =sqlSession.selectOne("main.getUserId",dto);
		}else {
			udto = sqlSession.selectOne("main.getPw",dto);
		}
		return udto;
	}
	
	// 회사 정보 가져오기
	@Override
	public BusinessDTO getBizInfo(String scode) throws SQLException {
		return sqlSession.selectOne("main.getBizInfo", scode);
	}

	// 공지사항 글개수
	@Override
	public int getNoticeCount(String scode) throws SQLException {
		return sqlSession.selectOne("main.countNoti", scode);
	}
	
	// 공지사항 리스트 가져오기
	@Override
	public List getNoticeList(String scode, int start, int end) throws SQLException {
		HashMap map = new HashMap();
		map.put("scode", scode);
		map.put("start", start);
		map.put("end", end);
		
		List list = sqlSession.selectList("main.getNotiList", map);
		return list;
	}


}
