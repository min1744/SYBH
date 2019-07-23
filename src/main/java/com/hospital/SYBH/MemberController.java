package com.hospital.SYBH;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	
	@RequestMapping(value = "memberLogin", method = RequestMethod.GET)
	public void memberLogin() throws Exception {
		
		
		
	}
	
	@RequestMapping(value = "memberAgree", method = RequestMethod.GET)
	public void memberAgree() throws Exception {
		
		
		
	}
	
	@RequestMapping(value = "memberJoin", method = RequestMethod.GET)
	public void memberJoin() throws Exception {
		
		
		
	}

}
