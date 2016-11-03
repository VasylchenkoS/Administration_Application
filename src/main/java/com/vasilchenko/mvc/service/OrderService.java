package com.vasilchenko.mvc.service;

import com.vasilchenko.java.dao.OrderingDAO;
import com.vasilchenko.java.model.Ordering;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class OrderService {

	@Autowired
	OrderingDAO orderingDAO;

	public List<Ordering> getAllOrders(){
		return orderingDAO.getAllOrders();
	}
}
