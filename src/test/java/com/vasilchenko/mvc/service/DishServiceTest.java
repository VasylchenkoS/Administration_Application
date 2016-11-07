package com.vasilchenko.mvc.service;

import com.vasilchenko.java.components.DishCategory;
import com.vasilchenko.java.model.Dish;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

@ContextConfiguration(locations = "classpath:test-hibernate-context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@Rollback(true)
public class DishServiceTest {

	@Autowired DishService dishservice;

	@Test
	public void testGetAllDish() throws Exception {
		Assert.assertNotNull(dishservice.getAllDish());
	}

	@Test
	public void testModifyDish() throws Exception {
		Dish dish = new Dish();
		String testName = "testName";
		dish.setName(testName);
		dishservice.addNewDish(dish);
		Dish result = dishservice.getAllDish().stream()
				.filter(dish1 -> Objects.equals(dish1.getName(), testName))
				.findAny()
				.orElse(null);
		Assert.assertNotEquals(result.getCategory(), DishCategory.ALCOHOL);
		result.setCategory(DishCategory.ALCOHOL);
		dishservice.modifyDish(result);
		Assert.assertEquals(result.getCategory(), DishCategory.ALCOHOL);
	}

	@Test
	public void testAddNewDish() throws Exception {
		Dish dish = new Dish();
		String testName = "testName";
		dish.setName(testName);
		dishservice.addNewDish(dish);
		Dish result = dishservice.getAllDish().stream()
				.filter(dish1 -> Objects.equals(dish1.getName(), testName))
				.findAny()
				.orElse(null);
		Assert.assertEquals(result.getName(), testName);
	}

	@Test
	public void testDeleteDish() throws Exception {
		Dish dish = new Dish();
		String testName = "testName";
		dish.setName(testName);
		dishservice.addNewDish(dish);
		Dish result = dishservice.getAllDish().stream()
				.filter(dish1 -> Objects.equals(dish1.getName(), testName))
				.findAny()
				.orElse(null);
		dishservice.deleteDish(result);
		Assert.assertNull(dishservice.findById(result.getId()));
	}

	@Test
	public void testFindDishByName() throws Exception {
		Dish dish = new Dish();
		String testName = "testName";
		dish.setName(testName);
		dishservice.addNewDish(dish);
		Assert.assertEquals(dish, dishservice.findDishByName(testName));
	}

	@Test
	public void testFindById() throws Exception {
		Dish dish = new Dish();
		String testName = "testName";
		dish.setName(testName);
		dishservice.addNewDish(dish);
		Dish result = dishservice.getAllDish().stream()
				.filter(dish1 -> Objects.equals(dish1.getName(), testName))
				.findAny()
				.orElse(null);
		Assert.assertEquals(dish, dishservice.findById(result.getId()));
	}
}