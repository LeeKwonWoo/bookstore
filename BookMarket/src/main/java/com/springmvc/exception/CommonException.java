package com.springmvc.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class CommonException {
	@ExceptionHandler(RuntimeException.class)
	private ModelAndView handlerErrorCommon(Exception e) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("excpetion",e);
		modelAndView.setViewName("errorCommon");
		return modelAndView;
	}
}
