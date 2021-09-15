package cnav.main.dao;

import java.sql.SQLException;

import cnav.main.dto.UserDTO;

public interface MainDAO {

	//회원가입 처리
	public void addUser(UserDTO dto) throws SQLException;
	
	
}
