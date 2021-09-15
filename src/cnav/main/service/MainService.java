package cnav.main.service;

import java.sql.SQLException;

import cnav.main.dto.BusinessDTO;
import cnav.main.dto.CategoryDTO;
import cnav.main.dto.UserDTO;

public interface MainService {

	//회원가입처리
	public void addUser(UserDTO dto) throws SQLException;
	//회사정보 등록 처리
	public void addBiz(BusinessDTO bdto,CategoryDTO cdto) throws SQLException;
	//아이디 id 중복여부 체크
	public int idCheck(UserDTO dto) throws SQLException;
	//회사코드중복여부 체크
	public int codeCheck(BusinessDTO dto) throws SQLException;

	
}
