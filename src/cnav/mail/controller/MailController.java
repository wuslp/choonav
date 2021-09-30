package cnav.mail.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cnav.mail.dto.MailDTO;
import cnav.mail.service.MailServiceImpl;
import cnav.main.dto.UserDTO;


@Controller
@RequestMapping("/mail/*")
public class MailController {
	
	//contro - service - dao - sql
	
	@Autowired
	private MailServiceImpl MailService = null;
	
	// 받은 메일함
	@RequestMapping("recMailList.cnav")
	public String recMailList(HttpSession session, String pageNum, String sel, String search, Model model) throws SQLException{
		System.out.println("받은 mail list");
		String id = (String)session.getAttribute("sid");
		
		
		Map<String, Object> result = null;
		if(sel == null || search == null) {
			result = MailService.recMailList(pageNum, id); // select * from mail where id=""; 
		}else {
			result = MailService.recMailSearch(pageNum, sel, search, id);
		}
		
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("currentPage", result.get("currentPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("recMailList", result.get("recMailList"));
		model.addAttribute("count", result.get("count"));
		model.addAttribute("number", result.get("number"));
		model.addAttribute("sel", sel);
		model.addAttribute("search", search);
		
		System.out.println("sel" + sel);
		System.out.println("list" + result);
		
		
		
		return "mail/recMailList";
	}
	
	// 보낸 편지함
	@RequestMapping("sendMailList.cnav")
	public String sendMailList(HttpSession session, String pageNum, String sel, String search, Model model) throws SQLException{
		System.out.println("보낸 mail list");
		String id = (String)session.getAttribute("sid");
		
		
		Map<String, Object> result = null;
		if(sel == null || search == null) {
			result = MailService.sendMailList(pageNum, id); // select * from mail where id="";
		}else {
			result = MailService.sendMailSearch(pageNum, sel, search, id);
		}
		
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("currentPage", result.get("currentPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("sendMailList", result.get("sendMailList"));
		model.addAttribute("count", result.get("count"));
		model.addAttribute("number", result.get("number"));
		model.addAttribute("sel", sel);
		model.addAttribute("search", search);
		
		System.out.println("list" + result);
		
		
		
		return "mail/sendMailList";
	}
	
	// 메일 보내기
	@RequestMapping("writeMailForm.cnav")
	public String writeMailForm(HttpSession session, Model model) throws SQLException {
		String code = (String)session.getAttribute("scode");
		String id = (String)session.getAttribute("sid");
		List<UserDTO> userList = MailService.userList(code, id);
		model.addAttribute("userList", userList);
		System.out.println("userList name" + userList);
		
		
		return "mail/writeMailForm";
	}
	
	// 메일 보내기 처리
	@RequestMapping("writeMailPro.cnav")
	public String writeMailPro(HttpSession session, MailDTO dto, Model model) throws SQLException, IOException {
		String id = (String)session.getAttribute("sid");
		System.out.println("보내기가 전혀 안돼?");
		
		dto.setUserId(id);
		// 파일 업로드 처리
		String fileName=null;
		MultipartFile uploadFile = dto.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			// UUID uuid = UUID.randomUUID();	//UUID 구하기
			fileName=(originalFileName.replace("."+ext, ""))+"."+ext;
			uploadFile.transferTo(new File("C:\\upload\\" + fileName));
		}
		dto.setFileName(fileName);
		
		int result = MailService.insertMail(dto);
		model.addAttribute("result", result);
		
		return "mail/writeMailPro";
	}
	
	// 편지함 선택해서 게시물 삭제
	@RequestMapping("/deleteMailForm")
	@ResponseBody
	public String ajaxTest(HttpServletRequest request, HttpSession session) throws SQLException {
		String id = (String)session.getAttribute("sid");
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		String result = null;
		System.out.println("size" + size);
		for(int i = 0; i<size; i++) {
			result = String.valueOf(MailService.delete(ajaxMsg[i], id));
		}
		return result;
	}
	
	// 편지 내용에서 삭제
	@RequestMapping("/deleteForm")
	public String delete(@RequestParam("num")int num, HttpSession session) throws SQLException {
		String id = (String)session.getAttribute("sid");
		int count1 = MailService.deleteRecMail(num, id);
		int count2 = MailService.deleteSendMail(num, id);
		String page = "";
		
		if(count1 == 1) {
			page = "redirect:/mail/recMailList.cnav";
			System.out.println("count1 됨");
		}else if(count2 == 1) {
			page = "redirect:/mail/sendMailList.cnav";
			System.out.println("count2 됨");
		}else {
			System.out.println("삭제 안됨");
		}
		
		return page;
	}
	
	// 받은 편지 보기
	@RequestMapping("mail.cnav")
	public String recMail(@ModelAttribute("pageNum") String pageNum, Integer num, HttpSession session, Model model) throws SQLException{
		String id = (String)session.getAttribute("sid");
		MailDTO mail = MailService.getMail(num, id);
		model.addAttribute("mail", mail);
		model.addAttribute("id", id);
		
		return "mail/mail";
	}
	
	// File 다운로드
	@RequestMapping("mailFileDown.cnav")
	public void filedown(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String filename = request.getParameter("fileName");
		String realFilename = "";
		System.out.println("realFileName== " + filename);
		
		try {
			String browser = request.getHeader("User-Agent");
			// 파일 인코딩
			if(browser.contains("MSIE") || browser.contains("Trident")
					|| browser.contains("Chrome")) {
				//filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
				System.out.println("여기파일네임은뭐야?if야" + filename);
			}else {
				filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
				System.out.println("여기파일네임은뭐야?else야" + filename);
			}
			
		}catch(UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException");
		}
		realFilename = "C:\\upload\\" + filename;
		System.out.println("다시!! filename" + filename);
		System.out.println("다시!! realFilename" + realFilename);
		File file1 = new File(realFilename);
		if(!file1.exists()) {
			return ;
		}
		
		// 파일명 지정
		response.setContentType("application/octer-stream");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
		
		try {
			OutputStream os = response.getOutputStream();
			FileInputStream fis = new FileInputStream(realFilename);
			
			int ncount = 0;
			byte[] bytes = new byte[512];
			
			while((ncount = fis.read(bytes)) != -1) {
				os.write(bytes, 0, ncount);
			}
			fis.close();
			os.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// RE 메일 보내기
	@RequestMapping("redirectMail.cnav")
	public String reMail(HttpSession session, Model model, @RequestParam("mailRid") String rid, @RequestParam("ridName") String rName) throws SQLException {
		System.out.println("================" + rid);
		System.out.println("================" + rName);
		String code = (String)session.getAttribute("scode");
		String id = (String)session.getAttribute("sid");
		
		model.addAttribute("rid", rid);
		model.addAttribute("rName", rName);
		
		
		return "mail/redirectMail";
	}
	
	
	
}
