package com.vasilchenko.mvc.service;

import com.vasilchenko.java.model.Dish;
import com.vasilchenko.java.model.Menu;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@ContextConfiguration(locations = "classpath:test-hibernate-context.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
@Rollback(true)
public class MenuServiceTest {

	@Autowired MenuService menuService;
	@Autowired DishService dishService;

	@Test
	public void testGetAllMenu() throws Exception {
		Assert.assertNotNull(menuService.getAllMenu());
	}

	@Test
	public void testModifyMenu() throws Exception {
		Menu menu = new Menu();
		String testName = "testName";
		menu.setMenuName(testName);
		menuService.addNewMenu(menu);
		Menu result = menuService.getAllMenu().stream()
				.filter(menu1 -> Objects.equals(menu1.getMenuName(), testName))
				.findAny()
				.orElse(null);
		Set<Dish> dish = new HashSet<>();
		dish.add(dishService.findDishByName("Soup"));
		result.setDishSet(dish);
		menuService.modifyMenu(result);
		Assert.assertNotNull(menuService.getMenuById(result.getId()).getDishSet());
	}

	@Test
	public void testAddNewMenu() throws Exception {
		Menu menu = new Menu();
		String testName = "testName";
		menu.setMenuName(testName);
		menuService.addNewMenu(menu);
		Menu result = menuService.getAllMenu().stream()
				.filter(menu1 -> Objects.equals(menu1.getMenuName(), testName))
				.findAny()
				.orElse(null);
		Assert.assertEquals(result.getMenuName(), testName);
	}

	@Test
	public void testDeleteMenu() throws Exception {
		Menu menu = new Menu();
		String testName = "testName";
		menu.setMenuName(testName);
		menuService.addNewMenu(menu);
		Menu result = menuService.getAllMenu().stream()
				.filter(menu1 -> Objects.equals(menu1.getMenuName(), testName))
				.findAny()
				.orElse(null);
		menuService.deleteMenu(result);
		Assert.assertNull(menuService.getMenuById(result.getId()));
	}

	@Test
	public void testGetMenuById() throws Exception {
		Menu menu = new Menu();
		String testName = "testName";
		menu.setMenuName(testName);
		menuService.addNewMenu(menu);
		Menu result = menuService.getAllMenu().stream()
				.filter(menu1 -> Objects.equals(menu1.getMenuName(), testName))
				.findAny()
				.orElse(null);
		Assert.assertEquals(menu, menuService.getMenuById(result.getId()));
	}
}