package com.hospital.SYBH;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionController {
	
	  //모든 익셉션 처리를 하는 컨트롤러 //@ExceptionHandler(예외발생객체의 클래스명.class)
	  //익셉션들의 최상위
	  @ExceptionHandler(Throwable.class) public ModelAndView getAll() {
	  ModelAndView mv = new ModelAndView(); mv.setViewName("error/error");
	  return mv;
	  }
	 
}
