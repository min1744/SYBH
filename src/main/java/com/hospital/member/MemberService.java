package com.hospital.member;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hospital.util.PageMaker;

@Service
public class MemberService {
	@Inject
	private MemberDAO memberDAO;
	
	public List<MemberVO> getList(PageMaker pageMaker) throws Exception{
		pageMaker.makeRow();
		pageMaker.makePage(memberDAO.getTotalCount(pageMaker));
		
		return memberDAO.getList(pageMaker);
	}
	
	public MemberVO getSelect(String id) throws Exception{
		return memberDAO.getSelect(id);
	}
	
	public MemberVO login(MemberVO memberVO) throws Exception{
		return memberDAO.login(memberVO);
	}
	
	public String getId(MemberVO memberVO) throws Exception{
		String email1 = memberVO.getEmail1();
		String email2 = memberVO.getEmail2();
		String email = null;
		if(email1 != null && email2 != null) {
			email = email1 + "@" + email2;
		}
		return memberDAO.getId(email);
	}
	
	public int getPw(String email) throws Exception{
		int result = memberDAO.getPw(email);
		MemberVO memberVO = new MemberVO();
		String email1 = memberVO.getEmail1();
		String email2 = memberVO.getEmail2();
		if(email1 != null && email2 != null) {
			memberVO.setEmail(email1 + "@" + email2);
		}
		memberVO.setPw(UUID.randomUUID().toString());
		if(result > 0) {
			result = memberDAO.setPwUpdate(memberVO);
		} else {
			
		}
		return 0;
	}
	
	public int setWrite(MemberVO memberVO) throws Exception{
		String res_reg_num1 = memberVO.getRes_reg_num1();
		String res_reg_num2 = memberVO.getRes_reg_num2();
		if(res_reg_num1 != null && res_reg_num2 != null) {
			memberVO.setRes_reg_num(res_reg_num1 + "-" + res_reg_num2);
		}
		
		String phone1 = memberVO.getPhone1();
		String phone2 = memberVO.getPhone2();
		String phone3 = memberVO.getPhone3();
		if(phone1 != null && phone2 != null && phone3 != null) {
			memberVO.setPhone(phone1 + "-" + phone2 + "-" + phone3);
		}
		
		String email1 = memberVO.getEmail1();
		String email2 = memberVO.getEmail2();
		if(email1 != null && email2 != null) {
			memberVO.setEmail(email1 + "@" + email2);
		}
		int result = memberDAO.setWrite(memberVO);
		if(result < 1) {
			throw new Exception();
		}
		result = memberDAO.setEncryption(memberVO.getId());
		
		return result;
	}
	
	public int setUpdate(MemberVO memberVO) throws Exception{
		return memberDAO.setUpdate(memberVO);
	}
}