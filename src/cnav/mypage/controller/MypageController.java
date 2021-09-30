package cnav.mypage.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cnav.main.dto.UserDTO;

import cnav.mypage.dto.UserInfoDTO;

import cnav.mypage.service.MypageService;

@Controller
@RequestMapping("/my/*")
public class MypageController {

	@Autowired
	private MypageService myService = null;
	
	@RequestMapping("myPjList.cnav")
	public String myPjList(HttpSession session, Model model, String pageNum) throws SQLException, IOException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
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
		
		String sauth = (String)session.getAttribute("sauth");
		model.addAttribute("sauth", sauth);
		if(sauth.equals("1")){
			return "bizMypage/bizPjList";
		}else {
			return "userMypage/myPjList";
		}
	}
	
	
	@RequestMapping("myTopicList.cnav")
	public String myTopicList(HttpSession session, Model model, String pageNum) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
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
		
		String sauth = (String)session.getAttribute("sauth");
		if(sauth.equals("1")){
			return "bizMypage/bizTopicList";
		}else {
			return "userMypage/myTopicList";
		}
	}
	
	// 내가 쓴 댓글 가져오기
	@RequestMapping("myCommentsList.cnav")
	public String myCommentsList(HttpSession session, Model model, String pageNum) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		
		Map<String, Object> result = null;
		result = myService.getMyTopCommList(userId, code, pageNum);
		
		
		// view에 전달할 데이터 보내기 
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("currentPage", result.get("currentPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("articleList", result.get("articleList"));
		model.addAttribute("count", result.get("count"));
		model.addAttribute("number", result.get("number"));
		
		String sauth = (String)session.getAttribute("sauth");
		if(sauth.equals("1")){
			return "bizMypage/bizCommentsList";
		}else {
			return "userMypage/myCommentsList";
		}
	}
	
	
	// 내가 쓴 댓글 가져오기 (프로젝트)
	@RequestMapping("myPjCommentsList.cnav")
	public String myPjCommentsList(HttpSession session, Model model, String pageNum) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		
		Map<String, Object> result = null;
		result = myService.getMyPjCommList(userId, code, pageNum);
			
		// view에 전달할 데이터 보내기 
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("currentPage", result.get("currentPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("articleList", result.get("articleList"));
		model.addAttribute("count", result.get("count"));
		model.addAttribute("number", result.get("number"));
		
		String sauth = (String)session.getAttribute("sauth");
		if(sauth.equals("1")){
			return "bizMypage/bizCommentsPjList";
		}else {
			return "userMypage/myCommentsPjList";
		}
	}
	
	
	
	// 관리자 -> 회원 정보 수정
	@RequestMapping("userManagement.cnav")
	public String recMailList(HttpSession session, String pageNum, String sel, String search, Model model) throws SQLException{

		String id = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		
		int count = myService.manageCheck(id, code);
		
		if(count == 1) {
			Map<String, Object> result = null;
			if(sel == null || search == null) {
				result = myService.userList(pageNum, code);
			}else {
				result = myService.userListSearch(pageNum, sel, search, code);
			}
			
			model.addAttribute("pageSize", result.get("pageSize"));
			model.addAttribute("pageNum", result.get("pageNum"));
			model.addAttribute("currentPage", result.get("currentPage"));
			model.addAttribute("startRow", result.get("startRow"));
			model.addAttribute("endRow", result.get("endRow"));
			model.addAttribute("userList", result.get("userList"));
			model.addAttribute("count", result.get("count"));
			model.addAttribute("number", result.get("number"));
			model.addAttribute("sel", sel);
			model.addAttribute("search", search);
			
			System.out.println("sel" + sel);
			System.out.println("list" + result);
			
			System.out.println("count 있음! 관리자 맞다! 리스트 뽑는다!" + count);
			
		}else {
			System.out.println("count가 없어! 확인하슈! ");
		}
		return "bizMypage/userManagement";
	}
	// 사원 정보 한명 가져오는 DePopup 띄우기
	@RequestMapping(value = "userManagementDePopup.cnav", method = RequestMethod.GET)
	public String DePopup(@RequestParam("id") String id, Model model) throws SQLException {
		UserDTO dto = myService.userOne(id); 
		model.addAttribute("dto", dto);
		return "bizMypage/userManagementDePopup";
	}
	// 사원 정보 한명 가져오는 PosPopup 띄우기
	@RequestMapping(value = "userManagementPosPopup.cnav", method = RequestMethod.GET)
	public String PosPopup(@RequestParam("id") String id, Model model) throws SQLException {
		UserDTO dto = myService.userOne(id); 
		model.addAttribute("dto", dto);
		return "bizMypage/userManagementPosPopup";
	}

	// ajax를 이용한 사원 Dept 정보 수정
	@RequestMapping(value = "updateDepUser.cnav")
	@ResponseBody
	public String updateDepUser(UserDTO dto, Model model) throws SQLException {
		System.out.println("Dept 불러와짐");
		String result = null;
		result = String.valueOf(myService.updateDepUser(dto));
		
		return result;
	}
	
	// ajax를 이용한 사원 Position 정보 수정
	@RequestMapping(value = "updatePosUser.cnav")
	@ResponseBody
	public String updatePosUser(UserDTO dto, Model model) throws SQLException {
		System.out.println("Posi 불러와짐");
		String result = null;
		result = String.valueOf(myService.updatePosUser(dto));
		
		return result;
	}
	
	// 마이페이지 메인
	@RequestMapping("mypage.cnav")
	public String mypage(HttpSession session, Model model) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		UserInfoDTO dto = myService.getUserInfo(userId, code);
		
		model.addAttribute("dto", dto);
		model.addAttribute("userId", userId);
		
		String sauth = (String)session.getAttribute("sauth");
		model.addAttribute("sauth", sauth);
		if(sauth.equals("1")){
			return "bizMypage/bizMypage";
		}else {
			return "userMypage/userMypage";
		}
	}
	
	// 마이페이지 - 계정정보 수정 form page
	@RequestMapping("modifyForm.cnav")
	public String modifyForm(HttpSession session, Model model) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		UserInfoDTO dto = myService.getUserInfo(userId, code);
		
		model.addAttribute("dto", dto);
		model.addAttribute("userId", userId);
		
		
		String sauth = (String)session.getAttribute("sauth");
		if(sauth.equals("1")){
			return "bizMypage/bizModifyForm";
		}else {
			return "userMypage/userModifyForm";
		}
	}
	
	// 마이페이지 - 계정정보 수정 pro page
	@RequestMapping("modifyPro.cnav")
	public String modifyPro(HttpSession session, Model model, UserDTO dto) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		int res = myService.updateUserInfo(userId, code, dto);
		System.out.println("정보수정 result" + res);
		
		model.addAttribute("res", res);
		
		String sauth = (String)session.getAttribute("sauth");
		if(sauth.equals("1")){
			return "bizMypage/bizModifyPro";
		}else {
			return "userMypage/userModifyPro";
		}
	}
	
	// 마이페이지 - 비밀번호 변경 form page
	@RequestMapping("pwChangeForm.cnav")
	public String pwChangeForm(HttpSession session, Model model, UserDTO dto) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		
		String sauth = (String)session.getAttribute("sauth");
		if(sauth.equals("1")){
			return "bizMypage/bizPwChangeForm";
		}else {
			return "userMypage/userPwChangeForm";
		}
	}
	
	// 마이페이지 - 비밀번호 변경 pro page
	@RequestMapping("pwChangePro.cnav")
	public String pwChangePro(HttpSession session, Model model, String nowPw, String newPw) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		int res = myService.pwChenge(nowPw, newPw, userId);
		
		model.addAttribute("res", res);
		
		String sauth = (String)session.getAttribute("sauth");
		if(sauth.equals("1")){
			return "bizMypage/bizPwChangePro";
		}else {
			return "userMypage/userPwChangePro";
		}
	}
	
	// 마이페이지 - 회원탈퇴 form page
	@RequestMapping("deleteForm.cnav")
	public String deleteForm(HttpSession session, Model model) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		
		String sauth = (String)session.getAttribute("sauth");
		if(sauth.equals("1")){
			return "bizMypage/bizDeleteForm";
		}else {
			return "userMypage/userDeleteForm";
		}
	}
	
	// 마이페이지 - 회원탈퇴 Pro page
	@RequestMapping("deletePro.cnav")
	public String deletePro(HttpSession session, Model model,String pw) throws SQLException {
		
		if(session.getAttribute("sid") == null) {
			return "main/loginForm";
		}
		
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		
		int res = myService.deleteUser(userId, pw);
		model.addAttribute("res", res);
		
		String sauth = (String)session.getAttribute("sauth");
		if(sauth.equals("1")){
			return "bizMypage/bizDeletePro";
		}else {
			return "userMypage/userDeletePro";
		}
	}
	
	
	
	
	
	
	

}
