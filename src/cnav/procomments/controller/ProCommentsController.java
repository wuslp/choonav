package cnav.procomments.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cnav.procomments.dto.ProCommentsDTO;
import cnav.procomments.service.ProCommentsServiceImpl;

@Controller
@RequestMapping("/proComments/*")
public class ProCommentsController {

	@Autowired
	private ProCommentsServiceImpl proCommentsService=null;
	
	// 댓글 입력
	@RequestMapping("create.cnav")
	public String create(ProCommentsDTO dto, int proNum, Model model) throws SQLException{
		proCommentsService.create(dto);
		model.addAttribute("proNum",proNum);
		return "project/comment";
	}
	// 댓글 삭제 
	@RequestMapping("delcom.cnav")
	public String delcom(@RequestParam int proComNum, @RequestParam int proNum, Model model) throws SQLException{
		proCommentsService.delcom(proComNum);
		model.addAttribute("proNum",proNum);
		
		return "project/delcom";
		}
	
}
