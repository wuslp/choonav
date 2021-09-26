package cnav.notice.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cnav.notice.dto.NoticeDTO;
import cnav.notice.service.NoticeServiceImpl;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Autowired
	private NoticeServiceImpl noticeService = null;
	
	@RequestMapping("list.cnav") // list.cnav?pageNum=2 list.cnav -> 
	public String list(HttpSession session, String pageNum, String sel, String search, Model model) throws SQLException {
		// code 회사 코드에 맞게 공지사항 글 가져오기
		String scode =(String)session.getAttribute("scode");
		
		// 해당 페이지에 맞는 화면에 뿌려줄 게시글 가져와서 view 전달 
		Map<String, Object> result = null;
		// 전체 게시글 sel search == null (검색 안한 전체 글 보여주기) 
		if(sel == null || search == null) {
			result = noticeService.getArticleList(pageNum,scode);
		}else { // 검색 게시글 sel search != null
			result = noticeService.getArticleSearch(pageNum, sel, search,scode);
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
		
		
		return "notice/list";
	}
	
	// 글작성 Form 페이지
	@RequestMapping("writeForm.cnav")
	public String writeForm() {
		return "notice/writeForm";		
	}
	
	// 글 작성 처리 페이지
	@RequestMapping("writePro.cnav")
	public String writePro(NoticeDTO dto, HttpSession session) throws SQLException {
		// code 회사 코드에 맞게 공지사항 글 작성하기
		String scode =(String)session.getAttribute("scode");
		String sid =(String)session.getAttribute("sid");
		
		noticeService.insertArticle(dto, scode, sid);
		
		return "redirect:/notice/list.cnav"; //?notiNum="+ dto.getNotiNum();
	}
	
	// 글 본문 페이지 요청	
	@RequestMapping("content.cnav")
	public String content(@ModelAttribute("pageNum") String pageNum, Integer notiNum, Model model) throws SQLException{
		// @ModelAttribute : 가공안하고 바로 view페이지까지 넘어갈수 있음
		// 글 고유번호 주면서 해당 글에대한 내용 받아와 view에 전달
		NoticeDTO article = noticeService.getArticle(notiNum);
		model.addAttribute("article", article);
		
		return "notice/content";
	}
	
	//글 삭제 폼 페이지
	@RequestMapping("delete.cnav")
	public String deleteForm(@RequestParam("notiNum") int notiNum, Model model) throws SQLException {
		noticeService.deleteArticle(notiNum);
		return "redirect:/notice/list.cnav";
	}
	
	// 글 수정 폼 페이지
	@RequestMapping("modifyForm.cnav")
	public String modifyForm(@RequestParam("notiNum") int notiNum, Model model) throws SQLException {
		model.addAttribute("article", noticeService.getUpdateArticle(notiNum));
		return "notice/modifyForm";
	}
	@RequestMapping("modifyPro.cnav")
	public String modifyPro(NoticeDTO dto) throws SQLException {
		noticeService.updateArticle(dto);
		return "redirect:/notice/content.cnav?notiNum="+dto.getNotiNum();
	}
	
	
	
	
}
