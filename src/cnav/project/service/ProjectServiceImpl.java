package cnav.project.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import cnav.procomments.dao.ProCommentsDAOImpl;
import cnav.project.dao.ProjectDAOImpl;
import cnav.project.dto.ProjectDTO;


@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	private ProjectDAOImpl projectDAO=null; // 객체 생성 
	
	@Autowired
	private ProCommentsDAOImpl proCommentsDAO=null; // 객체 생성 
	
	// 모든 프로젝트 가져오기(proList)
	@Override
	public Map<String, Object> getProjectList(String pageNum) throws SQLException{		
		// 로그인된 세션 정보 가져오기 
		String userId=(String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION); // 아이디
		String code=(String)RequestContextHolder.getRequestAttributes().getAttribute("scode", RequestAttributes.SCOPE_SESSION); // 회사코드
		
		int pageSize=5;		
		if(pageNum==null) { // proList.cnav 라고만 요청했을때, 즉 pageNum 파라미터 안넘어왔을때
			pageNum="1";
		}
		
		// 현재 페이지에 보여줄 시작과 끝 정보 세팅
		int currentPage = Integer.parseInt(pageNum); // 계산을 위해 현재페이지 숫자로 변환하여 저장 
		int startRow = (currentPage - 1) * pageSize + 1; // 페이지 시작글 번호 
		int endRow = currentPage * pageSize; // 페이지 마지막 글번호
			
		// 프로젝트 내용 가져오기 
		List<ProjectDTO> projectList=null; // 전체 프로젝트들 담아줄 변수 
		int count=0;	// 전체 검색된 프로젝트 갯수
		int number=0;	// 브라우저 화면에 뿌려줄 가상 글 번호들..?
		  
		// 해당 회사코드에 프로젝트 갯수가 있는지
		// 전체 프로젝트 개수 가져오기 
		count=projectDAO.getProjectCount(userId, code); // DB에 저장되어있는 전체 글의 개수를 가져와 담기 
		System.out.println("count : "+count);
		// 하나라도 있으면 프로젝트들을 다시 가져오기 
		if(count >0) {
			projectList=projectDAO.getProjects(startRow, endRow,code);
			
			for(int i = 0; i < projectList.size(); i++) {
				projectList.get(i).setProStart(projectList.get(i).getProStart().split(" ")[0]);
				projectList.get(i).setProEnd(projectList.get(i).getProEnd().split(" ")[0]);
			}
		}
		
		number=count-(currentPage-1)*pageSize; // 프로젝트 목록에 뿌려줄 가상의 글번호들
	

		
		
		
		// Controller에게 전달해야되는 데이터가 많으니 HashMap에 넘겨줄 데이터를 저장
		Map<String, Object> result=new HashMap<>();
		result.put("pageSize", pageSize);
		result.put("pageNum", pageNum);
		result.put("currentPage", currentPage);
		result.put("startRow", startRow);
		result.put("endRow", endRow);
		result.put("projectList", projectList);
		result.put("count", count);
		result.put("number", number);
		result.put("code",code);
		
		return result;		
		
	}
	
	// 프로젝트 검색한거 가져오기 (list 검색)
	@Override
	public Map<String, Object> getSearchProjectList(String pageNum, String sel, String search) throws SQLException {
		String userId=(String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION); // 아이디
		String code=(String)RequestContextHolder.getRequestAttributes().getAttribute("scode", RequestAttributes.SCOPE_SESSION); // 회사코드
			
			// 한페이지에 보여줄 게시글의 수 
			int pageSize = 5; 
			// 현재 페이지 번호
			if(pageNum == null){ //pageNum 파라미터 안넘어왔을때.
				pageNum = "1";
			}
				
			// 현재 페이지에 보여줄 게시글 시작과 끝 등등 정보 세팅 
			int currentPage = Integer.parseInt(pageNum); // 계산을 위해 현재페이지 숫자로 변환하여 저장 
			int startRow = (currentPage - 1) * pageSize + 1; // 페이지 시작글 번호 
			int endRow = currentPage * pageSize; // 페이지 마지막 글번호

			// 밖에서 사용가능하게 if문 시작 전에 미리 선언
			List<ProjectDTO> projectList = null;  	
			int count = 0; 
			int number = 0; 			// 브라우저 화면에 뿌려줄 가상 글 번호  
				
			//개수 있는지
			// 전체 글의 개수 가져오기 
			count = projectDAO.getSearchProjectCount(sel,search,code);  
			System.out.println("count : " + count);
			// 글이 하나라도 
			//있으면 리스트 불러오기
			if(count > 0){
				projectList = projectDAO.getSearchProjects(startRow, endRow, sel, search,code); 
				
				for(int i = 0; i < projectList.size(); i++) {
					projectList.get(i).setProStart(projectList.get(i).getProStart().split(" ")[0]);
					projectList.get(i).setProEnd(projectList.get(i).getProEnd().split(" ")[0]);
				}
			}
					
			number = count - (currentPage-1) * pageSize; 	// 게시판 목록에 뿌려줄 가상의 글 번호  
			

			
			//controller에게 전달해야되는 데이터가 많으니 HashMap 에 넘겨줄 데이터를 저장해서 한번에 전달
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("pageSize", pageSize);
			result.put("pageNum", pageNum);
			result.put("currentPage", currentPage);
			result.put("startRow", startRow);
			result.put("endRow", endRow);
			result.put("projectList", projectList);
			result.put("count", count);
			result.put("number", number);
			result.put("sel", sel);
			result.put("search", search);
			result.put("code",code);
				
			return result;
		}
		
		// 진행중/ 완료
		@Override
		public Map<String, Object> getSortProject(String pageNum, String sort) throws SQLException{
			String userId=(String)RequestContextHolder.getRequestAttributes().getAttribute("sid", RequestAttributes.SCOPE_SESSION); // 아이디
			String code=(String)RequestContextHolder.getRequestAttributes().getAttribute("scode", RequestAttributes.SCOPE_SESSION); 
					
			// 한페이지에 보여줄 게시글의 수 
			int pageSize = 5; 
			// 현재 페이지 번호
			if(pageNum == null){ //pageNum 파라미터 안넘어왔을때.
				pageNum = "1";
			}
			
			// 현재 페이지에 보여줄 게시글 시작과 끝 등등 정보 세팅 
			int currentPage = Integer.parseInt(pageNum); // 계산을 위해 현재페이지 숫자로 변환하여 저장 
			int startRow = (currentPage - 1) * pageSize + 1; // 페이지 시작글 번호 
			int endRow = currentPage * pageSize; // 페이지 마지막 글번호

			// 밖에서 사용가능하게 if문 시작 전에 미리 선언
			List<ProjectDTO> projectList = null;  	// 전체 게시글들 담아줄 변수
			int count = 0; 
			int number = 0; 			// 브라우저 화면에 뿌려줄 가상 글 번호  
			
			//개수 있는지
			// 전체 글의 개수 가져오기 
			count = projectDAO.getProjectState(sort,code);
			System.out.println("count : " + count);
			// 글이 하나라도 
			//있으면 리스트 불러오기
			if(count > 0){
				projectList = projectDAO.getState(startRow, endRow, sort,code); 
				
				for(int i = 0; i < projectList.size(); i++) {
					projectList.get(i).setProStart(projectList.get(i).getProStart().split(" ")[0]);
					projectList.get(i).setProEnd(projectList.get(i).getProEnd().split(" ")[0]);
				}
			}
			
			number = count - (currentPage-1) * pageSize; 	// 게시판 목록에 뿌려줄 가상의 글 번호
			

			//controller에게 전달해야되는 데이터가 많으니 HashMap 에 넘겨줄 데이터를 저장해서 한번에 전달
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("pageSize", pageSize);
			result.put("pageNum", pageNum);
			result.put("currentPage", currentPage);
			result.put("startRow", startRow);
			result.put("endRow", endRow);
			result.put("projectList", projectList);
			result.put("count", count);
			result.put("number", number);
			result.put("sort", sort);
			result.put("code", code);
			
			return result;
		}
		
	
	// 프로젝트 저장
	@Override
	public void insertProject(ProjectDTO dto) throws SQLException{
		//유저아이디=담당자
		String name=projectDAO.getName(dto.getUserId());
		dto.setName(name);
		projectDAO.insertProject(dto);
	}
	
	// 프로젝트 1개 정보 가져오기
	@Override
	public ProjectDTO getProject(int proNum) throws SQLException {
		// 해당 정보 가져오기
		ProjectDTO project=projectDAO.getProject(proNum);
		project.setProStart(project.getProStart().split(" ")[0]);
		project.setProEnd(project.getProEnd().split(" ")[0]);
		
		return project;
	}
	
	// 수정된 프로젝트 1개 정보 가져오기 
	@Override
	public ProjectDTO getUpdateProject(int proNum) throws SQLException {	
		ProjectDTO project=projectDAO.getProject(proNum);
		project.setProStart(project.getProStart().split(" ")[0]);
		project.setProEnd(project.getProEnd().split(" ")[0]);
		return project;
	}
	// 프로젝트 수정
	// 수정할때와 삭제할때 그냥 삭제 가능하게 둘건지 
	// 아니면 유저아이디(프로젝트 만든 담당자) 체크하고 수정/삭제 가능하게 둘건지 

	@Override
	public int updateProject(ProjectDTO dto) throws SQLException {
		projectDAO.updateProject(dto);		
		return 0;
	}
	// 프로젝트 삭제
	@Override
	public void deleteProject(String proNum) throws SQLException{
		projectDAO.deleteProject(proNum);
		proCommentsDAO.delComs(proNum);
	}
	
	
	

	

	


		
		
		
		
}		
		
		

	
