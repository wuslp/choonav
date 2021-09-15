package cnav.main.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cnav.main.dto.BusinessDTO;
import cnav.main.dto.CategoryDTO;
import cnav.main.dto.UserDTO;
import cnav.main.service.MainServiceImpl;

@Controller
@RequestMapping("/main/*")
public class MainController {

	@Autowired
	private MainServiceImpl mainService = null;
	
	//메인
	@RequestMapping("startPage.cnav")
	public String main() {
		//System.out.println("69번 확인용 출력");
		return "main/startPage";
	}
	//회원가입으로 이동
	@RequestMapping("signupForm.cnav")
	public String signupForm() {
		
		return "main/signupForm";
	}
	//회원가입처리
	@RequestMapping("signupPro.cnav")
	public String signupPro(UserDTO dto) throws SQLException {
		System.out.println("68번 확인용 출력"+dto.getUserId());//확인용
		mainService.addUser(dto);
		String page;//code입력값이 있을경우 ->일반회원가입,없을경우 -> 바로 비즈니스계정 등록 페이지로 이동시키기
		System.out.println(dto.getCode() == null); 
		System.out.println(dto.getCode().equals(""));
		if(dto.getCode().equals("")) {
			page = "main/bizSignupForm";
		}else {
			page = "redirect:/main/startPage.cnav";
		}
		return page;
		
	}
	//비즈니스계정 등록처리
	@RequestMapping("bizSignupPro.cnav")
	public String bizSignupPro(BusinessDTO bdto,CategoryDTO cdto) throws SQLException {
		System.out.println("67번 :"+bdto.getBizCEO());//확인용
		System.out.println("66번 :"+cdto.getApproval());//확인용
		mainService.addBiz(bdto,cdto);
		
		return "main/main";
	}
	
	//로그인으로 이동
	@RequestMapping("loginForm.cnav")
	public String loginForm() {
		
		return "main/loginForm";
	}
	
	
}
