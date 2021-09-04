package cnav.attend.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cnav.attend.service.AttendServiceImpl;

@Controller
@RequestMapping("/attend/*")
public class AttendController {
	//**********임시  "genie0921"

	// controller -> service -> serviceImpl -> dao -> daoImpl -> sql.xml 
	@Autowired
	private AttendServiceImpl attendService=null;
	
	//페이지 로딩시 근태리스트 출력
	@RequestMapping("attend.cnav")
	public String attend(Model model,HttpSession session,String pageNum) throws SQLException {
		// 비지니스로직처리해당하는것이 작성된 service 의 메서드 호출 
		// -> 결과 받아올것이 있으면 서비스로부터 리턴받은것 view로 전달 
		//세션 id값->service처리 
		System.out.println("attend 근태리스트 출력");
		Map<String, Object> result = null;
		//String id = (String)session.getAttribute("sid");
		//String id ="genie0921";	
		//serviceImpl에서 호출할 메서드
		result=attendService.attendList(pageNum);
		
		//view로 전달할 데이터들
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("currentPage", result.get("currentPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("userAttendList", result.get("userAttendList"));
		model.addAttribute("count", result.get("count"));

				
		return "attend/attend";
		}
		
		//클릭시 출근입력
		//클릭시 퇴근입력
	
	}

