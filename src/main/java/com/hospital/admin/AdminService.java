package com.hospital.admin;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.hospital.member.MemberDAO;
import com.hospital.member.MemberVO;
import com.hospital.member.unserviceability.UnserviceabilityVO;

@Service
public class AdminService {
	@Inject
	private AdminDAO adminDAO;
	@Inject
	private MemberDAO memberDAO;
	
	//Admin페이지 List
	public List<MemberVO> getList() throws Exception{
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
}