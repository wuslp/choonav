package cnav.main.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
	//회사정보등록 이동
	@RequestMapping("bizSignupForm.cnav")
	public String bizSignupForm() {
		
		return "main/bizSignupForm";
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
		  
		return "main/startPage";
	}
	
	//로그인으로 이동
	@RequestMapping("loginForm.cnav")
	public String loginForm() {
		
		return "main/loginForm";
	}
	//회원가입시 id 중복체크
	@RequestMapping("ajaxIdAvail.cnav")
	public ResponseEntity<String> ajaxIdAvail(UserDTO dto) throws SQLException{//responsebody 어노테이션 필요없다.헤더정보까지 다 보내준다
		System.out.println("controller id : "+dto.getUserId());
		int result = mainService.idCheck(dto);//있으면 1, 없으면0
		String data ="";//결과를 문자열로 돌려줄때 담아놓을 변수 미리 선언
		if(result ==1) {//db에 id있으니까 
			data="사용중인 아이디 입니다";//이 문자열 저장해서 리턴해주고
		}else {//db에 없는 아이디일경우
			data="사용가능 :)";//이 문자열 저장해서 리턴=>한글깨짐발생
		}
		HttpHeaders respHeaders = new HttpHeaders();//헤더 객체 만들어
		respHeaders.add("Content-Type", "text/html;charset=utf-8");//헤더 정보 추가 (charset=utf-8 로 한글깨짐 방지하여 결과물 응답해주기)
		
		//return data; 한글깨짐
		return new ResponseEntity<String>(data, respHeaders	, HttpStatus.OK);
	}
	//회사정보 등록시 회사코드 중복체크
	@RequestMapping("ajaxCodeAvail.cnav")
	public ResponseEntity<String> ajaxCodeAvail(BusinessDTO dto) throws SQLException{//responsebody 어노테이션 필요없다.헤더정보까지 다 보내준다
		System.out.println("controller id : "+dto.getCode());
		int result = mainService.codeCheck(dto);//있으면 1, 없으면0
		String data ="";
		if(result ==1) {//중복되는 회사코드 db에 있을경우
			data="사용중인 회사코드입니다";
		}else {//db에 없는 회사코드일 경우
			data="사용가능 :)";
		}
		HttpHeaders respHeaders = new HttpHeaders();
		respHeaders.add("Content-Type", "text/html;charset=utf-8");
		return new ResponseEntity<String>(data, respHeaders	, HttpStatus.OK);
	}
	
}
