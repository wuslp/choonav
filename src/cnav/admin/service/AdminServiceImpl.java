package cnav.admin.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnav.admin.dao.AdminDAOImpl;
import cnav.admin.dto.AdminDTO;
import cnav.main.dto.BusinessDTO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAOImpl adminDAO = null;
	
	@Override
	public Map<String, Object> getArticleList(String pageNum) throws SQLException {
		// ** 게시글 페이지 관련 정보 세팅 ** 
		// 한페이지에 보여줄 게시글의 수 
		int pageSize = 10; 
		// 현재 페이지 번호  
		if(pageNum == null){ // pageNum 파라미터 안넘어왔을때.
			pageNum = "1";
		}
		// 현재 페이지에 보여줄 게시글 시작과 끝 등등 정보 세팅 
		int currentPage = Integer.parseInt(pageNum); // 계산을 위해 현재페이지 숫자로 변환하여 저장 
		int startRow = (currentPage - 1) * pageSize + 1; // 페이지 시작글 번호 
		int endRow = currentPage * pageSize; // 페이지 마지막 글번호
				
		// 게시판 글 가져오기 
		List<AdminDTO> articleList = null;  	// 전체(검색된) 게시글들 담아줄 변수
		int count = 0; 							// 전체(검색된) 글의 개수 
		int number = 0; 						// 브라우저 화면에 뿌려줄 가상 글 번호  
		
				
		// 전체 글의 개수 가져오기 
		count = adminDAO.getArticleCount();   // DB에 저장되어있는 전체 글의 개수를 가져와 담기
		System.out.println("count : " + count);
		// 글이 하나라도 있으면 글들을 다시 가져오기 
		if(count > 0){
			articleList = adminDAO.getArticles(startRow, endRow);  
		}
		number = count - (currentPage-1) * pageSize; 	// 게시판 목록에 뿌려줄 가상의 글 번호  

		// Controller에게 전달해야되는 데이터가 많으니 HashMap에 넘겨줄 데이터를 저장해서 한번에 전달 
		Map<String, Object> result = new HashMap<>(); 
		result.put("pageSize", pageSize);
		result.put("pageNum", pageNum);
		result.put("currentPage", currentPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("articleList", articleList);
		result.put("count", count);
		result.put("number", number);
				
		return result;
	}

	@Override
	public void authUpdate0(String userId) throws SQLException {
		adminDAO.authUpdate0(userId); 
	}

	@Override
	public void authUpdate1(String userId) throws SQLException {
		adminDAO.authUpdate1(userId); 		
	}

}
