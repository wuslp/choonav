package cnav.attend.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cnav.attend.service.AttendServiceImpl;

@Controller
@RequestMapping("/attend/*")
public class AttendController {

	// controller -> service -> serviceImpl -> dao -> daoImpl -> sql.xml 
	
	@Autowired
	private AttendServiceImpl attendService=null;
	
	@RequestMapping("attend.cnav")
	public String attend(Model model) throws SQLException {
		System.out.println("attned 근태페이지 출력");
		
		// 비지니스로직처리해당하는것이 작성된 service 의 메서드 호출 
		// -> 결과 받아올것이 있으면 서비스로부터 리턴받은것 view로 전달 
		// java01에 해당하는 레코드 한줄 가져와 화면에 뿌려주기 

		
		return "attend/attend";
	}
	
	
	
	
}
