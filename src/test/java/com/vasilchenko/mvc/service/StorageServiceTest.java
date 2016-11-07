package com.vasilchenko.mvc.service;

import com.vasilchenko.java.model.Storage;
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
public class StorageServiceTest {

	@Autowired
	StorageService storageService;

	@Test
	public void testGetAllIngredient() throws Exception {
		Assert.assertNotNull(storageService.getAllIngredient());
	}

	@Test
	public void testUpdateIngredient() throws Exception {
		String name = "testName";
		long q = (long) 153.1;
		Storage storage = new Storage(name,q);
		storageService.addNewIngredient(storage);
		Storage result = storageService.getAllIngredient().stream()
				.filter(ingr -> Objects.equals(ingr.getIngredientName(), name) & Objects.equals(ingr.getQuantity(), q))
				.findAny()
				.orElse(null);
		result.setQuantity(80);
		storageService.updateIngredient(result);
		Assert.assertEquals(storageService.findById(result.getId()).getQuantity(), result.getQuantity());
	}

	@Test
	public void testFindByName() throws Exception {
		String name = "testName";
		long q = (long) 153.1;
		Storage storage = new Storage(name,q);
		storageService.addNewIngredient(storage);
		Storage result = storageService.getAllIngredient().stream()
				.filter(ingr -> Objects.equals(ingr.getIngredientName(), name) & Objects.equals(ingr.getQuantity(), q))
				.findAny()
				.orElse(null);
		Assert.assertEquals(storageService.findById(result.getId()), result);
	}

	@Test
	public void testFindById() throws Exception {
		String name = "testName";
		long q = (long) 153.1;
		Storage storage = new Storage(name,q);
		storageService.addNewIngredient(storage);
		Storage result = storageService.getAllIngredient().stream()
				.filter(ingr -> Objects.equals(ingr.getIngredientName(), name) & Objects.equals(ingr.getQuantity(), q))
				.findAny()
				.orElse(null);
		Assert.assertEquals(storageService.findByName(result.getIngredientName()), result);
	}

	@Test
	public void testAddNewIngredient() throws Exception {
		String name = "testName";
		long q = (long) 153.1;
		Storage storage = new Storage(name,q);
		storageService.addNewIngredient(storage);
		Assert.assertEquals(storageService.findByName(name).getIngredientName(), name);
	}

	@Test
	public void testDeleteIngredientById() throws Exception {
		String name = "testName";
		long q = (long) 153.1;
		Storage storage = new Storage(name,q);
		storageService.addNewIngredient(storage);
		Storage result = storageService.getAllIngredient().stream()
				.filter(ingr -> Objects.equals(ingr.getIngredientName(), name) & Objects.equals(ingr.getQuantity(), q))
				.findAny()
				.orElse(null);
		storageService.deleteIngredientById(result.getId());
		Assert.assertNull(storageService.findById(result.getId()));
	}
}