package cnav.main.dao;

import java.sql.SQLException;

import cnav.main.dto.BusinessDTO;
import cnav.main.dto.CategoryDTO;
import cnav.main.dto.UserDTO;

public interface MainDAO {

	//회원가입 처리
	public void addUser(UserDTO dto) throws SQLException;
	//회사정보 등록 처리
	public void addBiz(BusinessDTO bdto,CategoryDTO cdto) throws SQLException;
	//로그인체크(아이디, 비번, 확인)
	public int idPwCheck(UserDTO dto) throws SQLException;
	//회사코드 체크
	public int codeCheck(BusinessDTO dto) throws SQLException;
	//회원정보 가져오기
	public UserDTO getUserInfo(UserDTO dto) throws SQLException;
	//회사코드로 카테고리 가져오기
	public CategoryDTO takeCategory(String scode) throws SQLException;
	//조건으로 회원정보 있는지 확인하기
	public int countUser(UserDTO dto) throws SQLException;
	//아이디 찾아서가져오기
	public UserDTO getUserIdPw(UserDTO dto) throws SQLException;
}
