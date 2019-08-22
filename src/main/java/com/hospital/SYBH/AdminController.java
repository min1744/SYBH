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
import com.hospital.community.CommunityService;
import com.hospital.community.CommunityVO;
import com.hospital.community.comments.CommunityCommentsService;
import com.hospital.medicalTeam.MedicalTeamService;
import com.hospital.medicalTeam.MedicalTeamVO;
import com.hospital.member.MemberVO;
import com.hospital.member.unserviceability.UnserviceabilityVO;
import com.hospital.news.NewsService;
import com.hospital.news.NewsVO;
import com.hospital.news.comments.NewsCommentsService;
import com.hospital.notice.NoticeService;
import com.hospital.notice.NoticeVO;
import com.hospital.pay.PayService;
import com.hospital.pay.PayVO;
import com.hospital.qna.QnAService;
import com.hospital.qna.QnAVO;
import com.hospital.qna.comments.QnACommentsService;
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
	@Inject
	private PayService payService;
	@Inject
	private NewsService newsService;
	@Inject
	private NewsCommentsService newsCommentsService;
	@Inject
	private QnAService qnaService;
	@Inject
	private QnACommentsService qnACommentsService;
	@Inject
	private CommunityService communityService;
	@Inject
	private CommunityCommentsService communityCommentsService;
	
	
	@RequestMapping(value = "adminIndex", method = RequestMethod.GET)
	public ModelAndView index(ModelAndView mv) throws Exception {
		HashMap<String, Object> map = adminService.getData();
		mv.addAllObjects(map);
		mv.addObject("monthData", (int [])map.get("monthMembershipData"));
		mv.setViewName("admin/adminIndex");
		
		return mv;
	}
	
	
	@RequestMapping(value = "memberNormal", method = RequestMethod.GET)
	public ModelAndView memberNomal(ModelAndView mv, HttpSession session) throws Exception {
		List<MemberVO> list = adminService.getMemberList(session);
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
	/*재혁 작업 */
	
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

	//관리자용 후원 리스트
	@RequestMapping(value = "adminDonation", method = RequestMethod.GET)
	public ModelAndView donationList(PageMaker pageMaker,PayVO payVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		payVO.setCategory(1);
		List<PayVO> list = payService.adminDonation(pageMaker, payVO);
		//후원 금액
		int total = payService.getDonationTotal();
		//후원인 총 인원
		int people = payService.getDonationPeopleTotal();
		mv.addObject("total",total);
		mv.addObject("people",people);
		mv.addObject("list",list);
		mv.addObject("pager",pageMaker);
		mv.setViewName("admin/pay/payList");
		return mv;
		
	}
	
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
	
	
	
	
	///////////////////////////////뉴스 CRUD/////////////////////////
	
	//////////////////뉴스 공통 메소드////////
	//공통 Delete 여러개 삭제
	@RequestMapping(value = "newsListDelete",method = RequestMethod.POST)
	@ResponseBody
	public int newsListDelete(Integer [] num) throws Exception{
		return newsService.setDelete(num);
		
	}
	
	//공통 Delete한개씩 삭제
	@RequestMapping(value = "newsDelete", method = RequestMethod.POST)
	@ResponseBody
	public int newsDelete(int num,HttpSession session)throws Exception{
		return newsService.setDelete(num,session);
	}
	
	//공통 Write post
	@RequestMapping(value = "newsWrite", method = RequestMethod.POST)
	public ModelAndView setWrite(NewsVO newsVO,HttpSession session,MultipartFile multipartFile)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		int result = newsService.setWrite(newsVO, session, multipartFile);
		if(result > 0 && newsVO.getMenu().equals("disease")) {
			mv.setViewName("redirect:./disease");
		}else if(result > 0 && newsVO.getMenu().equals("nutrition")) {
			mv.setViewName("redirect:./nutrition");
		}else if(result > 0 && newsVO.getMenu().equals("exercise")) {
			mv.setViewName("redirect:./exercise");
		}else {
			mv.addObject("message", "Write Fail");
			mv.addObject("path", "./disease");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	//공통 Update Post
	@RequestMapping(value = "newsUpdate", method = RequestMethod.POST)
	public ModelAndView setUpdate(NewsVO newsVO,HttpSession session, MultipartFile multipartFile)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = newsService.setUpdate(newsVO,session,multipartFile);
		if(result > 0 && newsVO.getMenu().equals("disease")) {
			mv.setViewName("redirect:./disease");
		}else if(result > 0 && newsVO.getMenu().equals("nutrition")) {
			mv.setViewName("redirect:./nutrition");
		}else if(result > 0 && newsVO.getMenu().equals("exercise")) {
			mv.setViewName("redirect:./exercise");
		} else {
			mv.addObject("message", "Write Fail");
			mv.addObject("path", "./disease");
			mv.setViewName("common/messageMove");
		}
		
		return mv;
	}
	
	
	////////////////질환정보 ////////////////
	////List
	@RequestMapping(value = "disease", method = RequestMethod.GET)
	public ModelAndView getList(PageMaker pageMaker,String menu) throws Exception {
		menu = "disease";
		List<NewsVO> list = newsService.getNewsList(pageMaker, menu);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.addObject("menu","disease");
		mv.setViewName("admin/board/news/newsList");
		mv.addObject("pager",pageMaker);
		return mv;
	}
	//select
		@RequestMapping(value = "diseaseSelect", method = RequestMethod.GET)
		public ModelAndView diseaseSelect(int num) throws Exception {
		
			ModelAndView mv = new ModelAndView();
			NewsVO newsVO = newsService.getSelect(num);
			int totalCount = newsCommentsService.getTotalCount(num);
			
			mv.addObject("totalCount", totalCount);
			mv.addObject("vo", newsVO);
			mv.addObject("menu", "disease");
			mv.setViewName("admin/board/news/newsSelect");
			return mv;
		}
	
	//write
		@RequestMapping(value = "diseaseWrite", method = RequestMethod.GET)
		public ModelAndView dieaseWrite() throws Exception {
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("menu", "disease");
			mv.setViewName("admin/board/news/newsWrite");
			return mv;
		}
		//update
		@RequestMapping(value = "diseaseUpdate", method = RequestMethod.GET)
		public ModelAndView diseaseUpdate(int num) throws Exception {
			ModelAndView mv = new ModelAndView();
			NewsVO newsVO= newsService.getSelect(num);
			mv.addObject("newsVO", newsVO);
			mv.addObject("menu", "disease");
			mv.setViewName("admin/board/news/newsUpdate");
			return mv;
		}
		
	
	///////////////영양정보///////////////
	////List
	@RequestMapping(value = "nutrition", method = RequestMethod.GET)
	public ModelAndView nutritionList(PageMaker pageMaker,String menu,String search) throws Exception {
		
		menu = "nutrition";
		List<NewsVO> list=newsService.getNewsList(pageMaker, menu);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.addObject("pager", pageMaker);
		mv.addObject("menu","nutrition");
		mv.setViewName("admin/board/news/newsList");
		return mv;
	}
	
	//select 
	@RequestMapping(value = "nutritionSelect",method = RequestMethod.GET)
	public ModelAndView nutritionSelect(int num) throws Exception{
		ModelAndView mv = new ModelAndView();
		NewsVO newsVO = newsService.getSelect(num);
		int totalCount = newsCommentsService.getTotalCount(num);
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("vo", newsVO);
		mv.addObject("menu", "nutrition");
		mv.setViewName("admin/board/news/newsSelect");
		return mv;
	}
	
	//write
		@RequestMapping(value = "nutritionWrite", method = RequestMethod.GET)
		public ModelAndView nutritionWrite() throws Exception {
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("menu", "nutrition");
			mv.setViewName("admin/board/news/newsWrite");
			return mv;
		}
	//update
		@RequestMapping(value = "nutritionUpdate", method = RequestMethod.GET)
		public ModelAndView nutritionUpdate(int num) throws Exception {
			ModelAndView mv = new ModelAndView();
			NewsVO newsVO= newsService.getSelect(num);
			mv.addObject("newsVO", newsVO);
			mv.addObject("menu", "nutrition");
			mv.setViewName("admin/board/news/newsUpdate");
			return mv;
		}
	
	/////////////////////////운동정보//////////////////
	//list
	@RequestMapping(value = "exercise", method = RequestMethod.GET)
	public ModelAndView exerciseList(PageMaker pageMaker,String menu) throws Exception {
	
	menu = "exercise";
	List<NewsVO> list=newsService.getNewsList(pageMaker, menu);
	ModelAndView mv = new ModelAndView();
	mv.addObject("list",list);
	mv.addObject("pager", pageMaker);
	mv.addObject("menu","exercise");
	mv.setViewName("admin/board/news/newsList");
	return mv;
	}
	
	
	//select 
	@RequestMapping(value = "exerciseSelect",method = RequestMethod.GET)
	public ModelAndView exerciseSelect(int num) throws Exception{
		ModelAndView mv = new ModelAndView();
		NewsVO newsVO = newsService.getSelect(num);
		int totalCount = newsCommentsService.getTotalCount(num);
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("vo", newsVO);
		mv.addObject("menu", "exercise");
		mv.setViewName("admin/board/news/newsSelect");
		return mv;
	}
	
	//write
		@RequestMapping(value = "exerciseWrite", method = RequestMethod.GET)
		public ModelAndView exerciseWrite() throws Exception {
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("menu", "exercise");
			mv.setViewName("admin/board/news/newsWrite");
			return mv;
		}
	//update
		@RequestMapping(value = "exerciseUpdate", method = RequestMethod.GET)
		public ModelAndView exerciseUpdate(int num) throws Exception {
			ModelAndView mv = new ModelAndView();
			NewsVO newsVO= newsService.getSelect(num);
			mv.addObject("newsVO", newsVO);
			mv.addObject("menu", "exercise");
			mv.setViewName("admin/board/news/newsUpdate");
			return mv;
		}
		
	//////////////////////////QNA///////////////////////////////
		//////////////공통 Write - post
	@RequestMapping(value = "qnaWrite", method = RequestMethod.POST)
	public ModelAndView setWrite(QnAVO qnaVO, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.setWrite(qnaVO, session);
		if(result > 0 && qnaVO.getMenu().equals("complaint")) {
			mv.setViewName("redirect:./complaint");
			
		} else if(result > 0 && qnaVO.getMenu().equals("praise")){
			mv.setViewName("redirect:./praise");
		} else if(result > 0 && qnaVO.getMenu().equals("qna")){
			mv.setViewName("redirect:./qna");
		} else {
			mv.addObject("message", "Write Fail");
			mv.addObject("path", "./complaint");
			mv.setViewName("common/messageMove");
		}
		mv.addObject("board","qna");
		
		return mv;
	}
	
	/////////////// 공통 update - post
	//update - POST
	@RequestMapping(value = "qnaUpdate", method = RequestMethod.POST)
	public ModelAndView qnaUpdate(QnAVO qnaVO) throws Exception {
		
	ModelAndView mv = new ModelAndView();
	int result = qnaService.setUpdate(qnaVO);
	if(result > 0 && qnaVO.getMenu().equals("complaint")) {
		mv.setViewName("redirect:./complaint");
	} else if(result > 0 && qnaVO.getMenu().equals("praise")){
		mv.setViewName("redirect:./praise");
	} else if(result > 0 && qnaVO.getMenu().equals("qna")){
		mv.setViewName("redirect:./qna");
	} else {
		mv.addObject("message", "Update Fail");
		mv.addObject("path", "./complaint");
		mv.setViewName("common/messageMove");
	}
	mv.addObject("board","qna");
	return mv;
	}
	
	//////////////////공통 reply - post
	//reply
	
	//reply - post
	@RequestMapping(value = "qnaReply", method = RequestMethod.POST)
	public ModelAndView setReply(QnAVO qnaVO) throws Exception {
	
	ModelAndView mv = new ModelAndView();
	int result = qnaService.setReply(qnaVO);
	
	if(result > 0 && qnaVO.getMenu().equals("complaint")) {
	mv.setViewName("redirect:./complaint");
	} else if(result > 0 && qnaVO.getMenu().equals("praise")){
	mv.setViewName("redirect:./praise");
	} else if(result > 0 && qnaVO.getMenu().equals("qna")){
	mv.setViewName("redirect:./qna");
	} else {
	mv.addObject("message", "Reply Fail");
	mv.addObject("path", "./complaint");
	mv.setViewName("common/messageMove");
	}
	mv.addObject("board","qna");
	return mv;
	}
	
	//////////////////원본 글 공통 delete
	/////////관리자 삭제
	@RequestMapping(value = "qnaAdminDelete",method = RequestMethod.POST)
	@ResponseBody
	public int qnaAdminDelete(QnAVO qnAVO,int ref, HttpSession session)throws Exception{
		int result = qnaService.setDelete(ref, session);
		return result;
	}
	@RequestMapping(value ="replyAdminDelete", method = RequestMethod.POST)
	@ResponseBody
	public int replyAdminDelete(QnAVO qnAVO,int num, HttpSession session)throws Exception{
		int result =qnaService.replyDelete(num, session);
		return result;
	}
	
	//delete
	
	@RequestMapping(value = "qnaDelete", method = RequestMethod.POST)
	public ModelAndView setDelete(QnAVO qnaVO, int ref, HttpSession session) throws Exception {
	
	ModelAndView mv = new ModelAndView();
	int result = qnaService.setDelete(ref, session);
	
	if(result > 0 && qnaVO.getMenu().equals("complaint")) {
	mv.setViewName("redirect:./complaint");
	} else if(result > 0 && qnaVO.getMenu().equals("praise")){
	mv.setViewName("redirect:./praise");
	} else if(result > 0 && qnaVO.getMenu().equals("qna")){
	mv.setViewName("redirect:./qna");
	} else {
	mv.addObject("message", "Delete Fail");
	mv.addObject("path", "./complaint");
	mv.setViewName("common/messageMove");
	}
	mv.addObject("board","qna");
	return mv;
	}
	//////////////////원본 글 공통 delete
	//delete	
	@RequestMapping(value = "replyDelete", method = RequestMethod.POST)
	public ModelAndView replyDelete(QnAVO qnaVO, int num, HttpSession session) throws Exception {
	
	ModelAndView mv = new ModelAndView();
	int result = qnaService.replyDelete(num, session);
	
	if(result > 0 && qnaVO.getMenu().equals("complaint")) {
	mv.setViewName("redirect:./complaint");
	} else if(result > 0 && qnaVO.getMenu().equals("praise")){
	mv.setViewName("redirect:./praise");
	} else if(result > 0 && qnaVO.getMenu().equals("qna")){
	mv.setViewName("redirect:./qna");
	} else {
	mv.addObject("message", "Delete Fail");
	mv.addObject("path", "./complaint");
	mv.setViewName("common/messageMove");
	}
	mv.addObject("board","qna");
	return mv;
	}
	/////////******건의합니다*********///////
	//list
		@RequestMapping(value = "complaint", method = RequestMethod.GET)
		public ModelAndView complaintList(PageMaker pageMaker, String menu) throws Exception {
			
			menu = "complaint";
			List<QnAVO> list = qnaService.getList(pageMaker, menu);
			ModelAndView mv = new ModelAndView();
			mv.addObject("list", list);
			mv.addObject("pager", pageMaker);
			mv.addObject("menu", "complaint");
			mv.setViewName("admin/board/boardList");
			mv.addObject("board","qna");
			return mv;
		}	
		
		
	//write - get
	@RequestMapping(value = "complaintWrite", method = RequestMethod.GET)
	public ModelAndView complaintWrite() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu", "complaint");
		mv.setViewName("admin/board/boardWrite");
		mv.addObject("board","qna");
		return mv;
	}
	
	//select
	@RequestMapping(value = "complaintSelect", method = RequestMethod.GET)
	public ModelAndView complaintSelect(int num) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		BoardVO boardVO = qnaService.getSelect(num);
		int totalCount = qnACommentsService.getTotalCount(num);
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("vo", boardVO);
		mv.addObject("menu", "complaint");
		mv.setViewName("admin/board/boardSelect");
		mv.addObject("board","qna");
		return mv;
		
	}
	
	//update - get
	@RequestMapping(value = "complaintUpdate", method = RequestMethod.GET)
	public ModelAndView complaintUpdate(int num) throws Exception {
			
		ModelAndView mv = new ModelAndView();
		QnAVO qnaVO = qnaService.getSelect(num);
		mv.addObject("vo", qnaVO);
		mv.addObject("menu", "complaint");
		mv.setViewName("admin/board/boardUpdate");
		mv.addObject("board","qna");	
		return mv;
	}
		
	//reply
	@RequestMapping(value = "complaintReply", method = RequestMethod.GET)
	public ModelAndView setReply(int num) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		BoardVO boardVO = qnaService.getSelect(num);
		
		mv.addObject("vo", boardVO);
		mv.addObject("num", num);
		mv.addObject("menu", "complaint");
		mv.setViewName("admin/board/boardReply");
		mv.addObject("board","qna");
		return mv;
	}
		
	///////////////////칭찬합니다/////////////////////////
	//list
	@RequestMapping(value = "praise", method = RequestMethod.GET)
	public ModelAndView praiseList(PageMaker pageMaker, String menu) throws Exception {
		
		menu = "praise";
		List<QnAVO> list = qnaService.getList(pageMaker, menu);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("pager", pageMaker);
		mv.addObject("menu", "praise");
		mv.setViewName("admin/board/boardList");
		mv.addObject("board","qna");	
		return mv;
			
	}
		
	//write
	@RequestMapping(value = "praiseWrite", method = RequestMethod.GET)
	public ModelAndView praiseWrite() throws Exception {
			
		ModelAndView mv = new ModelAndView();
		mv.addObject("menu", "praise");
		mv.setViewName("admin/board/boardWrite");
		mv.addObject("board","qna");	
		return mv;
	}
		
	//select
	@RequestMapping(value = "praiseSelect", method = RequestMethod.GET)
	public ModelAndView praiseSelect(int num) throws Exception {
			
		ModelAndView mv = new ModelAndView();
		BoardVO boardVO = qnaService.getSelect(num);
		int totalCount = qnACommentsService.getTotalCount(num);
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("vo", boardVO);
		mv.addObject("menu", "praise");
		mv.setViewName("admin/board/boardSelect");
		mv.addObject("board","qna");	
		return mv;
	}
		
	//update - get
	@RequestMapping(value = "praiseUpdate", method = RequestMethod.GET)
	public ModelAndView praiseUpdate(int num) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		QnAVO qnaVO = qnaService.getSelect(num);
		mv.addObject("vo", qnaVO);
		mv.addObject("menu", "praise");
		mv.setViewName("admin/board/boardUpdate");
		mv.addObject("board","qna");
		return mv;
	}
		
			
		
	//reply
	@RequestMapping(value = "praiseReply", method = RequestMethod.GET)
	public ModelAndView praiseReply(int num) throws Exception {
			
		ModelAndView mv = new ModelAndView();
		BoardVO boardVO = qnaService.getSelect(num);
			
		mv.addObject("vo", boardVO);
		mv.addObject("num", num);
		mv.addObject("menu", "praise");
		mv.setViewName("admin/board/boardReply");
		mv.addObject("board","qna");
		return mv;
	}
	
	/////////**************질문과 답변//////////////////
	//list
		@RequestMapping(value = "qna", method = RequestMethod.GET)
		public ModelAndView qna(PageMaker pageMaker, String menu) throws Exception {
			
			menu = "qna";
			List<QnAVO> list = qnaService.getList(pageMaker, menu);
			ModelAndView mv = new ModelAndView();
			mv.addObject("list", list);
			mv.addObject("pager", pageMaker);
			mv.addObject("menu", "qna");
			mv.setViewName("admin/board/boardList");
			mv.addObject("board","qna");		
			return mv;
					
		}
		
		//write
		@RequestMapping(value = "qnaWrite", method = RequestMethod.GET)
		public ModelAndView setWrite() throws Exception {
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("admin/board/boardWrite");
			mv.addObject("board","qna");
			return mv;
		}
		
		
		//select
		@RequestMapping(value = "qnaSelect", method = RequestMethod.GET)
		public ModelAndView qnaSelect(int num) throws Exception {
					
			ModelAndView mv = new ModelAndView();
			BoardVO boardVO = qnaService.getSelect(num);
			int totalCount = qnACommentsService.getTotalCount(num);
			
			mv.addObject("totalCount", totalCount);
			mv.addObject("vo", boardVO);
			mv.addObject("menu", "qna");
			mv.setViewName("admin/board/boardSelect");
			mv.addObject("board","qna");	
			return mv;
					
		}
		
		
		//update - get
		@RequestMapping(value = "qnaUpdate", method = RequestMethod.GET)
		public ModelAndView qnaUpdate(int num) throws Exception {
				
			ModelAndView mv = new ModelAndView();
			QnAVO qnaVO = qnaService.getSelect(num);
			mv.addObject("vo", qnaVO);
			mv.addObject("menu", "qna");
			mv.setViewName("admin/board/boardUpdate");
			mv.addObject("board","qna");	
			return mv;
		}
		
		
		//reply
		@RequestMapping(value = "qnaReply", method = RequestMethod.GET)
		public ModelAndView qnaReply(int num) throws Exception {
					
			ModelAndView mv = new ModelAndView();
			BoardVO boardVO = qnaService.getSelect(num);
					
			mv.addObject("vo", boardVO);
			mv.addObject("num", num);
			mv.addObject("menu", "qna");
			mv.setViewName("admin/board/boardReply");
			mv.addObject("board","qna");
			return mv;
		}
	
	//////////////////*******커뮤니티************/////////////
		@RequestMapping(value = "communityListDelete", method = RequestMethod.POST)
		@ResponseBody
		public int communityListDelete(Integer[] num) throws Exception{
			return communityService.setDelete(num);
		}
		
		// ** 게시판 - 목록 페이지 이동
		@RequestMapping(value = "community", method = RequestMethod.GET)
		public ModelAndView getCommuList(PageMaker pageMaker) throws Exception {

			// ** 게시판 - 목록 조회
			List<BoardVO> lists = communityService.getList(pageMaker);
			ModelAndView mv = new ModelAndView();
			
			mv.addObject("list", lists);
			mv.addObject("pager", pageMaker);
			mv.setViewName("admin/board/boardList");
			mv.addObject("board","community");
			return mv;
		}

		// ** 게시판 - 작성 페이지 이동
		// ModelAndView 리턴 타입 검색된 Model 데이터와 View 이름을 모두 저장하여 리턴
		@RequestMapping(value = "communityWrite", method = RequestMethod.GET)
		public ModelAndView setCommuWrite() throws Exception {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("admin/board/boardWrite");
			mv.addObject("board","community");
			return mv;

		}

		// ** 게시판 - 등록
		@RequestMapping(value = "communityWrite", method = RequestMethod.POST)
		public ModelAndView setCommuWrite(CommunityVO communityVO, HttpSession session) throws Exception {
			ModelAndView mv = new ModelAndView();
			int result = communityService.setWrite(communityVO, session);
			if (result > 0) {
				mv.setViewName("redirect:./community");
				mv.addObject("board","community");

			} else {
				mv.addObject("message", "Write Fail");
				mv.addObject("path", "./community");
				mv.setViewName("common/messageMove");
			}
			return mv;

		}

		// ** 게시판 - 상세 페이지 이동
		@RequestMapping(value = "communitySelect", method = RequestMethod.GET)
		public ModelAndView getCommuSelect(int num) throws Exception {
			ModelAndView mv = new ModelAndView();
			BoardVO boardVO = communityService.getSelect(num);
			int totalCount = communityCommentsService.getTotalCount(num);
			
			mv.addObject("totalCount", totalCount);
			mv.addObject("vo", boardVO);
			mv.setViewName("admin/board/boardSelect");
			mv.addObject("board","community");
			return mv;
		}

		// ** 게시판 - 삭제 *
		// String 리턴 타입 완벽한 View 이름을 문자열로 리턴
		@RequestMapping(value = "communityDelete", method = RequestMethod.POST)
		public String setCommuDelete(int num, HttpSession session) throws Exception {
			int result = communityService.setDelete(num, session);
			return "redirect:./community";

		}
		//관리자 삭제
		@RequestMapping(value = "adminCommunityDelete", method = RequestMethod.POST)
		@ResponseBody
		public int adminCommuDelete(int num,HttpSession session) throws Exception{
			return communityService.setDelete(num, session);
		}

		// ** 게시판 - 수정 페이지 이동
		@RequestMapping(value = "communityUpdate", method = RequestMethod.GET)
		public ModelAndView setCommuUpdate(int num) throws Exception {
			ModelAndView mv = new ModelAndView();
			CommunityVO communityVO = communityService.getSelect(num);
			int result = communityService.setUpdate(communityVO);
			mv.addObject("vo", communityVO);
			mv.addObject("result", result);
			mv.setViewName("admin/board/boardUpdate");
			mv.addObject("board","community");
			return mv;
		}

		// ** 게시판 - 수정
		@RequestMapping(value = "communityUpdate", method = RequestMethod.POST)
		public ModelAndView setCommuUpdate(CommunityVO communityVO) throws Exception {
			ModelAndView mv = new ModelAndView();
			int result = communityService.setUpdate(communityVO);
			mv.setViewName("redirect:./community");
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