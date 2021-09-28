package cnav.approval.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnav.approval.dao.ApprovalDAOImpl;
import cnav.approval.dto.ApprovalDTO;
import cnav.attend.dto.AttendDTO;
import cnav.main.dto.UserDTO;

// 비즈니스 로직 처리 

@Service // 서비스 역할. 비즈니스 로직 처리할 친구. component-scan 이용해 자동으로 빈으로 등록 시킬것. (객체생성)
public class ApprovalServiceImpl implements ApprovalService{
	
	@Autowired
	private ApprovalDAOImpl approvalDAO = null;
	
	// 결재 문서 작성 (appForm)
	@Override
	public void addApp(ApprovalDTO dto) throws SQLException{
		// 데이터 줄게 결재 작성한거 저장해줘 ! 를 데이터 담당자에게 .
		String name = approvalDAO.selectName(dto);
		dto.setName(name);
		System.out.println(name);
		approvalDAO.insertApp(dto);
		
	}	
	
	// 보낸 결재 확인 sendAppList 
	
	@Override
	public Map<String, Object> getSendAppList(String userId, String code, String pageNum) throws SQLException {
		
		// ** 게시글 페이지 관련 정보 세팅 ** 
		// 한페이지에 보여줄 게시글의 수 
		int pageSize = 10; 
		// 현재 페이지 번호  
		if(pageNum == null){ // list.do 라고만 요청했을때, 즉 pageNum 파라미터 안넘어왔을때.
			pageNum = "1";
		}
		// 현재 페이지에 보여줄 게시글 시작과 끝 등등 정보 세팅 
		int currentPage = Integer.parseInt(pageNum); // 계산을 위해 현재페이지 숫자로 변환하여 저장 
		int startRow = (currentPage - 1) * pageSize + 1; // 페이지 시작글 번호 
		int endRow = currentPage * pageSize; // 페이지 마지막 글번호
		
		// 게시판 글 가져오기 
		List<ApprovalDTO> sendAppList = null;  	// 전체(검색된) 게시글들 담아줄 변수
		int count = 0; 							// 전체(검색된) 글의 개수 
		int number = 0; 						// 브라우저 화면에 뿌려줄 가상 글 번호  

		
		// 전체 글의 개수 가져오기 
		count = approvalDAO.getAppCount(userId, code);   // DB에 저장되어있는 전체 글의 개수를 가져와 담기
		System.out.println("count : " + count);
		// 글이 하나라도 있으면 글들을 다시 가져오기 
		if(count > 0){
			sendAppList = approvalDAO.getApprovals(userId, code, startRow, endRow);  
		}
		number = count - (currentPage-1) * pageSize; 	// 게시판 목록에 뿌려줄 가상의 글 번호  
		
		

		// Controller에게 전달해야되는 데이터가 많으니 HashMap에 넘겨줄 데이터를 저장해서 한번에 전달 
		Map<String, Object> result = new HashMap<>(); 
		result.put("pageSize", pageSize);
		result.put("pageNum", pageNum);
		result.put("currentPage", currentPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("sendAppList", sendAppList);
		result.put("count", count);
		result.put("number", number);

		return result;
		
		
	}
	
	// 검색한 글 목록 가져오기 (list 검색) 
	@Override
	public Map<String, Object> sendAppSearch(String pageNum, String sel, String search, String userId, String code) throws SQLException {
		// ** 게시글 페이지 관련 정보 세팅 ** 
		// 한페이지에 보여줄 게시글의 수 
		int pageSize = 5; 
		// 현재 페이지 번호  
		if(pageNum == null){ // list.do 라고만 요청했을때, 즉 pageNum 파라미터 안넘어왔을때.
			pageNum = "1";
		}
		// 현재 페이지에 보여줄 게시글 시작과 끝 등등 정보 세팅 
		int currentPage = Integer.parseInt(pageNum); // 계산을 위해 현재페이지 숫자로 변환하여 저장 
		int startRow = (currentPage - 1) * pageSize + 1; // 페이지 시작글 번호 
		int endRow = currentPage * pageSize; // 페이지 마지막 글번호
		// 게시판 글 가져오기 
		List<ApprovalDTO> sendAppList = null;  	// 검색된 게시글들 담아줄 변수
		int count = 0; 							// 검색된 글의 개수 
		int number = 0; 						// 브라우저 화면에 뿌려줄 가상 글 번호  
		count = approvalDAO.searchSendAppCount(sel, search, userId, code); // 검색된 글의 총 개수 가져오기 
		System.out.println("검색 count : " + count);
		// 검색한 글이 하나라도 있으면 검색한 글 가져오기 
		if(count > 0){
			sendAppList = approvalDAO.sendSearchApprovals(startRow, endRow, sel, search ,userId, code); 
		}
		number = count - (currentPage-1) * pageSize; 	// 게시판 목록에 뿌려줄 가상의 글 번호  
		// Controller에게 전달해야되는 데이터가 많으니 HashMap에 넘겨줄 데이터를 저장해서 한번에 전달 
		Map<String, Object> result = new HashMap<>(); 
		result.put("pageSize", pageSize);
		result.put("pageNum", pageNum);
		result.put("currentPage", currentPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("sendAppList", sendAppList);
		result.put("count", count);
		result.put("number", number);
		return result;
	}
	
	
	// 보낸 결재 상세 페이지 
	@Override
	public ApprovalDTO getAppCont(int appNum) throws SQLException {
		// 해당 글 정보 가져오기 
		ApprovalDTO approval = approvalDAO.getAppCont(appNum); 
		return approval;
	}
	
	// 보낸 결재 삭제 
	@Override
	public void deleteApp(int appNum) throws SQLException {
		approvalDAO.deleteApp(appNum);
	}
	
	
	// 보낸 결재 수정 
	@Override
	public void updateApp(ApprovalDTO dto) throws SQLException {
		approvalDAO.updateApp(dto);
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////
	
	// 받은 결재 리스트 
	@Override
	public Map<String, Object> getTakeAppList(String userId, String code, String pageNum) throws SQLException {
		
		// ** 게시글 페이지 관련 정보 세팅 ** 
		// 한페이지에 보여줄 게시글의 수 
		int pageSize = 10; 
		// 현재 페이지 번호  
		if(pageNum == null){ // list.do 라고만 요청했을때, 즉 pageNum 파라미터 안넘어왔을때.
			pageNum = "1";
		}
		// 현재 페이지에 보여줄 게시글 시작과 끝 등등 정보 세팅 
		int currentPage = Integer.parseInt(pageNum); // 계산을 위해 현재페이지 숫자로 변환하여 저장 
		int startRow = (currentPage - 1) * pageSize + 1; // 페이지 시작글 번호 
		int endRow = currentPage * pageSize; // 페이지 마지막 글번호
		
		// 게시판 글 가져오기 
		List<ApprovalDTO> takeAppList = null;  	// 전체(검색된) 게시글들 담아줄 변수
		int count = 0; 							// 전체(검색된) 글의 개수 
		int number = 0; 						// 브라우저 화면에 뿌려줄 가상 글 번호  

		
		// 전체 글의 개수 가져오기 
		count = approvalDAO.takeAppCount(userId, code);   // DB에 저장되어있는 전체 글의 개수를 가져와 담기
		System.out.println("받은 count : " + count);
		// 글이 하나라도 있으면 글들을 다시 가져오기 
		if(count > 0){
			takeAppList = approvalDAO.takeApprovals(userId, code, startRow, endRow);  
		}
		number = count - (currentPage-1) * pageSize; 	// 게시판 목록에 뿌려줄 가상의 글 번호  
		
		// Controller에게 전달해야되는 데이터가 많으니 HashMap에 넘겨줄 데이터를 저장해서 한번에 전달 
		Map<String, Object> result = new HashMap<>(); 
		result.put("pageSize", pageSize);
		result.put("pageNum", pageNum);
		result.put("currentPage", currentPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("takeAppList", takeAppList);
		result.put("count", count);
		result.put("number", number);

		return result;
	}
	
	// 받은 결재 검색 목록 
	@Override
	public Map<String, Object> takeAppSearch(String pageNum, String sel, String search, String userId, String code) throws SQLException {
		// ** 게시글 페이지 관련 정보 세팅 ** 
		// 한페이지에 보여줄 게시글의 수 
		int pageSize = 5; 
		// 현재 페이지 번호  
		if(pageNum == null){ // list.do 라고만 요청했을때, 즉 pageNum 파라미터 안넘어왔을때.
			pageNum = "1";
		}
		// 현재 페이지에 보여줄 게시글 시작과 끝 등등 정보 세팅 
		int currentPage = Integer.parseInt(pageNum); // 계산을 위해 현재페이지 숫자로 변환하여 저장 
		int startRow = (currentPage - 1) * pageSize + 1; // 페이지 시작글 번호 
		int endRow = currentPage * pageSize; // 페이지 마지막 글번호
		// 게시판 글 가져오기 
		List<ApprovalDTO> takeAppList = null;  	// 검색된 게시글들 담아줄 변수
		int count = 0; 							// 검색된 글의 개수 
		int number = 0; 						// 브라우저 화면에 뿌려줄 가상 글 번호  
		count = approvalDAO.searchTakeAppCount(sel, search, userId, code); // 검색된 글의 총 개수 가져오기 
		System.out.println("검색 count : " + count);
		// 검색한 글이 하나라도 있으면 검색한 글 가져오기 
		if(count > 0){
			takeAppList = approvalDAO.takeSearchApprovals(startRow, endRow, sel, search, userId, code); 
		}
		number = count - (currentPage-1) * pageSize; 	// 게시판 목록에 뿌려줄 가상의 글 번호  
		// Controller에게 전달해야되는 데이터가 많으니 HashMap에 넘겨줄 데이터를 저장해서 한번에 전달 
		Map<String, Object> result = new HashMap<>(); 
		result.put("pageSize", pageSize);
		result.put("pageNum", pageNum);
		result.put("currentPage", currentPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("takeAppList", takeAppList);
		result.put("count", count);
		result.put("number", number);
		return result;
	}
	
	// 받은 결재 상세 페이지 
	@Override
	public ApprovalDTO takeAppCont(int appNum) throws SQLException {
		// 해당 글 정보 가져오기 
		
		ApprovalDTO approval = approvalDAO.takeAppCont(appNum); 
		return approval;
	}
	
	// 반려 사유
	@Override
	public void addReject(ApprovalDTO dto) throws SQLException {
		approvalDAO.insertReject(dto);//반려사유 저장 처리 
		//approvalDAO.updateAppState(0, sign);//상태 컬럼 숫자를 1로 바꾸기 
	}
	
	@Override
	public void takeOk(Integer appNum, int sign, int newState) throws SQLException{
		//	품의서번호, 사인자번호, 승인상태값 
		approvalDAO.updateAppState(appNum,sign,newState);
	}
	
	@Override
	public void addTake(ApprovalDTO dto) throws SQLException{

		approvalDAO.insertAddTake(dto);
	}
	
	@Override
	public void takeOk2(Integer appNum, int sign, int newState) throws SQLException{
		//	품의서번호, 사인자번호, 승인상태값 
		approvalDAO.updateAppState2(appNum,sign,newState);
	}
	
	@Override
	public void addTake2(ApprovalDTO dto) throws SQLException{

		approvalDAO.insertAddTake2(dto);
	}
	
	@Override
	public void takeOk3(Integer appNum, int sign, int newState) throws SQLException{
		//	품의서번호, 사인자번호, 승인상태값 
		approvalDAO.updateAppState3(appNum,sign,newState);
		
	}

	// 결재자에 넣을 같은회사 유저아이디들 가져오기
	@Override
	public List getUsersId(String userId, String code) throws SQLException {
		List list = approvalDAO.getUsersId(userId, code);
		return list;
	}
	
//	public void insertAttend(AttendDTO adto) throws SQLException{
//		ApprovalDAO.insertAttend(adto);
//	}
	
}
