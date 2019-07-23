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
	
	public String getId(String email) throws Exception{
		return memberDAO.getId(email);
	}
	
	public int getPw(String email) throws Exception{
		int result = memberDAO.getPw(email);
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail(email);
		memberVO.setPw(UUID.randomUUID().toString());
		if(result > 0) {
			result = memberDAO.setPwUpdate(memberVO);
		} else {
			
		}
		return 0;
	}
	
	public int setWrite(MemberVO memberVO) throws Exception{
		return memberDAO.setWrite(memberVO);
	}
	
	public int setUpdate(MemberVO memberVO) throws Exception{
		
		
		return 0;
	}
}