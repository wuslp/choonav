package cnav.approval.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cnav.approval.dto.ApprovalDTO;
import cnav.attend.dto.AttendDTO;

// 2번 비즈니스 로직 처리 
public interface ApprovalService {
	
	// 보낸 문서 페이지 
	
	// 결재 문서 작성
	public void addApp(ApprovalDTO dto) throws SQLException;
	
	
	// sendAppList 목록 가져오기 
	public Map<String, Object> getSendAppList(String userId, String code, String pageNum) throws SQLException;
	
	// 검색 
	public Map<String, Object> sendAppSearch(String pageNum, String sel, String search, String userId, String code) throws SQLException;
	
	// 보낸 결재 1개 가져오기 Content
	public ApprovalDTO getAppCont(int appNum) throws SQLException;
	
	// 삭제 처리 
	public void deleteApp(int appNum) throws SQLException; 
	
	// 수정 폼 
	public void updateApp(ApprovalDTO dto) throws SQLException;
	
///////////////////////////////////////////////////////////////////////////////////////
	
	// take 받은 결재 리스트 가져오기 
	public Map<String, Object> getTakeAppList(String userId, String code, String pageNum) throws SQLException;
	
	// 검색 
	public Map<String, Object> takeAppSearch(String pageNum, String sel, String search, String userId, String code) throws SQLException;
	
	// take 받은 결재 1개 가져오기 
	public ApprovalDTO takeAppCont(int appNum) throws SQLException;
	
	// 반려사유 
	public void addReject(ApprovalDTO dto) throws SQLException;
	
	// 승인 누르면 state1 칼럼 수정 
	public void takeOk(Integer appNum, int sign, int newState) throws SQLException;
	
	// 2번째 승인자 추가 
	public void addTake(ApprovalDTO dto) throws SQLException;
	
	// 승인 누르면 state1 칼럼 수정 
	public void takeOk2(Integer appNum, int sign, int newState) throws SQLException;
	
	// 2번째 승인자 추가 
	public void addTake2(ApprovalDTO dto) throws SQLException;
	
	public void takeOk3(Integer appNum, int sign, int newState) throws SQLException;
	
	// 결재자에 넣을 같은회사 유저아이디들 가져오기
	public List getUsersId(String userId, String code) throws SQLException;
	
}
