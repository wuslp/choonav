package cnav.mypage.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cnav.mypage.service.MypageService;

@Controller
@RequestMapping("/my/*")
public class MypageController {

	@Autowired
	private MypageService myService = null;
	
	@RequestMapping("myPjList.cnav")
	public String myPjList(HttpSession session, Model model, String pageNum) throws SQLException {
		session.setAttribute("sid", "java");
		session.setAttribute("code", "1111");
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("code");
		
		Map<String, Object> result = null;
		result = myService.getMyPjList(userId, code, pageNum);
		// view에 전달할 데이터 보내기 
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("currentPage", result.get("currentPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("articleList", result.get("articleList"));
		model.addAttribute("count", result.get("count"));
		model.addAttribute("number", result.get("number"));
		
		session.setAttribute("sauto", "1");
		String auto = (String)session.getAttribute("sauto");
		if(auto.equals("1")){
			return "bizMypage/bizPjList";
		}else {
			return "userMypage/myPjList";
		}
	}
	
	
	@RequestMapping("myTopicList.cnav")
	public String myTopicList(HttpSession session, Model model, String pageNum) throws SQLException {
		session.setAttribute("sid", "java");
		session.setAttribute("aid", "java");
		session.setAttribute("code", "1111");
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("code");
		
		Map<String, Object> result = null;
		result = myService.getMyTopicList(userId, code, pageNum);
		System.out.println(result.get("articleList"));
		// view에 전달할 데이터 보내기 
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("currentPage", result.get("currentPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("articleList", result.get("articleList"));
		model.addAttribute("count", result.get("count"));
		model.addAttribute("number", result.get("number"));
		
		session.setAttribute("sauto", "1");
		String auto = (String)session.getAttribute("sauto");
		if(auto.equals("1")){
			return "bizMypage/bizTopicList";
		}else {
			return "userMypage/myTopicList";
		}
	}
	
	
}
