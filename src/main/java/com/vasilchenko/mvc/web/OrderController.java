package com.vasilchenko.mvc.web;

import com.vasilchenko.java.model.Ordering;
import com.vasilchenko.mvc.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class OrderController {

	@Autowired OrderService orderService;

	@RequestMapping(value = "/orders", method = RequestMethod.GET)
	public String showMenuPage(Model model){
		model.addAttribute("orders", orderService.getAllOrders());
		return "order/main_order";
	}

	@RequestMapping(value = "/orders/filter", method = RequestMethod.GET)
	public String filter(Model model,
						 @RequestParam("filterDateStart") String filterDateStart,
						 @RequestParam("filterDateEnd") String filterDateEnd,
						 @RequestParam("filterWaiter") String filterWaiter,
						 @RequestParam("filterTable") String filterTable){
		List<Ordering> orderingList = orderService.getAllOrders();
		List<Ordering> result = null;
		Date dateEnd = null;
		Date dateStart = null;
		if (!filterDateStart.isEmpty())
			dateStart = new Date(new java.util.Date(filterDateStart).getTime());
		if(!filterDateEnd.isEmpty())
			dateEnd = new Date(new java.util.Date(filterDateEnd).getTime());
		if (dateStart != null){
			final Date finalDateStart = dateStart;
			result = orderingList.stream().filter(order -> (order.getDate().after(finalDateStart))).collect(Collectors.toList());
		}
		if (dateEnd != null){
			final Date finalDateEnd = dateEnd;
			result = orderingList.stream().filter(order -> (order.getDate().before(finalDateEnd))).collect(Collectors.toList());
		}
		if (!filterWaiter.isEmpty())
			result = orderingList.stream().filter(order -> order.getEmployee().getName().toLowerCase().contains(filterWaiter)).collect(Collectors.toList());
		if (!filterTable.isEmpty())
			result = orderingList.stream().filter(order -> order.getTable().getNumber().toLowerCase().contains(filterTable)).collect(Collectors.toList());
		model.addAttribute("orders", result);
		return "order/main_order";
	}
}
