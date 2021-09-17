package cnav.approval.dao;

import java.sql.SQLException;
import java.util.List;

import cnav.approval.dto.ApprovalDTO;

// 2번 : 인터페이스에는 추상메서드가 들어온다, 

public interface ApprovalDAO {

	// 결재 문서 작성 
	public void insertApp(ApprovalDTO dto) throws SQLException;
	
	// 전체 게시글 개수 가져오기 
	public int getAppCount() throws SQLException;
	// 한 페이지의 글 목록 가져오기 (StartRow, endRow)
	public List<ApprovalDTO> getApprovals(int start, int end) throws SQLException; 
	
	// 검색 게시글 수 가져오기 
	public int searchSendAppCount(String sel, String search) throws SQLException; 
	// 검색 게시글 목록 가져오기 
	public List<ApprovalDTO> sendSearchApprovals(int start, int end, String sel, String search) throws SQLException;

	// send 보낸 게시글 1개 가져오기 
	public ApprovalDTO getAppCont(int appNum) throws SQLException;
	// 게시글 수정 
	public void updateApp(ApprovalDTO dto) throws SQLException;
	// 게시글 삭제 
	public void deleteApp(int appNum) throws SQLException;
	
////////////////////////////////////////////////////////////////////
	
	// take 전체 게시글 개수 가져오기 
	public int	takeAppCount() throws SQLException;
	// 한 페이지의 글 목록 가져오기 (StartRow, endRow)
	public List<ApprovalDTO> takeApprovals(int start, int end) throws SQLException; 
	
	// 검색 게시글 수 가져오기 
	public int searchTakeAppCount(String sel, String search) throws SQLException; 
	// 검색 게시글 목록 가져오기 
	public List<ApprovalDTO> takeSearchApprovals(int start, int end, String sel, String search) throws SQLException;
	
	// take 받은 게시글 1개 가져오기 
	public ApprovalDTO takeAppCont(int appNum) throws SQLException;
	
	// 반려 사유 
	public void insertReject(ApprovalDTO dto) throws SQLException;

	// 승인 상태 변경 
	public void updateAppState(Integer appNum, int sign, int newState) throws SQLException;
	
	// 2번째 승인자 추가 
	public void insertAddTake(ApprovalDTO dto) throws SQLException;
	
	// 승인 상태 변경 
	public void updateAppState2(Integer appNum, int sign, int newState) throws SQLException;
	
	// 2번째 승인자 추가 
	public void insertAddTake2(ApprovalDTO dto) throws SQLException;
	
	// 승인 상태 변경 
		public void updateAppState3(Integer appNum, int sign, int newState) throws SQLException;

}
