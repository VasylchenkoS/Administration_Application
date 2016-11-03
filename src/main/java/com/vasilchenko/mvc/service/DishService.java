package com.vasilchenko.mvc.service;


import com.vasilchenko.java.dao.DishDAO;
import com.vasilchenko.java.model.Dish;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class DishService {

	@Autowired
	private DishDAO dishDAO;

	public List<Dish> getAllDish(){
		return dishDAO.getAllDish();
	}

	@PreAuthorize("hasRole('ADMIN')")
	public void modifyDish(Dish dish){
		dishDAO.updateDish(dish);
	}

	@PreAuthorize("hasRole('ADMIN')")
	public void addNewDish(Dish dish){
		dishDAO.addNewDish(dish);
	}

	@PreAuthorize("hasRole('ADMIN')")
	public void deleteDish(Dish dish){
		dishDAO.deleteDishById(dish.getId());
	}

	@PreAuthorize("hasRole('ADMIN')")
	public Dish findDishByName(String name){ return dishDAO.findByName(name); }

	@PreAuthorize("hasRole('ADMIN')")
	public Dish findById(int id){ return dishDAO.findById(id); }
}