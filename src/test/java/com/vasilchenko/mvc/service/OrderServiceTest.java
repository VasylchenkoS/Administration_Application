package com.vasilchenko.mvc.service;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@ContextConfiguration(locations = "classpath:test-hibernate-context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@Rollback(true)

public class OrderServiceTest {

	@Autowired
	OrderService orderService;

	@Test
	public void testGetAllOrders() throws Exception {
		Assert.assertNotNull(orderService.getAllOrders());
	}
}