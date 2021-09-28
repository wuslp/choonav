package cnav.topcomments.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import cnav.topcomments.dto.TopCommentsDTO;
import cnav.topcomments.service.TopCommentsServiceImpl;

@Controller
//@RestController
@RequestMapping("/topComments/*") // reply -> topcomment
public class TopCommentsController { // replyController -> TopcommentController

	@Autowired
	private TopCommentsServiceImpl topCommentsService = null;
	
    
    // 댓글 입력
    @RequestMapping("insert.cnav")
    public String insert(TopCommentsDTO dto, int topNum, Model model)throws SQLException{
		/*
		 * String userId = (String) session.getAttribute("userId");
		 * dto.setUserId(userId);
		 */
        topCommentsService.insert(dto);
		/* return "redirect:/topComments/reply.cnav"; */
        model.addAttribute("topNum", topNum);
        return "topic/reply";
    }
    
    // 댓글 삭제
	@RequestMapping("delete.cnav")
	public String delete( @RequestParam int topComNum, @RequestParam int topNum, Model model) throws SQLException{
		topCommentsService.delete(topComNum, topNum);
		model.addAttribute("topNum",topNum);
		
		return "topic/replydelete";
	}
	
}
