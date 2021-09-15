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
}
