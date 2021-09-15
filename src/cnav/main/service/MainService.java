package cnav.main.service;

import java.sql.SQLException;

import cnav.main.dto.UserDTO;

public interface MainService {

	//회원가입처리
	public void addUser(UserDTO dto) throws SQLException;
	
}
