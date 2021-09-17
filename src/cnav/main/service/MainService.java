package cnav.main.service;

import java.sql.SQLException;

import cnav.main.dto.BusinessDTO;
import cnav.main.dto.CategoryDTO;
import cnav.main.dto.UserDTO;

public interface MainService {

	//회원가입처리
	public void addUser(UserDTO dto) throws SQLException;
	//회사정보 등록 처리
	public void addBiz(BusinessDTO bdto,CategoryDTO cdto,UserDTO udto) throws SQLException;
	//아이디 id 중복여부 체크
	public int idCheck(UserDTO dto) throws SQLException;
	//회사코드중복여부 체크
	public int codeCheck(BusinessDTO dto) throws SQLException;
	//로그인 처리
	public int idPwCheck(UserDTO dto) throws SQLException;
	//카테고리 가져오기
	public CategoryDTO takeCategory(String scode) throws SQLException;
	//세션삭제
	public void removeSessionAttr(String sessionName);
	//아이디 비밀번호 찾기 (회원정보 가져오기)
	public UserDTO findUser(UserDTO dto) throws SQLException;
	
	
}
