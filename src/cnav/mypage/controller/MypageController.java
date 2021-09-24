package cnav.mypage.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cnav.main.dto.UserDTO;
import cnav.mypage.dto.UserInfoDTO;
import cnav.mypage.service.MypageService;

@Controller
@RequestMapping("/my/*")
public class MypageController {

	@Autowired
	private MypageService myService = null;
	
	@RequestMapping("myPjList.cnav")
	public String myPjList(HttpSession session, Model model, String pageNum) throws SQLException {
		session.setAttribute("sid", "java");
		session.setAttribute("scode", "1111");
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		
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
		session.setAttribute("scode", "1111");
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		
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
	
	// 내가 쓴 댓글 가져오기
	@RequestMapping("myCommentsList.cnav")
	public String myCommentsList(HttpSession session, Model model, String pageNum) throws SQLException {
		session.setAttribute("sid", "java");
		session.setAttribute("scode", "1111");
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		
		Map<String, Object> result = null;
		result = myService.getMyTopCommList(userId, code, pageNum);
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
			return "bizMypage/bizCommentsList";
		}else {
			return "userMypage/myCommentsList";
		}
	}
	
	// 마이페이지 메인
	@RequestMapping("mypage.cnav")
	public String mypage(HttpSession session, Model model) throws SQLException {
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		UserInfoDTO dto = myService.getUserInfo(userId, code);
		
		model.addAttribute("dto", dto);
		model.addAttribute("userId", userId);
		
		
		session.setAttribute("sauto", "0");
		String auto = (String)session.getAttribute("sauto");
		if(auto.equals("1")){
			return "bizMypage/bizMypage";
		}else {
			return "userMypage/userMypage";
		}
	}
	
	// 마이페이지 - 계정정보 수정 form page
	@RequestMapping("modifyForm.cnav")
	public String modifyForm(HttpSession session, Model model) throws SQLException {
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		UserInfoDTO dto = myService.getUserInfo(userId, code);
		
		model.addAttribute("dto", dto);
		model.addAttribute("userId", userId);
		
		
		session.setAttribute("sauto", "0");
		String auto = (String)session.getAttribute("sauto");
		if(auto.equals("1")){
			return "bizMypage/bizModifyForm";
		}else {
			return "userMypage/userModifyForm";
		}
	}
	
	// 마이페이지 - 계정정보 수정 pro page
	@RequestMapping("modifyPro.cnav")
	public String modifyPro(HttpSession session, Model model, UserDTO dto) throws SQLException {
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		int res = myService.updateUserInfo(userId, code, dto);
		System.out.println("정보수정 result" + res);
		
		model.addAttribute("res", res);
		
		session.setAttribute("sauto", "0");
		String auto = (String)session.getAttribute("sauto");
		if(auto.equals("1")){
			return "bizMypage/bizModifyPro";
		}else {
			return "userMypage/userModifyPro";
		}
	}
	
	// 마이페이지 - 비밀번호 변경 form page
	@RequestMapping("pwChangeForm.cnav")
	public String pwChangeForm(HttpSession session, Model model, UserDTO dto) throws SQLException {
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		
		session.setAttribute("sauto", "0");
		String auto = (String)session.getAttribute("sauto");
		if(auto.equals("1")){
			return "bizMypage/bizPwChangeForm";
		}else {
			return "userMypage/userPwChangeForm";
		}
	}
	
	// 마이페이지 - 비밀번호 변경 pro page
	@RequestMapping("pwChangePro.cnav")
	public String pwChangePro(HttpSession session, Model model, String nowPw, String newPw) throws SQLException {
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		int res = myService.pwChenge(nowPw, newPw, userId);
		
		model.addAttribute("res", res);
		
		session.setAttribute("sauto", "0");
		String auto = (String)session.getAttribute("sauto");
		if(auto.equals("1")){
			return "bizMypage/bizPwChangePro";
		}else {
			return "userMypage/userPwChangePro";
		}
	}
	
	// 마이페이지 - 회원탈퇴 form page
	@RequestMapping("deleteForm.cnav")
	public String deleteForm(HttpSession session, Model model) throws SQLException {
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		
		session.setAttribute("sauto", "0");
		String auto = (String)session.getAttribute("sauto");
		if(auto.equals("1")){
			return "bizMypage/bizDeleteForm";
		}else {
			return "userMypage/userDeleteForm";
		}
	}
	
	// 마이페이지 - 회원탈퇴 Pro page
	@RequestMapping("deletePro.cnav")
	public String deletePro(HttpSession session, Model model,String pw) throws SQLException {
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		
		int res = myService.deleteUser(userId, pw);
		model.addAttribute("res", res);
		
		session.setAttribute("sauto", "0");
		String auto = (String)session.getAttribute("sauto");
		if(auto.equals("1")){
			return "bizMypage/bizDeletePro";
		}else {
			return "userMypage/userDeletePro";
		}
	}
	
	
	
	
	
	
	
	
}
