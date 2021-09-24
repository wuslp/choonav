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

	//---근태 리스트 불러오기 시작 
	@Override
	public Map<String, Object> attendList(String pageNum) throws SQLException {
		// ** 게시글 페이지 관련 정보 세팅 ** 
		//정보 가져올 userId 세션에서 처리
		//string id = (String)session.getAttribute("sid") 한것과 똑같음
		//********************************************임시처리 
		String userId = (String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION);
		String code = (String)RequestContextHolder.getRequestAttributes().getAttribute("scode", RequestAttributes.SCOPE_SESSION);
		String auth = (String)RequestContextHolder.getRequestAttributes().getAttribute("sauth", RequestAttributes.SCOPE_SESSION);
		
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
		count = attendDAO.getAttendCount(userId,code);  
		System.out.println("count : " + count);
		// 글이 하나라도 있으면 글들을 다시 가져오기 
		if(count > 0){
			userAttendList = attendDAO.AttendList(startRow, endRow, userId, code); 
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
	}

	@Override//카테고리 정했을떄
	public Map<String, Object> attendList2(String pageNum, String category) throws SQLException {
		
		//정보 가져올 userId 세션에서 처리
		String userId = (String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION);
		String code = (String)RequestContextHolder.getRequestAttributes().getAttribute("scode", RequestAttributes.SCOPE_SESSION);
		String auth = (String)RequestContextHolder.getRequestAttributes().getAttribute("sauth", RequestAttributes.SCOPE_SESSION);
		
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
		count = attendDAO.getAttendCount2(userId,category,code);  
		System.out.println("count : " + count);
		// 글이 하나라도 있으면 글들을 다시 가져오기 
		if(count > 0){
			userAttendList = attendDAO.AttendList2(startRow, endRow, userId, category, code); 
			System.out.println("95번"+userAttendList);
		}
		
		number = count - (currentPage-1) * pageSize; 	// 게시판 목록에 뿌려줄 가상의 글 번호  

		//controller에게 HashMap 에 넘겨줄 데이터를 저장해서 한번에 전달
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("pageSize", pageSize);
		result.put("pageNum", pageNum);
		result.put("currentPage", currentPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("userAttendList", userAttendList);
		result.put("count", count);
		result.put("number", number);
		result.put("category", category);
		
		return result;
	}
	
	@Override
	public Map<String, Object> attendList3(String pageNum, String category, String search1, String search2) throws SQLException {
		//정보 가져올 userId 세션에서 처리
		//string id = (String)session.getAttribute("sid") 한것과 똑같음
		String userId = (String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION);
		String code = (String)RequestContextHolder.getRequestAttributes().getAttribute("scode", RequestAttributes.SCOPE_SESSION);
		String auth = (String)RequestContextHolder.getRequestAttributes().getAttribute("sauth", RequestAttributes.SCOPE_SESSION);
		
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
		count = attendDAO.getAttendCount3(userId, search1, search2, code);  
		System.out.println("count : " + count);
		// 글이 하나라도 있으면 가져오기
		if(count > 0){
			userAttendList = attendDAO.AttendList3(startRow, endRow, userId, search1, search2, code); 
			System.out.println("94번"+userAttendList);
		}
		
		number = count - (currentPage-1) * pageSize; 

		Map<String, Object> result = new HashMap<String, Object>();
		result.put("pageSize", pageSize);
		result.put("pageNum", pageNum);
		result.put("currentPage", currentPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("userAttendList", userAttendList);
		result.put("count", count);
		result.put("number", number);
		//result.put("category", category);
		result.put("search1", search1);
		result.put("search2", search2);
		
		return result;
	}
	//---근태 리스트 불러오기 끝 
	

	@Override
	public void workInsert() throws SQLException {
		//입력시킬 userId code 세션에서 가져옴 
		String userId = (String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION);
		String code = (String)RequestContextHolder.getRequestAttributes().getAttribute("scode", RequestAttributes.SCOPE_SESSION);
				
		attendDAO.workInsert(userId,code);
	}

	@Override
	public void workInsert2() throws SQLException {
		String userId = (String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION);
		String code = (String)RequestContextHolder.getRequestAttributes().getAttribute("scode", RequestAttributes.SCOPE_SESSION);
				
		attendDAO.workInsert2(userId, code);
	}

	//출근기록 여부
	@Override
	public int WTrecodeCheck() throws SQLException {
		String userId = (String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION);
		String code = (String)RequestContextHolder.getRequestAttributes().getAttribute("scode", RequestAttributes.SCOPE_SESSION);
		int recodeCheck=attendDAO.WTrecodeCheck(userId,code);
		return recodeCheck;
	}
	//출근 기록
	@Override
	public String getWorktimeRecode() throws SQLException {
		String userId = (String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION);
		String code = (String)RequestContextHolder.getRequestAttributes().getAttribute("scode", RequestAttributes.SCOPE_SESSION);
		
		String workTimeRecode=attendDAO.getWorktimeRecode(userId, code);
		return workTimeRecode;
	}
	
	//퇴근기록 여부
	@Override
	public int LTrecodeCheck() throws SQLException {
		String userId = (String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION);
		String code = (String)RequestContextHolder.getRequestAttributes().getAttribute("scode", RequestAttributes.SCOPE_SESSION);
		int recodeCheck=attendDAO.LTrecodeCheck(userId,code);
		return recodeCheck;
	}

	//퇴근기록 가져오기
	@Override
	public String getLeavetimeRecode() throws SQLException {
		String userId = (String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION);
		String code = (String)RequestContextHolder.getRequestAttributes().getAttribute("scode", RequestAttributes.SCOPE_SESSION);
		
		String leaveTimeRecode=attendDAO.getLeavetimeRecode(userId, code);
		return leaveTimeRecode;
	}

	
	


}
