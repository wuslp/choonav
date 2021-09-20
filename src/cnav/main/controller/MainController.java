package cnav.main.controller;

import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//시작페이지
	@RequestMapping("startPage.cnav")
	public String startPage() {
		
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
	public String signupPro(UserDTO dto, Model model) throws SQLException {
		System.out.println("68번 확인용 출력"+dto.getUserId());//확인용
		mainService.addUser(dto);
		String page;//code입력값이 있을경우 ->일반회원가입,없을경우 -> 바로 비즈니스계정 등록 페이지로 이동시키기
		model.addAttribute("signupId",dto.getUserId());//가입시 입력한 아이디 넘겨주기
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
	public String bizSignupPro(BusinessDTO bdto,CategoryDTO cdto,UserDTO udto) throws SQLException {
		System.out.println("signupId 확인용 :"+udto.getUserId());
		System.out.println("67번 :"+bdto.getBizCEO());//확인용
		System.out.println("66번 :"+cdto.getApproval());//확인용
		mainService.addBiz(bdto,cdto,udto);
		  
		return "main/startPage";
	}
	
	//로그인으로 이동
	@RequestMapping("loginForm.cnav")
	public String loginForm() {
		
		return "main/loginForm";
	}
	//ajaxCodeAvail 회원가입시 회사코드 체크
	@RequestMapping("ajaxCodeCheck.cnav")
	public ResponseEntity<String> ajaxCodeCheck(BusinessDTO dto) throws SQLException{//responsebody 어노테이션 필요없다.헤더정보까지 다 보내준다
		System.out.println("controller id : "+dto.getUserId());
		int result = mainService.codeCheck(dto);//business계정을 등록된 회사코드가 있으면 1, 없으면0
		String data ="";//결과를 문자열로 돌려줄때 담아놓을 변수 미리 선언
		if(result ==1) {//db에 등록된 회사코드가 있다는 것이니까 
			data="그룹웨어가 개설된 회사코드입니다 :)";//이 문자열 저장해서 리턴해주고
		}else {//db에 등록되지 않은 회사코드일 경우
			data="관리자가 회사계정을 먼저 개설해 주세요";//이 문자열 저장해서 리턴=>한글깨짐발생
		}
		HttpHeaders respHeaders = new HttpHeaders();//헤더 객체 만들어
		respHeaders.add("Content-Type", "text/html;charset=utf-8");//헤더 정보 추가 (charset=utf-8 로 한글깨짐 방지하여 결과물 응답해주기)
		
		//return data; 한글깨짐
		return new ResponseEntity<String>(data, respHeaders	, HttpStatus.OK);
	}
	//회원가입시 id 중복체크
	@RequestMapping("ajaxIdAvail.cnav")
	public ResponseEntity<String> ajaxIdAvail(UserDTO dto) throws SQLException{
		System.out.println("controller id : "+dto.getUserId());
		int result = mainService.idCheck(dto);//있으면 1, 없으면0
		String data ="";//결과를 문자열로 돌려줄때 담아놓을 변수 미리 선언
		if(result ==1) {//db에 id있으니까 
			data="사용중인 아이디 입니다";//이 문자열 저장해서 리턴해주고
		}else {//db에 없는 아이디일경우
			data="사용가능 :)";//이 문자열 저장해서 리턴
		}
		HttpHeaders respHeaders = new HttpHeaders();//헤더 객체 만들어
		respHeaders.add("Content-Type", "text/html;charset=utf-8");//헤더 정보 추가 (charset=utf-8 로 한글깨짐 방지하여 결과물 응답해주기)
		
		//return data; 한글깨짐
		return new ResponseEntity<String>(data, respHeaders	, HttpStatus.OK);
	}
	//회사정보 등록시 회사코드 중복체크
	@RequestMapping("ajaxCodeAvail.cnav")
	public ResponseEntity<String> ajaxCodeAvail(BusinessDTO dto) throws SQLException{//responsebody 어노테이션 필요없다.헤더정보까지 다 보내준다
		System.out.println("controller code : "+dto.getCode());
		int result = mainService.codeCheck(dto);//있으면 1, 없으면0
		String data ="";
		if(result ==1) {//중복되는 회사코드 db에 있을경우
			data="사용중인 회사코드입니다";
		}else {//db에 없는 회사코드일 경우
			//숫자 유효성 검사
			String pattern = "^[0-9]*$";
			boolean regax = Pattern.matches(pattern, dto.getCode());
			if(regax != true) {
				data="숫자만 입력해 주세요";
			}else {
				data="사용할 수 있는 회사코드 입니다 :)";
			}
		}
		HttpHeaders respHeaders = new HttpHeaders();
		respHeaders.add("Content-Type", "text/html;charset=utf-8");
		return new ResponseEntity<String>(data, respHeaders	, HttpStatus.OK);
	}
	//로그인 처리
	@RequestMapping("loginPro.cnav")
	public String loginPro(UserDTO dto,HttpSession session, Model model) throws SQLException{
		//기존의 세션 삭제
		mainService.removeSessionAttr("sid");
		mainService.removeSessionAttr("scode");
		mainService.removeSessionAttr("sauth");
		
		int result = 0;
		if(session.getAttribute("sid") != null) {
			result = 2;
		}else {
			result = mainService.idPwCheck(dto);
		}
		model.addAttribute("result",result);
		System.out.println("session 아이디:"+session.getAttribute("sid"));
		System.out.println("session 권한 :"+session.getAttribute("sauth"));
		System.out.println("session 코드 :"+session.getAttribute("scode"));
		return "main/loginPro";
	}
	
	//main
	@RequestMapping("main.cnav")
	public String main(HttpSession session,Model model) throws SQLException{
		//회사코드 꺼내와서 해당하는 카테고리만 보여주기
		String scode =(String)session.getAttribute("scode");
		//회사코드에 해당하는 카테고리 dto 전체 넘겨주기
		CategoryDTO cdto = mainService.takeCategory(scode);
		model.addAttribute("cdto",cdto);
		return "main/main";
	}
	//아이디 찾기 폼
	@RequestMapping("findId.cnav")
	public String findId() {
		return "main/findId";
	}
	
	//아이디 찾기
	@RequestMapping("findIdRes.cnav")
	public String findIdRes(Model model,UserDTO dto) throws SQLException {
		System.out.println("63번 이름 확인 :"+dto.getName());
		System.out.println("62번 이메일 확인 :"+dto.getEmail());
		UserDTO udto = mainService.findUser(dto);

		model.addAttribute("udto", udto);
		return "main/findIdRes";
	}
	//비밀번호 찾기
	@RequestMapping("findPw.cnav")
	public String findPw(Model model,UserDTO dto) {
		return "main/findPw";
	}
	//비밀번호 찾기 결과
	@RequestMapping("findPwRes.cnav")
	public String findPwRes(Model model,UserDTO dto) throws SQLException {
		System.out.println("58번 아이디 확인 :"+dto.getUserId());
		UserDTO udto = mainService.findUser(dto);
		model.addAttribute("udto",udto);		
		return "main/findPwRes";
	}

}
