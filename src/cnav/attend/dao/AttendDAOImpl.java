package cnav.attend.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AttendDAOImpl implements AttendDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;



}
