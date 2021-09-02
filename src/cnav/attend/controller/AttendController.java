package cnav.attend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cnav.attend.service.AttendServiceImpl;

@Controller
@RequestMapping("/attend/*")
public class AttendController {

	@Autowired
	private AttendServiceImpl attendService=null;
	
	@RequestMapping("attend.cnav")
	public String attend() {
		System.out.println("attned 근태페이지 출력");
		 return "attend/attend";
	}
	
	
}
