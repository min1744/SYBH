package com.hospital.admin;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.hospital.board.BoardVO;
import com.hospital.member.MemberDAO;
import com.hospital.member.MemberVO;
import com.hospital.member.unserviceability.UnserviceabilityVO;
import com.hospital.notice.NoticeDAO;
import com.hospital.notice.NoticeVO;
import com.hospital.pay.PayVO;
import com.hospital.util.PageMaker;

@Service
public class AdminService {
	@Inject
	private AdminDAO adminDAO;
	@Inject
	private MemberDAO memberDAO;
	@Inject
	private NoticeDAO noticeDAO;
	
	//Admin페이지 List
	public List<MemberVO> getMemberList() throws Exception{
		List<MemberVO> list = adminDAO.getList();
		for(MemberVO memberVO : list) {
			//주민등록번호 복호화 및 뒷자리 *처리
			String res_reg_num = memberDAO.setResDecryption(memberVO.getRes_reg_num());
			if(res_reg_num == null) {
				throw new Exception();
			}
			res_reg_num = memberDAO.setUpdateRes(res_reg_num);
			if(res_reg_num == null) {
				throw new Exception();
			}
			memberVO.setRes_reg_num(res_reg_num);
		}
		
		return list;
	}
	
	//Data of adminIndex
	public HashMap<String, Object> getData() throws Exception{
		SimpleDateFormat format = new SimpleDateFormat("yy년 MM월 dd일");
		Date current = new Date();
		String today = format.format(current);
		String todayYear = today.substring(0, today.indexOf("년"));
		String todayMonth = today.substring(today.indexOf("년")+2, today.indexOf("월"));
		String todayDate = today.substring(today.indexOf("월")+2, today.indexOf("일"));
		DecimalFormat formatter = new DecimalFormat("###,###,###,###,###");
		
		//total membership, Doctor, Admin count
		HashMap<String, Object> map = new HashMap<String, Object>();
		int allMemberCount = adminDAO.getAllMemberCount();
		int allDoctorCount = adminDAO.getAllDoctorCount();
		int allAdminCount = adminDAO.getAllAdminCount();
		
		int annualMemberCount = adminDAO.getAnnualMemberCount(todayYear);
		
		//annual earnings chart data
		List<Integer> earnings = adminDAO.getEarnings(todayYear);
		long extendedPrice = 0;
		for(long earning:earnings) {
			extendedPrice += earning;
		}
		String e = formatter.format(extendedPrice);
		//전체 매출액 목표(1조 원)의 0.02%인 200억을 기준으로 온라인 매출 퍼센트 구하기
		// = 온라인상의 총 매출액 / (1조 * 0.02%)
		extendedPrice = extendedPrice/(1000000000000L*2/10000);
		map.put("earningsNum", extendedPrice);
		
		//today access count
		HashMap<String, String> map2 = new HashMap<String, String>();
		map2.put("year", todayYear);
		map2.put("month", todayMonth);
		map2.put("date", todayDate);
		int access_count = adminDAO.getAllAccessCounts(map2);
		
		//Data of annual donations
		List<Integer> donations = adminDAO.getDonations(todayYear);
		extendedPrice = 0;
		for(int donation:donations) {
			extendedPrice += donation;
		}
		String dona = formatter.format(extendedPrice);
		
		//Annual earnings chart data
		int [] monthMembershipData = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
		List<Date> reg_dateList = adminDAO.getRegDate(todayYear);
		for(Date d:reg_dateList) {
			String reg_date = format.format(d);
			int regMonth = Integer.parseInt(reg_date.substring(reg_date.indexOf("년")+2, today.indexOf("월")));
			for(int i = 0; i < 12; i++) {
				if(regMonth == i+1) {
					monthMembershipData[i] += 1;
					break;
				}
			}
		}
		map.put("allMemberCount", allMemberCount);
		map.put("allDoctorCount", allDoctorCount);
		map.put("allAdminCount", allAdminCount);
		map.put("access_count", access_count);
		map.put("earnings", e);
		map.put("donations", dona);
		map.put("monthMembershipData", monthMembershipData);
		map.put("annualMemberCount", annualMemberCount);
		return map;
	}
	
	//등급 상향
	public int setUpgrade(String [] id) throws Exception{
		List<String> list = Arrays.asList(id);
		return adminDAO.setUpgrade(list);
	}
		
	//등급 상향
	public int setDowngrade(String [] id) throws Exception{
		List<String> list = Arrays.asList(id);
		return adminDAO.setDowngrade(list);
	}
		
	//회원 관리(삭제)
	public int setDelete(String [] id) throws Exception{
		List<String> list = Arrays.asList(id);
		return adminDAO.setDelete(list);
	}
	
	//차단 된 사람들 리스트
	public List<UnserviceabilityVO> getUnserviceabilityList() throws Exception{
		List<UnserviceabilityVO> list = adminDAO.getUnserviceabilityList();
		for(UnserviceabilityVO unserviceabilityVO : list) {
			String res_reg_num = memberDAO.setResDecryption(unserviceabilityVO.getRes_reg_num());
			if(res_reg_num == null) {
				throw new Exception();
			}
			res_reg_num = memberDAO.setUpdateRes(res_reg_num);
			if(res_reg_num == null) {
				throw new Exception();
			}
			unserviceabilityVO.setRes_reg_num(res_reg_num);
		}
		
		return list;
	}
	
	//주민번호를 활용해서 회원탈퇴를 당한 사람이 로그인하지 못하도록 기록남기기 
	public int setUnserviceability(String [] id) throws Exception{
		UnserviceabilityVO unserviceabilityVO = null;
		int result = 0;
		for(int i = 0; i < id.length; i++) {
			MemberVO memberVO = memberDAO.getSelect(id[i]);
			unserviceabilityVO = new UnserviceabilityVO();
			unserviceabilityVO.setId(memberVO.getId());
			unserviceabilityVO.setEmail(memberVO.getEmail());
			unserviceabilityVO.setName(memberVO.getName());
			unserviceabilityVO.setRes_reg_num(memberVO.getRes_reg_num());
			unserviceabilityVO.setReason("관리자에 의해 차단됨");
			result = adminDAO.setUnserviceability(unserviceabilityVO);
			if(result < 1) {
				throw new Exception();
			}
		}
		
		return result;
	}
	
	//차단 해제
	public int setDeleteUnserviceability(String [] id) throws Exception{
		List<String> list = Arrays.asList(id);
		
		return adminDAO.setDeleteUnserviceability(list);
	}
	
	//getNoticeList
	public HashMap<String, List> getNoticeList(PageMaker pageMaker) throws Exception{
		pageMaker.makeRow();
		List<BoardVO> list = noticeDAO.getList(pageMaker);
		int totalCount = noticeDAO.getTotalCount(pageMaker);
		pageMaker.makePage(totalCount);
		List<NoticeVO> fixedList = noticeDAO.getListFix();
		HashMap<String, List> map = new HashMap<String, List>();
		map.put("list", list);
		map.put("fixedList", fixedList);
		
		return map;
	}
	//재혁 작업
	//notice 하나 선택
	public NoticeVO getNoticeSelect(int num) throws Exception{
		NoticeVO noticeVO = noticeDAO.getSelect(num);
		noticeDAO.setHitUpdate(num);
		return noticeVO;
	}
	
	//재혁 작업 끝
	
	//getAccessInfoList
	public List<AccessInfoVO> getAccessInfoList() throws Exception{
		return adminDAO.getAccessInfoList();
	}
	
	//getMemberData
	public List<Integer> getMemberData() throws Exception{
		SimpleDateFormat format = new SimpleDateFormat("yy년 MM월 dd일");
		Date current = new Date();
		String today = format.format(current);
		String todayYear = today.substring(0, today.indexOf("년"));
		List<Integer> monthMembershipData = new ArrayList<Integer>();
		List<Date> reg_dateList = adminDAO.getRegDate(todayYear);
		for(int i = 0; i < 12; i++) {
			monthMembershipData.add(0);
		}
		for(int i = 0; i < reg_dateList.size(); i++) {
			String reg_date = format.format(reg_dateList.get(i));
			int regMonth = Integer.parseInt(reg_date.substring(reg_date.indexOf("년")+2, today.indexOf("월")));
			for(int j = 0; j < 12; j++) {
				if(regMonth == j + 1) {
					monthMembershipData.set(j, monthMembershipData.get(j) + 1);
					break;
				}
			}
		}
		
		return monthMembershipData;
	}
	
	//getEarningsData
	public List<Long> getEarningsData() throws Exception{
		SimpleDateFormat format = new SimpleDateFormat("yy년 MM월 dd일");
		Date current = new Date();
		String today = format.format(current);
		String todayYear = today.substring(0, today.indexOf("년"));
		List<Long> monthEarningsData = new ArrayList<Long>();
		List<PayVO> list = adminDAO.getPayDate(todayYear);
		for(int i = 0; i < 12; i++) {
			monthEarningsData.add((long)0);
		}
		for(int i = 0; i < list.size(); i++) {
			String reg_date = format.format(list.get(i).getPay_date());
			int regMonth = Integer.parseInt(reg_date.substring(reg_date.indexOf("년")+2, today.indexOf("월")));
			for(int j = 0; j < 12; j++) {
				if(regMonth == j + 1) {
					monthEarningsData.set(j, monthEarningsData.get(j) + list.get(i).getPrice());
					break;
				}
			}
		}
		
		return monthEarningsData;
	}
	
	//getVisitorsData
	public List<Integer> getVisitorsData() throws Exception{
		SimpleDateFormat format = new SimpleDateFormat("yy년 MM월 dd일");
		Date current = new Date();
		String today = format.format(current);
		String todayYear = today.substring(0, today.indexOf("년"));
		List<Integer> monthVisitorsData = new ArrayList<Integer>();
		List<Date> reg_dateList = adminDAO.getAccessDate(todayYear);
		for(int i = 0; i < 12; i++) {
			monthVisitorsData.add(0);
		}
		for(int i = 0; i < reg_dateList.size(); i++) {
			String reg_date = format.format(reg_dateList.get(i));
			int regMonth = Integer.parseInt(reg_date.substring(reg_date.indexOf("년")+2, today.indexOf("월")));
			for(int j = 0; j < 12; j++) {
				if(regMonth == j + 1) {
					monthVisitorsData.set(j, monthVisitorsData.get(j) + 1);
					break;
				}
			}
		}
		
		return monthVisitorsData;
	}
}