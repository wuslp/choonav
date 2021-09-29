package cnav.calendar.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cnav.calendar.dto.CalendarDTO;
import cnav.calendar.service.CalendarServiceImpl;

@Controller
@RequestMapping("/cal/*")
public class CalendarController {
	
	@Autowired
	private CalendarServiceImpl calService = null;
	
	// 전체일정 보기
	@RequestMapping("calendar.cnav")
	public String calendar(Model model, HttpSession session) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		String code = (String)session.getAttribute("scode");
		List list = calService.getCalList(code);
		model.addAttribute("list", list);
		
		return "calendar/calendar";
	}
	
	// 내일정
	@RequestMapping("myCalendar.cnav")
	public String myCalendar(Model model, HttpSession session) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		CalendarDTO dto = new CalendarDTO();
		dto.setCode(code);
		dto.setUserId(userId);
		
		List list = calService.getMyCalList(dto);
		
		model.addAttribute("list", list);
		
		return "calendar/myCalendar";
	}
	
	// 일정 추가 form 페이지
	@RequestMapping("calForm.cnav")
	public String calForm() {
		
		return "calendar/calForm";
	}
	
	// 일정 추가 pro 페이지
	@RequestMapping("calPro.cnav")
	public String calPro(CalendarDTO dto, HttpSession session, Model model) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		System.out.println(dto.getCalTitle());
		System.out.println(dto.getCalStart());
		System.out.println(dto.getCalEnd());
		System.out.println(dto.getCalMemo());
		System.out.println(dto.getCalType());
		
		String code = (String)session.getAttribute("scode");
		String userId = (String)session.getAttribute("sid");
		
		dto.setCode(code);
		dto.setUserId(userId);
		
		int res = calService.insertCal(dto);
		System.out.println(res);
		model.addAttribute("res", res);
		
		return "calendar/calPro";
	}
	
	// 일정 상세 리스트 가져오기
	@RequestMapping("calContent.cnav")
	public String calContent(int calNum, Model model, HttpSession session) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		String code = (String)session.getAttribute("scode");
		CalendarDTO dto = new CalendarDTO();
		dto.setCode(code);
		dto.setCalNum(calNum);
		
		dto = calService.getCalContent(dto);
		model.addAttribute("dto", dto);
		model.addAttribute("sauth",session.getAttribute("sauth"));
		
		return "calendar/calContent";
	}
	
	// 일정 수정 form 페이지
	@RequestMapping("calModifyForm.cnav")
	public String calModifyForm(CalendarDTO dto, HttpSession session, Model model) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		dto = calService.getCalContent(dto);
		model.addAttribute("dto", dto);
		
		return "calendar/calModifyForm";
	}
	
	// 일정 수정 pro 페이지
	@RequestMapping("calModifyPro.cnav")
	public String calModifyPro(CalendarDTO dto, HttpSession session, Model model) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		int res = calService.updateCal(dto);
		model.addAttribute("res", res);
		
		return "calendar/calModifyPro";
	}
	
	// 일정 삭제 페이지
	@RequestMapping("calDelete.cnav")
	public String calDelete(CalendarDTO dto, HttpSession session, Model model) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		System.out.println(dto.getCode());
		System.out.println(dto.getCalNum());
		int res = calService.calDelete(dto);
		model.addAttribute("res", res);
		
		return "calendar/calDelete";
	}
	
}
