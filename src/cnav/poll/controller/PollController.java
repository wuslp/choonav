package cnav.poll.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cnav.main.dto.CategoryDTO;
import cnav.poll.dto.PollCommentsDTO;
import cnav.poll.dto.PollDTO;
import cnav.poll.service.PollServiceImpl;

@Controller
@RequestMapping("/poll/*")
public class PollController {

	@Autowired
	private PollServiceImpl pollService=null;
	
	//투표리스트 로딩
	@RequestMapping("pollList.cnav")
	public String pollList(Model model,String pageNum, String sel, String search,String sort) throws SQLException {
		// 비지니스로직처리해당하는것이 작성된 service 의 메서드 호출 
		// -> 결과 받아올것이 있으면 서비스로부터 리턴받은것 view로 전달 
		//세션 id값->service처리 
		System.out.println("85번 sort :"+sort);
		Map<String, Object> result = null;
		//serviceImpl에서 호출할 메서드
		System.out.println("87번 : "+search);

		if(sel == null && search == null && sort == null) {
			result = pollService.getArticleList(pageNum);//전체리스트
		}else if(sel == null && search == null && sort != null) {
			result = pollService.getSortArticle(pageNum,sort);//완료 진행중
			System.out.println("sort 는 "+sort);
		}else{
			result = pollService.getSearchArticleList(pageNum,sel,search);//검색
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
		model.addAttribute("sort", result.get("sort"));
		model.addAttribute("code", result.get("code"));
		
		return "poll/pollList";
	}
	//투표폼
	@RequestMapping("pollForm.cnav")
	public String pollForm() {
		
		return "poll/pollForm";
	}
		
	//투표생성
	@RequestMapping("pollPro.cnav")
	public String pollPro(HttpSession session, PollDTO dto) throws SQLException{
		//세션에셔 회사코드 , 작성자 id 뽑아서 저장 
		String id = (String)session.getAttribute("sid");
		String code = (String)session.getAttribute("scode");
		dto.setUserId(id);
		dto.setCode(code);
		pollService.insertArticle(dto);
		
		return "redirect:/poll/pollList.cnav";
	}
	
	//투표 삭제
	@RequestMapping("pollDelete.cnav")
	@ResponseBody
	public void pollDelete(String pollNum) throws SQLException{
		pollService.pollDelete(pollNum);
		System.out.println("넘어오는 삭제 num"+pollNum);
		//return "redirect:/poll/pollList.cnav";
	}
	
	//투표 하는 페이지 요청
	@RequestMapping("pollPage.cnav")
	public String content(@ModelAttribute("pageNum") String pageNum, int pollNum, Model model,HttpSession session) throws SQLException {
		
		//고유번호 주면서 해당 글에대한 내용 받아와 view에 전달
		PollDTO article = pollService.getPollArticle(pollNum);
		//세션에서 id가져와서 중복투표방지
		//String userId = "pikapika4";
		String userId = (String)session.getAttribute("sid");
		int result = 0;
		result = pollService.recordPoll(pollNum,userId);
		//++세션에서 id 뽑아와서 그 id에 해당하는 대상 부서와 일치할때만 투표버튼 보이게
		String userIdDept=pollService.getUserDept(userId);
		System.out.println("79번 result 값 : "+result);
		System.out.println("74번 userIdDept 값 : "+userIdDept);
		List ComList= new ArrayList();
		ComList =pollService.pollCommList(pollNum);
		model.addAttribute("ComList",ComList);
		model.addAttribute("result",result);//기록있으면 1 없으면 0 
		model.addAttribute("article",article);
		model.addAttribute("userIdDept",userIdDept);
		model.addAttribute("ComList",ComList);
		
		return "poll/pollPage";
	}
	//투표하면 그값 +1 씩 
	@RequestMapping("pollRes.cnav")
	@ResponseBody
	public void pollRes(HttpSession session,String pollNum,String obj_value,Model model,HttpServletRequest request) throws SQLException{
		System.out.println("넘어오는파라미터 an1 : "+obj_value);//ans1로 안의값이 넘어온다
		System.out.println("넘어오는파라미터 pollNum : "+pollNum);//pollNum값
		PollDTO article = null;
		//String rePage;
		//String RespollNum=(String)request.getParameter("pollNum");
		//중복투표방지 , 투표시 기록 남기기 
		String userId=(String)session.getAttribute("sid");
		if(pollNum != null && obj_value != null) {//투표할떄
			pollService.plusPoll(pollNum,obj_value);//숫자 증가시켜주기
			pollService.plusPollUser(pollNum,userId);//투표한리스트에 등록하기
			//투표된 결과값도 받아와야.그값들로 결과창나타내줄 수 있다
			System.out.println("11111111111");//확인용
			//rePage="poll/pollResult";
		}else {//결과로 넘어갈때
			article = pollService.getPollArticleRes(pollNum);
			System.out.println("222222222222");//확인용
			//rePage="poll/pollResult";
		}
		model.addAttribute("article",article);
		//model.addAttribute("RespollNum",RespollNum);
		//return "poll/pollPage";
		//return rePage;
	}
	//투표결과
	@RequestMapping("pollResult")
	public String pollResult(String pollNum,Model model) throws SQLException{
		PollDTO article = null;
		article = pollService.getPollArticleRes(pollNum);
		model.addAttribute("article",article);
		return "poll/pollResult";
	}
	//댓글등록
	@RequestMapping("pollInsertComm.cnav")
	@ResponseBody
	public String pollInsertComm(PollCommentsDTO pdto) throws SQLException {
		System.out.println("코멘트단것"+pdto.getPollComment());
		System.out.println("코멘트단것"+pdto.getPollNum());
		String result =String.valueOf(pollService.pollComment(pdto));
		
		 return result;
	}
	
	//댓글 삭제하기
	@RequestMapping("commDelete.cnav")
	public ModelAndView commDelete(String pollComNum, Model model,String pollNum) throws SQLException {
		
		String pollNumber = pollNum;
		String result=null;
		System.out.println("pollComNum 넘어오냐"+pollComNum);
		result = pollService.CheckId(pollComNum);
		System.out.println(result);
		ModelAndView mav = new ModelAndView();
		if(result.equals("1")) {
			System.out.println("result 1이다");
			pollService.commDelete(pollComNum);
		}
		//뷰의경로
		mav.setViewName("poll/pollDeleteRes");
		//뷰로 넘겨줄값
		mav.addObject("result", result);
		mav.addObject("pollNum", pollNumber);
		
		return mav;
	}
	@RequestMapping("pollDeleteRes")
	public String pollDeleteRes() {
		
		return "poll/pollDeleteRes";
	}
}
