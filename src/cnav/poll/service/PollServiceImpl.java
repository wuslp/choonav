package cnav.poll.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import cnav.main.dto.CategoryDTO;
import cnav.poll.dao.PollDAO;
import cnav.poll.dao.PollDAOImpl;
import cnav.poll.dto.PollCommentsDTO;
import cnav.poll.dto.PollDTO;

@Service
public class PollServiceImpl implements PollService{

	@Autowired
	private PollDAOImpl pollDAO = null;
	
	//등록시키기
	@Override
	public void insertArticle(PollDTO dto) throws SQLException {
		// DAO 에서 등록시키게
		pollDAO.insertArticle(dto);
	}
	//모든 리스트 가져오기
	@Override
	public Map<String, Object> getArticleList(String pageNum) throws SQLException {
		//로그인중인 세션 정보 가져오기
		String userId = (String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION);//아이디
		String code = (String)RequestContextHolder.getRequestAttributes().getAttribute("scode", RequestAttributes.SCOPE_SESSION);//회사코드
		String auth = (String)RequestContextHolder.getRequestAttributes().getAttribute("sauth", RequestAttributes.SCOPE_SESSION);//권한
		
		// 한페이지에 보여줄 게시글의 수 
		int pageSize = 4; 
		// 현재 페이지 번호
		if(pageNum == null){ //pageNum 파라미터 안넘어왔을때.
			pageNum = "1";
		}
		
		// 현재 페이지에 보여줄 게시글 시작과 끝 등등 정보 세팅 
		int currentPage = Integer.parseInt(pageNum); // 계산을 위해 현재페이지 숫자로 변환하여 저장 
		int startRow = (currentPage - 1) * pageSize + 1; // 페이지 시작글 번호 
		int endRow = currentPage * pageSize; // 페이지 마지막 글번호

		// 밖에서 사용가능하게 if문 시작 전에 미리 선언
		List<PollDTO> articleList = null;  	// 전체 게시글들 담아줄 변수
		int count = 0; 
		int number = 0; 			// 브라우저 화면에 뿌려줄 가상 글 번호  
		
		//해당 회사코드주고 해당하는 투표 개수 있는지
		// 전체 글의 개수 가져오기 
		count = pollDAO.getArticleCount(code);
		System.out.println("count : " + count);
		// 글이 하나라도 있으면 글들을 다시 가져오기 
		if(count > 0){
			articleList = pollDAO.getArticles(startRow, endRow, code); 
		}
		
		number = count - (currentPage-1) * pageSize; 	// 게시판 목록에 뿌려줄 가상의 글 번호  
		//controller에게 전달해야되는 데이터가 많으니 HashMap 에 넘겨줄 데이터를 저장해서 한번에 전달
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("pageSize", pageSize);
		result.put("pageNum", pageNum);
		result.put("currentPage", currentPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("articleList", articleList);
		result.put("count", count);
		result.put("number", number);
		result.put("code", code);
		//있으면 리스트 불러오기
		
		return result;
	}
	@Override
	public Map<String, Object> getSearchArticleList(String pageNum, String sel, String search) throws SQLException {
		//로그인중인 세션 정보 가져오기
		String userId = (String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION);//아이디
		String code = (String)RequestContextHolder.getRequestAttributes().getAttribute("scode", RequestAttributes.SCOPE_SESSION);//회사코드
		String auth = (String)RequestContextHolder.getRequestAttributes().getAttribute("sauth", RequestAttributes.SCOPE_SESSION);//권한

		// 한페이지에 보여줄 게시글의 수 
		int pageSize = 4; 
		// 현재 페이지 번호
		if(pageNum == null){ //pageNum 파라미터 안넘어왔을때.
			pageNum = "1";
		}
		
		// 현재 페이지에 보여줄 게시글 시작과 끝 등등 정보 세팅 
		int currentPage = Integer.parseInt(pageNum); // 계산을 위해 현재페이지 숫자로 변환하여 저장 
		int startRow = (currentPage - 1) * pageSize + 1; // 페이지 시작글 번호 
		int endRow = currentPage * pageSize; // 페이지 마지막 글번호

		// 밖에서 사용가능하게 if문 시작 전에 미리 선언
		List<PollDTO> articleList = null;  	// 전체 게시글들 담아줄 변수
		int count = 0; 
		int number = 0; 			// 브라우저 화면에 뿌려줄 가상 글 번호  
		
		//개수 있는지
		// 전체 글의 개수 가져오기 
		count = pollDAO.getArticleCount2(sel,search, code);
		System.out.println("count : " + count);
		// 글이 하나라도 
		//있으면 리스트 불러오기
		if(count > 0){
			articleList = pollDAO.getArticles2(startRow, endRow, sel, search, code); 
		}
		
		number = count - (currentPage-1) * pageSize; 	// 게시판 목록에 뿌려줄 가상의 글 번호  
		//controller에게 전달해야되는 데이터가 많으니 HashMap 에 넘겨줄 데이터를 저장해서 한번에 전달
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("pageSize", pageSize);
		result.put("pageNum", pageNum);
		result.put("currentPage", currentPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("articleList", articleList);
		result.put("count", count);
		result.put("number", number);
		result.put("sel", sel);
		result.put("search", search);
		result.put("code", code);

		return result;
	}
	//진행중 완료글
	@Override
	public Map<String, Object> getSortArticle(String pageNum,String sort) throws SQLException {
		//로그인중인 세션 정보 가져오기
		String userId = (String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION);//아이디
		String code = (String)RequestContextHolder.getRequestAttributes().getAttribute("scode", RequestAttributes.SCOPE_SESSION);//회사코드
		String auth = (String)RequestContextHolder.getRequestAttributes().getAttribute("sauth", RequestAttributes.SCOPE_SESSION);//권한
				
		// 한페이지에 보여줄 게시글의 수 
		int pageSize = 4; 
		// 현재 페이지 번호
		if(pageNum == null){ //pageNum 파라미터 안넘어왔을때.
			pageNum = "1";
		}
		
		// 현재 페이지에 보여줄 게시글 시작과 끝 등등 정보 세팅 
		int currentPage = Integer.parseInt(pageNum); // 계산을 위해 현재페이지 숫자로 변환하여 저장 
		int startRow = (currentPage - 1) * pageSize + 1; // 페이지 시작글 번호 
		int endRow = currentPage * pageSize; // 페이지 마지막 글번호

		// 밖에서 사용가능하게 if문 시작 전에 미리 선언
		List<PollDTO> articleList = null;  	// 전체 게시글들 담아줄 변수
		int count = 0; 
		int number = 0; 			// 브라우저 화면에 뿌려줄 가상 글 번호  
		
		//개수 있는지
		// 전체 글의 개수 가져오기 
		count = pollDAO.getArticleCount3(sort,code);
		System.out.println("count : " + count);
		// 글이 하나라도 
		//있으면 리스트 불러오기
		if(count > 0){
			articleList = pollDAO.getArticles3(startRow, endRow, sort, code); 
		}
		
		number = count - (currentPage-1) * pageSize; 	// 게시판 목록에 뿌려줄 가상의 글 번호  
		//controller에게 전달해야되는 데이터가 많으니 HashMap 에 넘겨줄 데이터를 저장해서 한번에 전달
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("pageSize", pageSize);
		result.put("pageNum", pageNum);
		result.put("currentPage", currentPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("articleList", articleList);
		result.put("count", count);
		result.put("number", number);
		result.put("sort", sort);
		result.put("code", code);
		
		return result;
	}
	
	
	//투표글
	@Override
	public PollDTO getPollArticle(int pollNum) throws SQLException {
		PollDTO article = pollDAO.getPollArticle(pollNum);
		return article;
	}
	//접속중인 해당 id의 부서정보 가져오기
	@Override
	public String getUserDept(String userId) throws SQLException {
		String userDept=pollDAO.getUserDept(userId);
		return userDept;
	}
	
	//투표 기록 유무
	@Override
	public int recordPoll(int pollNum, String userId) throws SQLException {
		int result=0;
		result = pollDAO.recordPoll(pollNum, userId);
		return result;
	}
	//투표시 
	@Override
	public void plusPoll(String pollNum, String userId) throws SQLException {
		pollDAO.plusPoll(pollNum,userId);
		
	}
	//기록 업뎃
	@Override
	public void plusPollUser(String pollNum, String userId) throws SQLException {
		pollDAO.plusPollUser(pollNum,userId);
		
	}
	//결과 가져오려고
	@Override
	public PollDTO getPollArticleRes(String pollNum) throws SQLException {
		PollDTO article = pollDAO.getPollArticleRes(pollNum);
		return article;
	}
	//투표글 삭제
	@Override
	public void pollDelete(String pollNum) throws SQLException {
		pollDAO.pollDelete(pollNum);
		
	}

	//댓글등록
	public int pollComment(PollCommentsDTO pdto) throws SQLException{
		int result=0;
		 result =pollDAO.pollComment(pdto);
		 return result;
	}
	//댓글 리스트 가져오기
	@Override
	public List pollCommList(int pollNum) throws SQLException {
		List comList = new ArrayList();
		int result=0;
		String pollNumber=Integer.toString(pollNum);
		result=pollDAO.countComment(pollNumber);
		if(result >0) {
			comList = pollDAO.pollCommList(pollNumber);
		}
		return comList;
	}
	//댓글 삭제
	@Override
	public String CheckId(String pollComNum) throws SQLException {
		String result=null;
		//세션에서 id 뽑아오기
		String userId=(String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION);
		result=pollDAO.CheckId(pollComNum,userId);
		
		return result;
	}
	//댓글 삭제
	@Override
	public void commDelete(String pollComNum) throws SQLException {
		pollDAO.commDelete(pollComNum);
	}
}
