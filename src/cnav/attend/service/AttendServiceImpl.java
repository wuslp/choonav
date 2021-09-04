package cnav.attend.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import cnav.attend.dao.AttendDAOImpl;
import cnav.attend.dto.AttendDTO;

@Service
public class AttendServiceImpl implements AttendService{

	@Autowired
	private AttendDAOImpl attendDAO = null;

	@Override
	public Map<String, Object> attendList(String pageNum) throws SQLException {
		// ** 게시글 페이지 관련 정보 세팅 ** 
		//정보 가져올 userId 세션에서 처리
		//string id = (String)session.getAttribute("sid") 한것과 똑같음
		//********************************************임시처리 
		//String userId = (String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION);
		String userId = "genie0921";
		
		// 한페이지에 보여줄 게시글의 수 
		int pageSize = 3; 
		// 현재 페이지 번호  
		if(pageNum == null){ 
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // 계산을 위해 현재페이지 숫자로 변환하여 저장 
		int startRow = (currentPage - 1) * pageSize + 1; // 페이지 시작글 번호 
		int endRow = currentPage * pageSize; // 페이지 마지막 글번호
		
		// 밖에서 사용가능하게 if문 시작 전에 미리 선언
		List<AttendDTO> userAttendList = null;  	// 전체 리스트
		int count = 0;
		int number = 0;
		

		// 전체 근태리스트 개수 가져오기 
		count = attendDAO.getAttendCount(userId);  
		System.out.println("count : " + count);
		// 글이 하나라도 있으면 글들을 다시 가져오기 
		if(count > 0){
			userAttendList = attendDAO.AttendList(startRow, endRow, userId); 
			System.out.println("99번"+userAttendList);
		}
		
		number = count - (currentPage-1) * pageSize; 	// 게시판 목록에 뿌려줄 가상의 글 번호  

		
		//controller에게 전달해야되는 데이터가 많으니 HashMap 에 넘겨줄 데이터를 저장해서 한번에 전달
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("pageSize", pageSize);
		result.put("pageNum", pageNum);
		result.put("currentPage", currentPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("userAttendList", userAttendList);
		result.put("count", count);
		result.put("number", number);

		return result;
		
			
		// 날짜 출력 형태 패턴 생성 
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		// view에게 위에 데이터 전부 보내기 
		/*
		 * request.setAttribute("pageSize", pageSize); request.setAttribute("pageNum",pageNum); 
		 * request.setAttribute("currentPage", currentPage);
		 * request.setAttribute("startRow", startRow); 
		 * request.setAttribute("endRow", endRow);
		 * request.setAttribute("sel", sel);
		 * request.setAttribute("search",search); 
		 * request.setAttribute("articleList", articleList);
		 * request.setAttribute("count", count); 
		 * request.setAttribute("number", number);
		 */
	}
	


}
