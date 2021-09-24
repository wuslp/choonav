package cnav.attend.controller;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cnav.attend.service.AttendServiceImpl;

@Controller
@RequestMapping("/attend/*")
public class AttendController {
	// controller -> service -> serviceImpl -> dao -> daoImpl -> sql.xml 
	@Autowired
	private AttendServiceImpl attendService=null;
	
	//페이지 로딩시 근태리스트 출력
	@RequestMapping("attend.cnav")
	public String attend(Model model,HttpSession session,String pageNum,String attcategory,String search1,String search2) throws SQLException {
		// 비지니스로직처리해당하는것이 작성된 service 의 메서드 호출 
		// -> 결과 받아올것이 있으면 서비스로부터 리턴받은것 view로 전달 
		//세션 값->service처리 
		System.out.println("77번 attend 근태리스트 출력");
		//근태기록지 체크
		int WTrecodeCheck = attendService.WTrecodeCheck();//출근시간 기록 체크
		String workTimeRecode=null;
		if(WTrecodeCheck ==1) {
			workTimeRecode = attendService.getWorktimeRecode();
			System.out.println("workTimeRecode 가져오기 :"+workTimeRecode);//확인용
		}
		int LTrecodeCheck = attendService.LTrecodeCheck();//퇴근시간기록 체크
		String leaveTimeRecode=null;
		if(LTrecodeCheck ==1) {
			leaveTimeRecode = attendService.getLeavetimeRecode();
		}
		
		Map<String, Object> result = null;
		//String id = (String)session.getAttribute("sid");
		//String code = (String)session.getAttribute("scode");
		//String auth = (String)session.getAttribute("sauth");
		//serviceImpl에서 호출할 메서드
		String pageNum1 = null;
		pageNum1=pageNum;
		String category = null;
		category =attcategory;
		String search11 = null;
		search11=search1;
		String search22 =null;
		search22 =search2;
		System.out.println("97번"+category+search11+search22);
		if(category == null & search11 == null & search22 ==null ) {
			result = attendService.attendList(pageNum1);
		}else if(category != null & search11 == null & search22 ==null){
			result = attendService.attendList2(pageNum1,category);
		}else {
			System.out.println("search1"+search11);
			System.out.println("search2"+search22);
			result = attendService.attendList3(pageNum1,category,search11,search22);
		}
		//view로 전달할 데이터들
		model.addAttribute("pageSize", result.get("pageSize"));
		model.addAttribute("pageNum", result.get("pageNum"));
		model.addAttribute("currentPage", result.get("currentPage"));
		model.addAttribute("startRow", result.get("startRow"));
		model.addAttribute("endRow", result.get("endRow"));
		model.addAttribute("userAttendList", result.get("userAttendList"));
		model.addAttribute("count", result.get("count"));
		model.addAttribute("category", result.get("category"));
		model.addAttribute("search1", result.get("search1"));
		model.addAttribute("search2", result.get("search2"));
		model.addAttribute("WTrecodeCheck", WTrecodeCheck);
		model.addAttribute("workTimeRecode", workTimeRecode);
		model.addAttribute("LTrecodeCheck", LTrecodeCheck);
		model.addAttribute("leaveTimeRecode", leaveTimeRecode);
		return "attend/attend";
		}
		
		//클릭시 출근입력
	@RequestMapping("insertTime.cnav")
	public void insertTime() throws SQLException{
		attendService.workInsert();//클릭시 출근시간 입력시키기
		
	}
		//클릭시 퇴근입력
	@RequestMapping("insertTime2.cnav")
	public void insertTime2() throws SQLException{
		attendService.workInsert2();//클릭시 퇴근시간 입력시키기
		
	}
	
	
	}