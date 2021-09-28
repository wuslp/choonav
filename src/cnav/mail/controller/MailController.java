package cnav.mail.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cnav.mail.dto.MailDTO;
import cnav.mail.service.MailServiceImpl;
import cnav.main.dto.UserDTO;


@Controller
@RequestMapping("/mail/*")
public class MailController {
	
	//contro - service - dao - sql
	
	@Autowired
	private MailServiceImpl MailService = null;
	
	// 받은 메일함
	@RequestMapping("recMailList.cnav")
	public String recMailList(HttpSession session, String pageNum, String sel, String search, Model model) throws SQLException{

		String id = (String)session.getAttribute("sid");
		
		
		Map<String, Object> result = null;
		if(sel == null || search == null) {
			result = MailService.recMailList(pageNum, id); // select * from mail where id=""; 
		}else {
			result = MailService.recMailSearch(pageNum, sel, search, id);
		}
		
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("currentPage", result.get("currentPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("recMailList", result.get("recMailList"));
		model.addAttribute("count", result.get("count"));
		model.addAttribute("number", result.get("number"));
		model.addAttribute("sel", sel);
		model.addAttribute("search", search);
		
		System.out.println("sel" + sel);
		System.out.println("list" + result);
		
		
		
		return "mail/recMailList";
	}
	
	// 보낸 편지함
	@RequestMapping("sendMailList.cnav")
	public String sendMailList(HttpSession session, String pageNum, String sel, String search, Model model) throws SQLException{
		System.out.println("보낸 mail list");
		String id = (String)session.getAttribute("sid");
		
		
		Map<String, Object> result = null;
		if(sel == null || search == null) {
			result = MailService.sendMailList(pageNum, id); // select * from mail where id="";
		}else {
			result = MailService.sendMailSearch(pageNum, sel, search, id);
		}
		
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("currentPage", result.get("currentPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("sendMailList", result.get("sendMailList"));
		model.addAttribute("count", result.get("count"));
		model.addAttribute("number", result.get("number"));
		model.addAttribute("sel", sel);
		model.addAttribute("search", search);
		
		System.out.println("list" + result);
		
		
		
		return "mail/sendMailList";
	}
	
	// 메일 보내기
	@RequestMapping("writeMailForm.cnav")
	public String writeMailForm(HttpSession session, Model model) throws SQLException {
		String code = (String)session.getAttribute("scode");
		String id = (String)session.getAttribute("sid");
		List<UserDTO> userList = MailService.userList(code, id);
		model.addAttribute("userList", userList);
		System.out.println("userList name" + userList);
		
		return "mail/writeMailForm";
	}
	
	// 메일 보내기 처리
	@RequestMapping("writeMailPro.cnav")
	public String writeMailPro(HttpSession session, MailDTO dto, Model model) throws SQLException {
		String id = (String)session.getAttribute("sid");
		dto.setUserId(id);
		int result = MailService.insertMail(dto);
		
		
		model.addAttribute("result", result);
		
		return "mail/writeMailPro";
	}
	
	// 편지함 선택해서 게시물 삭제
	@RequestMapping("/deleteMailForm")
	@ResponseBody
	public String ajaxTest(HttpServletRequest request, HttpSession session) throws SQLException {
		String id = (String)session.getAttribute("sid");
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		String result = null;
		System.out.println("size" + size);
		for(int i = 0; i<size; i++) {
			result = String.valueOf(MailService.delete(ajaxMsg[i], id));
		}
		return result;
	}
	
	// 편지 내용에서 삭제
	@RequestMapping("/deleteForm")
	public String delete(@RequestParam("num")int num, HttpSession session) throws SQLException {
		String id = (String)session.getAttribute("sid");
		int count1 = MailService.deleteRecMail(num, id);
		int count2 = MailService.deleteSendMail(num, id);
		String page = "";
		
		if(count1 == 1) {
			page = "redirect:/mail/recMailList.cnav";
			System.out.println("count1 됨");
		}else if(count2 == 1) {
			page = "redirect:/mail/sendMailList.cnav";
			System.out.println("count2 됨");
		}else {
			System.out.println("삭제 안됨");
		}
		
		return page;
	}
	
	// 받은 편지 보기
	@RequestMapping("mail.cnav")
	public String recMail(@ModelAttribute("pageNum") String pageNum, Integer num, HttpSession session, Model model) throws SQLException{
		String id = (String)session.getAttribute("sid");
		MailDTO mail = MailService.getMail(num, id);
		model.addAttribute("mail", mail);
		model.addAttribute("id", id);
		
		return "mail/mail";
	}
	
	
	
	
	
}
