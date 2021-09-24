package cnav.topic.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cnav.topcomments.dto.TopCommentsDTO;
import cnav.topcomments.service.TopCommentsServiceImpl;
import cnav.topic.dto.TopicDTO;
import cnav.topic.service.TopicServiceImpl;

@Controller
@RequestMapping("/topic/*")
public class TopicController {

	@Autowired
	private TopicServiceImpl topicService = null;
	@Autowired
	private TopCommentsServiceImpl topCommentsService = null;
	
	
	@RequestMapping("list.cnav") // list.cnav?pageNum=2 list.cnav -> 
	public String list(HttpSession session, String pageNum, String sel, String search, Model model) throws SQLException {
		// code 회사 코드에 맞게 자유게시판 글 가져오기
		String scode =(String)session.getAttribute("scode");
		
		// 해당 페이지에 맞는 화면에 뿌려줄 게시글 가져와서 view 전달 
		Map<String, Object> result = null;
		// 전체 게시글 sel search == null (검색 안한 전체 글 보여주기) 
		if(sel == null || search == null) {
			result = topicService.getArticleList(pageNum, scode);
		}else { // 검색 게시글 sel search != null
			result = topicService.getArticleSearch(pageNum, sel, search, scode);
		}
		
		// view에 전달할 데이터 보내기 
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("currentPage", result.get("currentPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("articleList", result.get("articleList"));
		model.addAttribute("count", result.get("count"));
		model.addAttribute("number", result.get("number"));
		model.addAttribute("sel", sel);
		model.addAttribute("search", search);
		
		
		return "topic/list";
	}
	
	// 글작성 Form 페이지
	@RequestMapping("writeForm.cnav")
	public String writeForm() {
		return "topic/writeForm";		
	}
	
	// 글 작성 처리 페이지
	@RequestMapping("writePro.cnav")
	public String writePro(TopicDTO dto, HttpSession session) throws SQLException {
		// code 회사 코드에 맞게 자유게시판 글 작성하기
		String scode =(String)session.getAttribute("scode");
		String sid =(String)session.getAttribute("sid");
		
		topicService.insertArticle(dto, scode, sid);
		
		return "redirect:/topic/list.cnav"; //?topNum="+ dto.getTopNum();
	}
	
	// 글 본문 페이지 요청	
	@RequestMapping("content.cnav")
	public String content(@ModelAttribute("pageNum") String pageNum, Integer topNum, Model model) throws SQLException{
		// @ModelAttribute : 가공안하고 바로 view페이지까지 넘어갈수 있음
		// 글 고유번호 주면서 해당 글에대한 내용 받아와 view에 전달
		TopicDTO article = topicService.getArticle(topNum);
		model.addAttribute("article", article);
		List<TopCommentsDTO> reply = topCommentsService.reply(topNum);
	 	model.addAttribute("reply",reply);  
		return "topic/content";
	}
	
	//글 삭제 폼 페이지
	@RequestMapping("delete.cnav")
	public String deleteForm(@RequestParam("topNum") int topNum, Model model) throws SQLException {
		topicService.deleteArticle(topNum);
		return "redirect:/topic/list.cnav";
	}
	
	// 글 수정 폼 페이지
	@RequestMapping("modifyForm.cnav")
	public String modifyForm(@RequestParam("topNum") int topNum, Model model) throws SQLException {
		model.addAttribute("article", topicService.getUpdateArticle(topNum));
		return "topic/modifyForm";
	}
	@RequestMapping("modifyPro.cnav")
	public String modifyPro(TopicDTO dto) throws SQLException {
		topicService.updateArticle(dto);
		return "redirect:/topic/content.cnav?topNum="+dto.getTopNum();
	}
	
	
	
	
}
