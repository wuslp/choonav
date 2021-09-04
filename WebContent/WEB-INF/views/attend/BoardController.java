package spring.board.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.board.dto.BoardDTO;
import spring.board.service.BoardServiceImpl;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	//controller에서는 -> serviceImpl에있는 메서드로 일 시킬 것임으로 BoardServiceImpl 자동주입
	@Autowired
	private BoardServiceImpl boardService = null;
	
	
	@RequestMapping("list.do")	//list.do?pageNum=2 list.do=>pageNum=1
	public String list(String pageNum, Model model, String sel, String search) throws Exception {
		///해당 페이지에 맞는 화면에 뿌려줄 게시글 가져와서 view로 전달해 주기
		Map<String, Object> result = null;
		//전체 게시글 sel search ==null
		if(sel == null ||search ==null) {
			result = boardService.getArticleList(pageNum);
		}else{//검색 게시글	sel search !=null
			result = boardService.getArticleSearch(pageNum, sel, search);
		}
		
		
		//view에 전달할 데이터 보내기
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
		
		return "board/list";
	}
	
	
	/* 0811 @PostMapping 해줘도됨 */
	//글작성 폼페이지
	@RequestMapping("writeForm.do")
	public String writeForm(HttpServletRequest request, Model model) {
		int num = 0 , ref = 0, re_step=0, re_level =0;
		if(request.getParameter("num") != null) {//넘어온 파라미터중 num으로 새글작성인지 답글작성인지 판단
			//정보담기
			num = Integer.parseInt(request.getParameter("num"));
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
		}
		model.addAttribute("num",num);
		model.addAttribute("ref",ref);
		model.addAttribute("re_step",re_step);
		model.addAttribute("re_level",re_level);
		model.addAttribute("id","java");//임시 테스트용, 추후 session으로 처리하면되니 삭제하기
		
		
		return "board/writeForm";
	}
	
	//글 작성 Pro 페이지
	@RequestMapping("writePro.do")
	public String writePro(BoardDTO dto) throws SQLException{
		
		dto.setWriter("java");//나중에 session 에서 id꺼내 추가로 변경하기
		boardService.insertArticle(dto);
		
		return "redirect:/board/list.do";
	}
	
	//글 본문 페이지 요청
	@RequestMapping("content.do")
	public String content(@ModelAttribute("pageNum") String pageNum, int num, Model model) throws SQLException {
		
		//고유번호 주면서 해당 글에대한 내용 받아와 view에 전달
		BoardDTO article = boardService.getArticle(num);
		model.addAttribute("article",article);
		
		
		return "board/content";
	}
	
	
}
