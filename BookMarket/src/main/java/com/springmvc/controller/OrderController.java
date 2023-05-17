package com.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springmvc.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderSerivce;
	
	@RequestMapping("/order/ISBN1234/2")
	public String process() {
		orderSerivce.confirmOrder("ISBN1234", 2);
		return "redirect:/books";
	}
}
