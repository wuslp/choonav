package cnav.main.service;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import cnav.main.dao.MainDAOImpl;
import cnav.main.dto.BusinessDTO;
import cnav.main.dto.CategoryDTO;
import cnav.main.dto.UserDTO;
import cnav.project.dto.ProjectDTO;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	private MainDAOImpl mainDAO = null;
	
	//회원가입처리
	@Override
	public void addUser(UserDTO dto) throws SQLException {
			mainDAO.addUser(dto);
	}

	//회사정보 등록 처리
	@Override
	public void addBiz(BusinessDTO bdto, CategoryDTO cdto, UserDTO udto) throws SQLException {
		mainDAO.addBiz(bdto,cdto,udto);
		
	}

	//id 중복여부 확인 처리
	@Override
	public int idCheck(UserDTO dto) throws SQLException {
		//id 주고 존재여부 확인
		int result = mainDAO.idPwCheck(dto);//있으면1 없으면0 리턴.컨트롤러까지 리턴해줌
		
		return result;
	}

	//회사코드 중복체크
	@Override
	public int codeCheck(BusinessDTO dto) throws SQLException {
		//id 주고 존재여부 확인
		int result = mainDAO.codeCheck(dto);//있으면1 없으면0 리턴.컨트롤러까지 리턴해줌
				
		return result;
	}
	//세션삭제
		@Override
		public void removeSessionAttr(String sessionName) {
			RequestContextHolder.getRequestAttributes().removeAttribute(sessionName, RequestAttributes.SCOPE_SESSION);
		}
	
	//로그인 처리
	@Override
	public int idPwCheck(UserDTO dto) throws SQLException {
		//id pw맞는지 처리
		int result = mainDAO.idPwCheck(dto);
		System.out.println("64번 result : "+result);
		//세션추가
		if(result ==1) {
			//session에 속성추가
			//servlet이 아니라도 
			//service,dao 어디에서나 request속성을 꺼낼수 있는 매서드.session에 set한것과 같은 것
			//id , code , auth
			RequestContextHolder.getRequestAttributes().setAttribute("sid", dto.getUserId(), RequestAttributes.SCOPE_SESSION);
			//RequestContextHolder.getRequestAttributes().setAttribute("sauth", dto.getAuth(), RequestAttributes.SCOPE_SESSION);
			//RequestContextHolder.getRequestAttributes().setAttribute("scode", dto.getCode(), RequestAttributes.SCOPE_SESSION);
			
			UserDTO udto = mainDAO.getUserInfo(dto);
			System.out.println(udto.getAuth());
			System.out.println(udto.getCode());
			RequestContextHolder.getRequestAttributes().setAttribute("sauth", udto.getAuth(), RequestAttributes.SCOPE_SESSION);
			RequestContextHolder.getRequestAttributes().setAttribute("scode", udto.getCode(), RequestAttributes.SCOPE_SESSION);
			
		}
		return result;
	}

	//회사코드로 카테고리 가져오기
	@Override
	public CategoryDTO takeCategory(String scode) throws SQLException {
		CategoryDTO cdto = mainDAO.takeCategory(scode);
		return cdto;
	}

	//조건주고 회원정보 가져오기
	@Override
	public UserDTO findUser(HttpServletResponse response, UserDTO dto) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//있는지 확인하고
		int result =0;
			result = mainDAO.countUser(dto);
		UserDTO udto=null;
		if(result !=0) {//회원정보가 존재하면
			udto = mainDAO.getUserIdPw(dto);//그정보 불러와주기
		}else {//입력값으로 회원가입한 계정이 존재하지않거나 입력값 오류일때 
			//메세지 띄워주기
			out.println("<script>");
			out.println("alert('가입된 계정이 없습니다.\\n입력값을 다시 확인해 주세요');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		return udto;
	}

	@Override
	public Map<String, Object> getNoticeList(String scode) throws SQLException {
		int startRow = 1; // 페이지 시작글 번호 
		int endRow = 10; // 페이지 마지막 글번호
		
		// 프로젝트 게시판 글 가져오기 
		List articleList = null;  	// 전체(검색된) 게시글들 담아줄 변수
		int count = 0; 							// 전체(검색된) 글의 개수 
		int number = 0; 						// 브라우저 화면에 뿌려줄 가상 글 번호  
		
		// 전체 글의 개수 가져오기 
		count = mainDAO.getNoticeCount(scode); // DB에 저장되어있는 전체 글의 개수를 가져와 담기
		System.out.println("Notice count : " + count);
		// 글이 하나라도 있으면 글들을 다시 가져오기 
		if(count > 0){
			articleList = mainDAO.getNoticeList(scode, startRow, endRow);
			System.out.println("articleList" +articleList);
		}
		number = count; 	// 게시판 목록에 뿌려줄 가상의 글 번호  
	
		// Controller에게 전달해야되는 데이터가 많으니 HashMap에 넘겨줄 데이터를 저장해서 한번에 전달 
		Map<String, Object> result = new HashMap<>(); 
		result.put("articleList", articleList);
		result.put("count", count);
		result.put("number", number);
				
		return result;
	}

	@Override
	public BusinessDTO getBizInfo(String scode) throws SQLException {
		BusinessDTO dto = mainDAO.getBizInfo(scode);
		return dto;
	}
	//로그인중인 아이디의 회사코드로 카테고리 DTO ,가져온것 세션에 저장시키기
	@Override
	public void setCatSession(CategoryDTO catDto) throws SQLException {
		RequestContextHolder.getRequestAttributes().setAttribute("cdto", catDto , RequestAttributes.SCOPE_SESSION);		
	}
	
	
	
}
