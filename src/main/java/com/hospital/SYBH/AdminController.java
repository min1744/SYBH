package com.hospital.SYBH;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hospital.admin.AccessInfoVO;
import com.hospital.admin.AccessVO;
import com.hospital.admin.AdminService;
import com.hospital.board.BoardVO;
import com.hospital.member.MemberVO;
import com.hospital.member.unserviceability.UnserviceabilityVO;
import com.hospital.notice.NoticeService;
import com.hospital.notice.NoticeVO;
import com.hospital.util.PageMaker;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Inject
	private AdminService adminService;
	@Inject
	private NoticeService noticeService;
	
	@RequestMapping(value = "adminIndex", method = RequestMethod.GET)
	public ModelAndView index(ModelAndView mv) throws Exception {
		HashMap<String, Object> map = adminService.getData();
		mv.addObject("allMemberCount", (Integer)map.get("allMemberCount"));
		mv.addObject("allDoctorCount", (Integer)map.get("allDoctorCount"));
		mv.addObject("allAdminCount", (Integer)map.get("allAdminCount"));
		mv.addObject("earnings", (String)map.get("earnings"));
		mv.addObject("earningsNum", (Long)map.get("earningsNum"));
		mv.addObject("access_count", (Integer)map.get("access_count"));
		mv.addObject("donations", (String)map.get("donations"));
		mv.addObject("monthData", (int [])map.get("monthMembershipData"));
		mv.setViewName("admin/adminIndex");
		
		return mv;
	}
	
	
	@RequestMapping(value = "memberNormal", method = RequestMethod.GET)
	public ModelAndView memberNomal(ModelAndView mv) throws Exception {
		List<MemberVO> list = adminService.getMemberList();
		mv.addObject("list", list);
		mv.addObject("variety", "normal");
		mv.setViewName("admin/memberManagement");
		
		return mv;
	}
	
	@RequestMapping(value = "memberUpgrade", method = RequestMethod.POST)
	public ModelAndView memberUpgrade(String [] id, ModelAndView mv) throws Exception {
		int result = adminService.setUpgrade(id);
		mv.addObject("result", result);
		mv.setViewName("common/message");
		
		return mv;
	}

	@RequestMapping(value = "memberDowngrade", method = RequestMethod.POST)
	public ModelAndView memberDowngrade(String [] id, ModelAndView mv) throws Exception {
		int result = adminService.setDowngrade(id);
		mv.addObject("result", result);
		mv.setViewName("common/message");
		
		return mv;
	}
	
	@RequestMapping(value = "memberDeletes", method = RequestMethod.POST)
	public ModelAndView memberDeletes(String [] id, ModelAndView mv) throws Exception {
		int result = adminService.setDelete(id);
		mv.addObject("result", result);
		mv.setViewName("common/message");
		
		return mv;
	}
	
	@RequestMapping(value = "memberUnserviceability", method = RequestMethod.GET)
	public ModelAndView memberUnserviceability(ModelAndView mv) throws Exception {
		List<UnserviceabilityVO> list = adminService.getUnserviceabilityList();
		mv.addObject("list", list);
		mv.addObject("variety", "unserviceability");
		mv.setViewName("admin/memberManagement");
		
		return mv;
	}
	
	@RequestMapping(value = "setUnserviceability", method = RequestMethod.POST)
	public ModelAndView setUnserviceability(String [] id, ModelAndView mv) throws Exception {
		int result = adminService.setUnserviceability(id);
		mv.addObject("result", result);
		mv.setViewName("common/message");
		
		return mv;
	}
	
	@RequestMapping(value = "memberDeleteUnserviceability", method = RequestMethod.POST)
	public ModelAndView memberDeleteUnserviceability(String [] id, ModelAndView mv) throws Exception {
		int result = adminService.setDeleteUnserviceability(id);
		mv.addObject("result", result);
		mv.setViewName("common/message");
		
		return mv;
	}
	
	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public ModelAndView noticeList(PageMaker pageMaker, ModelAndView mv) throws Exception{
		HashMap<String, List> map = adminService.getNoticeList(pageMaker);
		if(map != null) {
			mv.addObject("board", "notice");
			mv.addObject("list", map.get("list"));
			mv.addObject("fixedList", map.get("fixedList"));
			mv.setViewName("admin/board/boardList");
		} else {
			mv.addObject("message", "데이터가 없습니다.");
			mv.addObject("path", "./adminIndex");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}

	/*재혁 작업 */
	@RequestMapping(value = "noticeSelect",method = RequestMethod.GET)
	public ModelAndView getNoticeSelect(int num) throws Exception{
		ModelAndView mv = new ModelAndView();
		BoardVO boardVO = adminService.getNoticeSelect(num);
		if(boardVO != null) {
		mv.addObject("board","notice");
		mv.addObject("vo",boardVO);
		mv.setViewName("admin/board/boardSelect");
		}else {
			mv.addObject("message", "데이터가 없습니다.");
			mv.addObject("path", "./adminIndex");
			mv.setViewName("common/messageMove");
		}
		return mv;
	}
	//notice Write
	@RequestMapping(value = "noticeWrite",method = RequestMethod.GET)
	public ModelAndView setNoticeWrite() throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = noticeService.fixCount();
		mv.addObject("result",result);
		mv.addObject("board","notice");
		mv.setViewName("admin/board/boardWrite");
		return mv;
	}
	@RequestMapping(value ="noticeWrite",method = RequestMethod.POST)
	public ModelAndView setNoticeWrite(NoticeVO noticeVO,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = noticeService.setWrite(noticeVO, session);
		if(result>0) {
			mv.setViewName("redirect:./noticeList");
		}else {
			mv.addObject("message","Write Fail");
			mv.addObject("path","./noticeList");
			mv.setViewName("common/messageMove");
		}
		return mv;
	}
	
	//notice update
	@RequestMapping(value = "noticeUpdate",method = RequestMethod.GET)
	public ModelAndView setUpdate(int num)throws Exception{
		ModelAndView mv = new ModelAndView();
		NoticeVO noticeVO = noticeService.getSelect(num);
		int result = noticeService.fixCount();
		if(noticeVO != null) {
			mv.addObject("board","notice");
			mv.addObject("vo",noticeVO);
			mv.addObject("result", result);
			mv.setViewName("admin/board/boardUpdate");
		}else {
			mv.addObject("message","No data");
			mv.addObject("path","./noticeList");
			mv.setViewName("common/messageMove");
		}
		return mv;
	}
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(NoticeVO noticeVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = noticeService.setUpdate(noticeVO);
		if(result>0) {
		mv.setViewName("redirect:./noticeList");
		}else {
			mv.addObject("message","Update Fail");
			mv.addObject("path","./noticeList");
			mv.setViewName("common/messageMove");
		}
		return mv;
	}
	//한개씩 삭제
	@RequestMapping(value = "noticeDelete", method = RequestMethod.POST)
	@ResponseBody
	public int setDelete(int num,HttpSession session)throws Exception{
		return noticeService.setDelete(num, session);
	}
	//여러개 삭제
	@RequestMapping(value = "noticeListDelete",method = RequestMethod.POST)
	@ResponseBody
	public int noticeListDelete(Integer [] num) throws Exception{
		return noticeService.setDelete(num);
		
	}
	
	/*재혁 작업 끝	*/
	
	
	
	@RequestMapping(value = "memberAccessInfo", method = RequestMethod.GET)
	public ModelAndView memberAccessInfo(ModelAndView mv) throws Exception {
		List<AccessInfoVO> list = adminService.getAccessInfoList();
		mv.addObject("list", list);
		mv.addObject("variety", "accessinfo");
		mv.setViewName("admin/memberManagement");
		
		return mv;
	}
	
	@RequestMapping(value = "getMemberData", method = RequestMethod.GET)
	public ModelAndView getMemberData(ModelAndView mv) throws Exception {
		List<Integer> result = adminService.getMemberData();
		mv.addObject("result", result);
		mv.setViewName("common/message");
		
		return mv;
	}
	
	@RequestMapping(value = "getEarningsData", method = RequestMethod.GET)
	public ModelAndView getEarningsData(ModelAndView mv) throws Exception {
		List<Long> result = adminService.getEarningsData();
		mv.addObject("result", result);
		mv.setViewName("common/message");
		
		return mv;
	}
	
	@RequestMapping(value = "getVisitorsData", method = RequestMethod.GET)
	public ModelAndView getVisitorsData(ModelAndView mv) throws Exception {
		List<Integer> result = adminService.getVisitorsData();
		mv.addObject("result", result);
		mv.setViewName("common/message");
		
		return mv;
	}
}