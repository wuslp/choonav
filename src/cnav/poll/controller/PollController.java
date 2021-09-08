package cnav.poll.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cnav.poll.dto.PollDTO;
import cnav.poll.service.PollServiceImpl;

@Controller
@RequestMapping("/poll/*")
public class PollController {

	@Autowired
	private PollServiceImpl pollService=null;
	
	//투표폼
	@RequestMapping("pollForm.cnav")
	public String pollForm() {
		
		return "poll/pollForm";
	}
	//투표리스트 로딩
	@RequestMapping("pollList.cnav")
	public String pollList(Model model,String pageNum, String sel, String search) throws SQLException {
		// 비지니스로직처리해당하는것이 작성된 service 의 메서드 호출 
		// -> 결과 받아올것이 있으면 서비스로부터 리턴받은것 view로 전달 
		//세션 id값->service처리 
		System.out.println("89번 poll 투표 리스트 출력");
		Map<String, Object> result = null;
		//String id = (String)session.getAttribute("sid");
		//String id ="genie0921";	
		//serviceImpl에서 호출할 메서드
		System.out.println("87번 : "+search);
		
		if(sel == null || search == null) {
			result = pollService.getArticleList(pageNum);
		}else{
			result = pollService.getSearchArticleList(pageNum,sel,search);
		}
		//view로 전달할 데이터들
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("currentPage", result.get("currentPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("articleList", result.get("articleList"));
		model.addAttribute("count", result.get("count"));
		model.addAttribute("number", result.get("number"));
		model.addAttribute("sel", result.get("sel"));
		model.addAttribute("search", result.get("search"));
		
		return "poll/pollList";
	}
	
	//투표생성
	@RequestMapping("pollPro.cnav")
	public String pollPro(HttpSession session, PollDTO dto) throws SQLException{
		//***********임시 id
		//String id = (String)session.getAttribute("sid");
		//dto.setUserId(id);
		dto.setUserId("genie0921");
		pollService.insertArticle(dto);
		
		return "redirect:/poll/pollList.cnav";
	}
	
	//투표 하는 페이지 요청
	@RequestMapping("pollPage.cnav")
	public String content(@ModelAttribute("pageNum") String pageNum, int pollNum, Model model) throws SQLException {
		
		//고유번호 주면서 해당 글에대한 내용 받아와 view에 전달
		PollDTO article = pollService.getPollArticle(pollNum);
		model.addAttribute("article",article);
		
		
		return "poll/pollPage";
	}
	//투표하면 그값 +1 씩 
	@RequestMapping("pollRes.cnav")
	public String pollRes(HttpSession session,String pollNum,String obj_value) throws SQLException{
		System.out.println("넘어오는파라미터 an1 : "+obj_value);//ans1로 안의값이 넘어온다
		System.out.println("넘어오는파라미터 pollNum : "+pollNum);//pollNum값
		
		pollService.plusPoll(pollNum,obj_value);
		//return "poll/pollPage";
		return "poll/test88";
	}
	
	@RequestMapping("test88.cnav")
	public String test88() {
		
		return "poll/test88";
	}
	
}
