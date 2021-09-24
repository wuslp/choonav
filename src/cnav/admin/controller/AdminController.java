package cnav.admin.controller;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cnav.admin.service.AdminServiceImpl;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	//전체관리자Controller
	
	@Autowired
	private AdminServiceImpl adminService = null;
	
	// 전체관리자 마이페이지 보여주기
	@RequestMapping("adminMypage.cnav")
	public String list(String pageNum, Model model) throws SQLException  {
		
		// 해당 페이지에 맞는 화면에 뿌려줄 게시글 가져와서 view 전달 
		Map<String, Object> result = null; 
		
		result = adminService.getArticleList(pageNum);
				
		// view에 전달할 데이터 보내기 
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("currentPage", result.get("currentPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("articleList", result.get("articleList"));
		model.addAttribute("count", result.get("count"));
		model.addAttribute("number", result.get("number"));
		
		return "admin/adminMypage";
	}
	
	// 회사관리자로 전환
	@RequestMapping("authUpdate0.cnav")
	public String authUpdate0(@RequestParam("userId") String userId) throws SQLException {
		adminService.authUpdate0(userId);
		return "redirect:/admin/adminMypage.cnav";
	}

	// 회원으로 전환
	@RequestMapping("authUpdate1.cnav")
	public String authUpdate1(@RequestParam("userId") String userId) throws SQLException {
		adminService.authUpdate1(userId);
		return "redirect:/admin/adminMypage.cnav";
	}
}
