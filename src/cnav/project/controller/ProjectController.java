package cnav.project.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import cnav.project.dto.ProjectDTO;
import cnav.project.service.ProjectService;
import cnav.project.service.ProjectServiceImpl;

@Controller
@RequestMapping("/project/*")
public class ProjectController {
	
	@Autowired
	private ProjectServiceImpl projectService=null;
	
	// 프로젝트 목록 
	@RequestMapping("proList.cnav")
	public String proList(String pageNum, String sel, String search, String sort, Model model) throws SQLException{
		// 해당 페이지에 맞는 화면에 뿌려줄 게시글 가져와서 view에 전달하기 
		Map<String, Object> result=null;
		//String id = (String)session.getAttribute("sid"); // 세션 id값은 service가 처리
		// 전체 글 sel, search, sort
		if(sel == null && search == null && sort == null) {
			result=projectService.getProjectList(pageNum); // 전체리스트 
		}else if(sel ==null && search==null && sort !=null) {
			result=projectService.getSortProject(pageNum, sort); // 진행중/완료
			System.out.println("sort는"+sort);
		}else {
			result=projectService.getSearchProjectList(pageNum, sel, search); //검색
		}	
					

		// view에 전달할 데이터 보내기 
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("currentPage", result.get("currentPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("projectList", result.get("projectList"));
		model.addAttribute("count", result.get("count"));
		model.addAttribute("number", result.get("number"));
		model.addAttribute("sel",result.get("sel"));
		model.addAttribute("search",result.get("search"));
		model.addAttribute("sort",result.get("sort"));
		
		
		
		return "project/proList"; 
	}
		
		
	// 프로젝트 작성
	@RequestMapping("proWriteForm.cnav")
	public String proWriteForm() throws SQLException {

		return "project/proWriteForm";
	}
	
	// 프로젝트 작성 처리 페이지 
	@RequestMapping("proWritePro.cnav")
	public String proWritePro(ProjectDTO dto) throws SQLException{
		dto.setUserId("java"); // 나중에 session에서 id 꺼내 추가로 변경해주기
		// 비즈니스 로직 처리~해 : 데이터 DB에 저장하기
		projectService.insertProject(dto);
		
		System.out.println("proWritePro 나와주세요!");
			
		return "redirect:/project/proList.cnav"; // list로 경로 수정
	}
	
	// 프로젝트 상세 페이지 요청(proContent 페이지)
	@RequestMapping("proContent.cnav")
	public String proContent(@ModelAttribute("pageNum") String pageNum, Integer proNum, Model model) throws SQLException{
		// 고유번호 주면서 해당 글에 대한 내용 받아와 view에 전달
		ProjectDTO project=projectService.getProject(proNum);
		model.addAttribute("project", project);
		
		return "project/proContent";
	}
	
	// 프로젝트 수정 폼
	@RequestMapping("proModForm.cnav")
	public String proModForm(Integer proNum, @ModelAttribute("pageNum") String pageNum, Model model) throws SQLException{
		ProjectDTO project=projectService.getUpdateProject(proNum);
		model.addAttribute("project",project);
		
		return "project/proModForm";
	}
	
	// 프로젝트 수정 처리 
	@RequestMapping("proModPro.cnav")
	public String proModPro(ProjectDTO dto,Model model) throws SQLException{
		int result=projectService.updateProject(dto);
		model.addAttribute("result",result);
		return "project/proModPro";
	}
	// 프로젝트 삭제 
	@RequestMapping("proDelForm.cnav")
	public String proDelForm(int proNum) throws SQLException{
		return "project/proDelForm";
	}
	
	
	

	
	



}
