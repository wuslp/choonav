package cnav.mypage.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cnav.mypage.service.MypageServiceImpl;

@Controller
@RequestMapping("/bizMypage/*")
public class MypageController {
//	
//	@Autowired
//	private MypageServiceImpl MypageService = null;
//	
//	
//	@RequestMapping("userManagement.cnav")
//	public String userManagement(String pageNum, String sel, String search, Model model) {
//		
//		System.out.println("사원 정보 수정");
//		String id = "test";
//		
//		int maResult = MypageService.maCode(id);
//		
//		
//		Map<String, Object> result = null;
//		if(sel == null || search == null) {
//			result = MypageService.userMa(pageNum, id); // select code from users where id = "" and auth = "1"
//		}else {
//			result = MypageService.userMaS(pageNum, sel, search, id);
//		}
//		
//		model.addAttribute("pageSize", result.get("pageSize"));
//		model.addAttribute("pageNum", result.get("pageNum"));
//		model.addAttribute("currentPage", result.get("currentPage"));
//		model.addAttribute("startRow", result.get("startRow"));
//		model.addAttribute("endRow", result.get("endRow"));
//		model.addAttribute("recMailList", result.get("recMailList"));
//		model.addAttribute("count", result.get("count"));
//		model.addAttribute("number", result.get("number"));
//		model.addAttribute("sel", sel);
//		model.addAttribute("search", search);
//		
//		System.out.println("sel" + sel);
//		System.out.println("list" + result);
//		
//		
//		
//		
//		return "bizMypage/userManagement";
//	}

}
