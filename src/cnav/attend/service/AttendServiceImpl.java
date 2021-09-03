package cnav.attend.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnav.attend.dao.AttendDAOImpl;
import cnav.attend.dto.TestDTO;

@Service
public class AttendServiceImpl implements AttendService{

	@Autowired
	private AttendDAOImpl attendDAO = null;
	


}
