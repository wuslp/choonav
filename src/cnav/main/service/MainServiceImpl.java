package cnav.main.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnav.main.dao.MainDAOImpl;
import cnav.main.dto.UserDTO;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	private MainDAOImpl mainDAO = null;
	
	@Override
	public void addUser(UserDTO dto) throws SQLException {
			mainDAO.addUser(dto);
	}

}
