package cnav.main.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnav.main.dao.MainDAOImpl;
import cnav.main.dto.BusinessDTO;
import cnav.main.dto.CategoryDTO;
import cnav.main.dto.UserDTO;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	private MainDAOImpl mainDAO = null;
	
	//회원가입처리
	@Override
	public void addUser(UserDTO dto) throws SQLException {
			mainDAO.addUser(dto);
	}

	//회사정보 등록 처리
	@Override
	public void addBiz(BusinessDTO bdto, CategoryDTO cdto) throws SQLException {
		mainDAO.addBiz(bdto,cdto);
		
	}

}
