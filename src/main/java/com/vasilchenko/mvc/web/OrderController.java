package com.vasilchenko.mvc.web;

import com.vasilchenko.mvc.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {

	@Autowired OrderService orderService;

	@RequestMapping(value = "/orders", method = RequestMethod.GET)
	public String showMenuPage(Model model){
		model.addAttribute("orders", orderService.getAllOrders());
		return "order/main_order";
	}
}
