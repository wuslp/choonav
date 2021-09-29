package cnav.reservation.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cnav.calendar.dto.CalendarDTO;
import cnav.mypage.dto.UserInfoDTO;
import cnav.mypage.service.MypageServiceImpl;
import cnav.reservation.dto.ReservationDTO;
import cnav.reservation.service.ReservationServiceImpl;

@Controller
@RequestMapping("/rez/*")
public class ReservationController {
	
	@Autowired
	private ReservationServiceImpl rezService = null;
	
	// 예약메인 전체예약 페이지
	@RequestMapping("allRez.cnav")
	public String allRez(Model model, HttpSession session) throws SQLException{
		
		if(session.getAttribute("scode") == null) {
			return "main/loginForm";
		}
		
		String code = (String)session.getAttribute("scode");
		List list = rezService.getRezList(code);
		
		model.addAttribute("list", list);
		return "reservation/allRez";
	}
	
	// 예약 form 페이지
	@RequestMapping("rezForm.cnav")
	public String rezForm(HttpSession session, Model model) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		UserInfoDTO dto = rezService.getUserInfo(userId, code);
		
		System.out.println(dto.getName());
		
		model.addAttribute("sid", session.getAttribute("sid"));
		model.addAttribute("dto", dto);
		
		return "reservation/rezForm";
	}
	
	
	// 예약 추가 페이지
	@RequestMapping("addRez.cnav")
	public String addRez(ReservationDTO rezDTO, HttpSession session, Model model) throws SQLException{
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		rezDTO.setsTime(rezDTO.getsDate().trim().split(" ")[1]);
		rezDTO.seteTime(rezDTO.geteDate().trim().split(" ")[1]);
		rezDTO.setUserId((String)session.getAttribute("sid"));
		rezDTO.setCode((String)session.getAttribute("scode"));
		int res = rezService.insertRez(rezDTO);
		System.out.println("res:"+res);
		model.addAttribute("res", res);
		
		return "reservation/rezPro";
	}
	
	// 예약 Content 페이지
		@RequestMapping("rezContent.cnav")
		public String rezContent(int rezNum, HttpSession session, Model model) throws SQLException {
			
			if(session.getAttribute("scode") == null) {
				return "main/loginForm";
			}
			
			String code = (String)session.getAttribute("scode");
			ReservationDTO dto = new ReservationDTO();
			dto.setCode(code);
			dto.setRezNum(rezNum);
			
			
			dto = rezService.getRezContent(dto);
			dto.setsDate(dto.getsDate().split(" ")[0]+" "+dto.getsTime());
			dto.seteDate(dto.geteDate().split(" ")[0]+" "+dto.geteTime());
			dto.setReg(dto.getReg().substring(0, 16));
			model.addAttribute("dto", dto);
			model.addAttribute("sid",session.getAttribute("sid"));
			model.addAttribute("sauth",session.getAttribute("sauth"));
			
			return "reservation/rezContent";
		}
	
	// 예약 삭제 페이지
	@RequestMapping("rezDelete.cnav")
	public String rezDelete(HttpSession session, int rezNum, int myRez, Model model) throws SQLException{
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		model.addAttribute("res", rezService.rezDelete(rezNum));
		if(myRez == 1) {
			model.addAttribute("rezNum", rezNum);
		}
		return "reservation/rezDelete";
	}
		
	// 내 예약현황 페이지
	@RequestMapping("myRez.cnav")
	public String myRez(HttpSession session, Model model, String pageNum) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		ReservationDTO dto = new ReservationDTO();
		dto.setCode(code);
		dto.setUserId(userId);
		
		Map<String, Object> result = null;
		result = rezService.getMyrezList(dto, pageNum);
		// view에 전달할 데이터 보내기 
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("currentPage", result.get("currentPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("articleList", result.get("articleList"));
		model.addAttribute("count", result.get("count"));
		model.addAttribute("number", result.get("number"));
		
		return "reservation/myRez";
	}
	
	
	
	
}
