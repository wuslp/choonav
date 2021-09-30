package cnav.approval.controller;

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
import cnav.approval.dto.ApprovalDTO;
import cnav.approval.service.ApprovalServiceImpl;
import cnav.attend.dto.AttendDTO;

// 모든 요청이 들어오는 곳. 페이지 매핑을 해주자 1번 !!! (해당 메서드)

@Controller
@RequestMapping("/approval/*")
public class ApprovalController {
	
	@Autowired
	private ApprovalServiceImpl approvalService = null;
	
	
	// appForm 결재 문서 작성 폼 
	@RequestMapping("appForm.cnav")
	public String appForm(HttpServletRequest request, Model model, HttpSession session) throws SQLException{
		
		// 로그인된 아이디 세션 꺼내기
		String userId = (String)session.getAttribute("sid");
		// 로그인된 아이디 코드 꺼내기
		String code = (String)session.getAttribute("scode");
		List list = approvalService.getUsersId(userId, code);
		
		System.out.println("appForm 출력"+userId+code);
		model.addAttribute("list", list);
		return "approval/appForm";
	}
	
	// appPro 결재 문서 처리 
	@RequestMapping("appPro.cnav")
	public String appPro(HttpSession session, ApprovalDTO dto) throws SQLException {
		// 비즈니스 로직 처리 : 데이터 db 저장
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		dto.setUserId(userId);
		dto.setCode(code);
		
		List list = approvalService.getUsersId(userId, code);
		
		approvalService.addApp(dto);
		
		System.out.println("appPro 시작");
//		approvalService.updateForm(dto);
		
		return "approval/appPro";
	}
	
	
	// 보낸 결재 리스트
	@RequestMapping("sendAppList.cnav")
	public String sendAppList(HttpSession session, String pageNum, String sel, String search, Model model) throws SQLException {
			//	session.setAttribute("sid", "apple");
			//	session.setAttribute("code", "1005");
				String userId = (String)session.getAttribute("sid");
				String code = (String)session.getAttribute("scode");

				Map<String, Object> result = null;
				// 전체 게시글 sel search == null (검색 안한 전체 글 보여주기) 
				if(sel == null || search == null) {
					result = approvalService.getSendAppList(userId, code, pageNum);
				}else { // 검색 게시글 sel search != null
					result = approvalService.sendAppSearch(pageNum, sel, search, userId, code);
				}	
				// view에 전달할 데이터 보내기 
				model.addAttribute("pageSize", result.get("pageSize"));
				model.addAttribute("pageNum", result.get("pageNum"));
				model.addAttribute("currentPage", result.get("currentPage"));
				model.addAttribute("startRow", result.get("startRow"));
				model.addAttribute("endRow", result.get("endRow"));
				model.addAttribute("sendAppList", result.get("sendAppList"));
				model.addAttribute("count", result.get("count"));
				model.addAttribute("number", result.get("number"));
				model.addAttribute("sel", sel);
				model.addAttribute("search", search);
				
				System.out.println("유저 아이디 코드 :" + userId + code);
				
		return "approval/sendAppList";	
	}
	
	// 보낸 결재 상세 
	@RequestMapping("sendAppContent.cnav")
	public String sendAppContent(HttpSession session, Integer num, @ModelAttribute("pageNum") String pageNum, Model model) throws SQLException{
		System.out.println("sendAppContent 출력");
		ApprovalDTO approval = approvalService.getAppCont(num);
		model.addAttribute("approval", approval);
		
		return "approval/sendAppContent";
	}
	
	// 결재 삭제 
	@RequestMapping("deleteApp.cnav")
	public String deleteApp(@RequestParam("appNum") int num) throws Exception {
		approvalService.deleteApp(num);
		return "approval/deleteApp";
	}
	
	// 결재 수정 폼 
	@RequestMapping("modifyApp.cnav")
	public String modifyForm(Integer appNum, @ModelAttribute("pageNum") String pageNum, Model model) throws SQLException {
		ApprovalDTO dto = approvalService.getAppCont(appNum);
		model.addAttribute("approval", dto);
		return "approval/modifyApp";
	}
	
	// 결재 수정 처리 
	@RequestMapping("modifyAppPro.cnav")
	public String updateAppPro(ApprovalDTO dto) throws Exception {
		approvalService.updateApp(dto);
		
		return "approval/modifyAppPro";
	}
	

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	// takeAppList 받은 결재 리스트
	@RequestMapping("takeAppList.cnav")
	public String takeAppList(HttpSession session, String pageNum, String sel, String search, Model model) throws SQLException {
		String userId = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		
		
		Map<String, Object> result = null;
		// 전체 게시글 sel search == null (검색 안한 전체 글 보여주기) 
		if(sel == null || search == null) {
			result = approvalService.getTakeAppList(userId, code, pageNum);
		}else { // 검색 게시글 sel search != null
			result = approvalService.takeAppSearch(pageNum, sel, search, userId, code);
		}	
		// view에 전달할 데이터 보내기 
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("currentPage", result.get("currentPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("takeAppList", result.get("takeAppList"));
		model.addAttribute("count", result.get("count"));
		model.addAttribute("number", result.get("number"));
		model.addAttribute("sel", sel);
		model.addAttribute("search", search);
		
		System.out.println("유저 아이디 코드 :" + userId + code);
		return "approval/takeAppList";
	}
	
	// 받은 결재 상세 
	@RequestMapping("takeAppContent.cnav")
	public String takeAppContent(Integer num, int sign, @ModelAttribute("pageNum") String pageNum, Model model) throws SQLException{
		ApprovalDTO approval = approvalService.takeAppCont(num);
		model.addAttribute("approval", approval);
		model.addAttribute("sign", sign);
		return "approval/takeAppContent";
	}
	
	// 반려 Form 
	@RequestMapping("rejectForm.cnav")
	public String rejectForm(Integer appNum, int sign, @ModelAttribute("pageNum") String pageNum, Model model) throws SQLException {
		//ApprovalDTO dto = approvalService.takeAppCont(appNum);
		model.addAttribute("appNum", appNum);
		model.addAttribute("sign", sign);
		
		return "approval/rejectForm";
	}
	
	// 반려 Pro
	@RequestMapping("rejectPro.cnav")
	public String rejectPro(HttpSession session, ApprovalDTO dto, int sign,  @ModelAttribute("pageNum") String pageNum) throws Exception {

		
		approvalService.addReject(dto);	
		approvalService.takeOk(dto.getAppNum(), sign, 1);
		return "approval/rejectPro";
	}
	
	
	// 승인  1
	@RequestMapping("takeOk.cnav")
	public String takeOk1(Integer appNum, int sign, @ModelAttribute("pageNum") String pageNum, Model model, HttpSession session) throws SQLException {
		// 로그인된 아이디 세션 꺼내기
		String userId = (String)session.getAttribute("sid");
		// 로그인된 아이디 코드 꺼내기
		String code = (String)session.getAttribute("scode");
		List list = approvalService.getUsersId(userId, code);
	
		approvalService.takeOk(appNum, sign, 2);	
		model.addAttribute("appNum", appNum); 
		//model.addAttribute("approval", dto);
		

		
		model.addAttribute("list", list);
		
		return "approval/takeOk";
	}
	
	
	// 승인시 승인자 추가 
		@RequestMapping("addTake.cnav")
		public String addTake(ApprovalDTO dto) throws Exception {
			approvalService.addTake(dto);	
			return "approval/addTake";
		}
		
		
		@RequestMapping("takeOk2.cnav")
		public String takeOk2(Integer appNum, int sign, @ModelAttribute("pageNum") String pageNum, Model model, HttpSession session) throws SQLException {
			//ApprovalDTO dto = approvalService.takeAppCont(appNum);
			approvalService.takeOk2(appNum, sign, 2);	
			model.addAttribute("appNum", appNum); 
			//model.addAttribute("approval", dto);
			
			// 로그인된 아이디 세션 꺼내기
			String userId = (String)session.getAttribute("sid");
			// 로그인된 아이디 코드 꺼내기
			String code = (String)session.getAttribute("scode");
			List list = approvalService.getUsersId(userId, code);
			
			model.addAttribute("list", list);
			
			
			return "approval/takeOk2";
		}
		
		
		// 승인시 승인자 추가 
			@RequestMapping("addTake2.cnav")
			public String addTake2(ApprovalDTO dto) throws Exception {
				approvalService.addTake2(dto);	
				return "approval/addTake2";
			}
	
			@RequestMapping("takeOk3.cnav")
			public String takeOk3(HttpSession session, ApprovalDTO dto, AttendDTO adto, Integer appNum, int sign, @ModelAttribute("pageNum") String pageNum, Model model) throws SQLException {
				//ApprovalDTO dto = approvalService.takeAppCont(appNum);
				approvalService.takeOk3(appNum, sign, 2);	
				model.addAttribute("appNum", appNum); 
				//model.addAttribute("approval", dto);
				
				
				
				return "approval/takeOk3";
			}	
			
			
			
			

			@RequestMapping("index.cnav")
			public String index()throws Exception {
				return "approval/index";
			}
}
