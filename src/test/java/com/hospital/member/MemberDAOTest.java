package com.hospital.member;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.hospital.SYBH.AbstractTest;

public class MemberDAOTest extends AbstractTest {

	@Inject
	private MemberDAO memberDAO;
	
	//@Test
	public void setWrite() throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.setId("admin");
		memberVO.setPw("admin");
		memberVO.setName("admin");
		//memberVO.setRes_reg_num("941231-1234567");
		//memberVO.setPhone("010-1234-5678");
		//memberVO.setEmail("admin123@gmail.com");
		memberVO.setGender(1);
		memberVO.setAge(26);
		assertEquals(1, memberDAO.setWrite(memberVO));
	}
	
	//@Test
	public void setDelete() throws Exception{
		assertEquals(1, memberDAO.setDelete("iu"));
	}
	
	//@Test
	public void login() throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setId("min1744");
		memberVO.setPw("bong1017$$");
		memberVO = memberDAO.login(memberVO);
		System.out.println(memberVO.getId());
		System.out.println(memberVO.getPw());
	}
	
	@Test
	public void eqNull() throws Exception{
		int [] a = {};
		System.out.println(a);
	}
}