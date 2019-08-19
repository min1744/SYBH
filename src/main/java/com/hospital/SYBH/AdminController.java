package com.hospital.SYBH;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.hospital.admin.AccessInfoVO;
import com.hospital.admin.AccessVO;
import com.hospital.admin.AdminService;
import com.hospital.board.BoardVO;
import com.hospital.checkup.CheckUpDAO;
import com.hospital.checkup.CheckUpService;
import com.hospital.checkup.CheckUpVO;
import com.hospital.medicalTeam.MedicalTeamService;
import com.hospital.medicalTeam.MedicalTeamVO;
import com.hospital.member.MemberVO;
import com.hospital.member.unserviceability.UnserviceabilityVO;
import com.hospital.notice.NoticeService;
import com.hospital.notice.NoticeVO;
import com.hospital.treatbreakdown.TreatBreakDownService;
import com.hospital.treatbreakdown.TreatBreakDownVO;
import com.hospital.util.PageMaker;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Inject
	private AdminService adminService;
	@Inject
	private NoticeService noticeService;
	@Inject
	private MedicalTeamService medicalTeamService;
	@Inject
	private TreatBreakDownService treatBreakDownService;
	@Inject
	private CheckUpService checkUpService;
	
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
		mv.addObject("annualMemberCount", (Integer)map.get("annualMemberCount"));
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
			mv.addObject("path", "./noticeList");
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
	
	//의사
	//의사리스트
	@RequestMapping(value = "medicalList",method = RequestMethod.GET)
	public ModelAndView medicalList(PageMaker pageMaker) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<MedicalTeamVO> list =  medicalTeamService.getMedicalList(pageMaker);
		mv.addObject("list", list);
		mv.addObject("pager",pageMaker);
		mv.setViewName("admin/medical/medicalList");
		return mv;
	}
	
	//의사 select
	@RequestMapping(value = "medicalSelect", method = RequestMethod.GET)
	public ModelAndView medicalSelect(int num) throws Exception{
		ModelAndView mv = new ModelAndView();
		MedicalTeamVO medicalTeamVO = new MedicalTeamVO();
		medicalTeamVO = medicalTeamService.getMedicalSelect(num);
		if(medicalTeamVO != null) {
			mv.addObject("vo",medicalTeamVO);
			mv.setViewName("admin/medical/medicalSelect");
			}else {
				mv.addObject("message", "데이터가 없습니다.");
				mv.addObject("path", "./medicalList");
				mv.setViewName("common/messageMove");
			}
		return mv;
	}
	//의사 write
	@RequestMapping(value="medicalWrite", method = RequestMethod.GET)
	public String medicalWrite() throws Exception{
		return "admin/medical/medicalWrite";
	}
	
	@RequestMapping(value = "medicalWrite", method = RequestMethod.POST)
	public ModelAndView medicalWrite(MedicalTeamVO medicalTeamVO,HttpSession session, MultipartFile multipartFile) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = medicalTeamService.setWrite(medicalTeamVO, session, multipartFile);
		if(result>0) {
			mv.setViewName("redirect:./medicalList");
		}else {
			mv.addObject("message", "Write Fail");
			mv.addObject("path", "./medicalList");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	//의사 delete 여러개 삭제
	@RequestMapping(value = "medicalListDelete",method = RequestMethod.POST)
	@ResponseBody
	public int medicalListDelete(Integer [] num) throws Exception{
		return medicalTeamService.setDelete(num);
		
	}
	
	//한개씩 삭제
		@RequestMapping(value = "medicalDelete", method = RequestMethod.POST)
		@ResponseBody
		public int medicalDelete(int num,HttpSession session)throws Exception{
			return medicalTeamService.setDelete(num,session);
		}
	//업뎃
	@RequestMapping(value = "medicalUpdate",method = RequestMethod.GET)
	public ModelAndView medicalUpdate(int num)throws Exception{
		ModelAndView mv = new ModelAndView();
		MedicalTeamVO medicalTeamVO = new MedicalTeamVO();
		medicalTeamVO = medicalTeamService.getMedicalSelect(num);
		if(medicalTeamVO != null) {
			mv.addObject("vo",medicalTeamVO);
			mv.setViewName("admin/medical/medicalUpdate");
		}else {
			mv.addObject("message", "데이터가 없습니다.");
			mv.addObject("path", "./medicalList");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "medicalUpdate", method = RequestMethod.POST)
	public ModelAndView medicalUpdate(MedicalTeamVO medicalTeamVO,MultipartFile multipartFile, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = medicalTeamService.setUpdate(medicalTeamVO,multipartFile,session);
		if(result>0) {
			mv.setViewName("redirect:./medicalList");
		}else {
			mv.addObject("message", "Update Fail");
			mv.addObject("path", "./medicalList");
			mv.setViewName("common/messageMove");
		}
		return mv;
	}
	//관리자 일반진료
	@RequestMapping(value = "adminNormal", method = RequestMethod.GET)
	public ModelAndView adminNormal(PageMaker pageMaker)throws Exception{
		ModelAndView mv = new ModelAndView();
		int count = treatBreakDownService.getAllTotalCount();
		List<TreatBreakDownVO> list = treatBreakDownService.getAllList(pageMaker);
		
		mv.setViewName("admin/reserve/reserve");
		mv.addObject("board","Normal");
		mv.addObject("list",list);
		mv.addObject("pager",pageMaker);
		mv.addObject("count",count);
		
		
		
		return mv;
	}
	
	//관리자 건강검진
	@RequestMapping(value = "adminCheckUp", method = RequestMethod.GET)
	public ModelAndView adminCheckUp(PageMaker pageMaker)throws Exception{
		ModelAndView mv = new ModelAndView();
		int count = checkUpService.getAllTotalCount();
		List<CheckUpVO> list = checkUpService.getAllList(pageMaker);
		
		mv.addObject("list",list);
		mv.addObject("pager",pageMaker);
		mv.addObject("board","Medical");
		mv.setViewName("admin/reserve/reserve");
		mv.addObject("count",count);
		
		return mv;
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
	
	@RequestMapping(value = "downloadGenerateReport", method = RequestMethod.GET)
	public String jsPDF() throws Exception{
		return "common/jsPDF";
	}
}