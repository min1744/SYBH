package com.hospital.member;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.hospital.SYBH.AbstractTest;

public class MemberDAOTest extends AbstractTest {

	@Inject
	private MemberDAO memberDAO;
	@Inject
	private MemberService memberService;
	
	//@Test
	public void setWrite() throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.setId("admin123");
		memberVO.setPw("bong1017$$");
		memberVO.setName("관리자");
		memberVO.setRes_reg_num1("941130");
		memberVO.setRes_reg_num2("1201317");
		memberVO.setPhone1("010");
		memberVO.setPhone2("5410");
		memberVO.setPhone3("1744");
		memberVO.setEmail1("alsrms1744");
		memberVO.setEmail2("gmail.com");
		memberVO.setGender(1);
		memberVO.setAge(26);
		assertEquals(1, memberService.setWrite(memberVO));
	}
	
	//@Test
	public void setDelete() throws Exception{
		assertEquals(1, memberDAO.setDelete("iu"));
	}
	
	//@Test
	public void login() throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setId("abc123");
		memberVO.setPw("abc123!@#");
		memberVO = memberDAO.login(memberVO);
		System.out.println(memberVO.getId());
		System.out.println(memberVO.getPw());
	}
	
	//@Test
	public void test() throws Exception{
		
	}
}