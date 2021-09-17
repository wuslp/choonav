package cnav.main.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import cnav.main.dao.MainDAOImpl;
import cnav.main.dto.BusinessDTO;
import cnav.main.dto.CategoryDTO;
import cnav.main.dto.UserDTO;

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
	public void addBiz(BusinessDTO bdto, CategoryDTO cdto) throws SQLException {
		mainDAO.addBiz(bdto,cdto);
		
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
			//service,dao 어디에서나 request속성을 꺼낼수 있는 매세드.session에 set한것과 같은 것
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
	public UserDTO findUser(UserDTO dto) throws SQLException {
		//있는지 확인하고
		int result =0;
			result = mainDAO.countUser(dto);
		UserDTO udto=null;
		if(result!=0) {//회원정보가 존재하면
			udto = mainDAO.getUserIdPw(dto);//그정보 불러와주기
		}
		return udto;
	}
	
	
	
}
