package com.hospital.member;

import java.util.List;

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
}