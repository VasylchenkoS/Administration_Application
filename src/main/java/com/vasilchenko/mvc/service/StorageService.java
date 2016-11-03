package com.vasilchenko.mvc.service;

import com.vasilchenko.java.dao.StorageDAO;
import com.vasilchenko.java.model.Storage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class StorageService {

	@Autowired
	StorageDAO storageDAO;

	public List<Storage> getAllIngredient(){
		return storageDAO.getAllIngredient();
	}

	@PreAuthorize("hasRole('ADMIN')")
	public void updateIngredient(Storage ingredient){
		storageDAO.updateIngredient(ingredient);
	}

	@PreAuthorize("hasRole('ADMIN')")
	public Storage findByName(String ingredient){
		return storageDAO.getIngredientByName(ingredient);
	}

	@PreAuthorize("hasRole('ADMIN')")
	public Storage findById(int id){
		return storageDAO.getIngredientById(id);
	}

	@PreAuthorize("hasRole('ADMIN')")
	public void addNewIngredient(Storage ingredient){
		storageDAO.addNewIngredient(ingredient);
	}

	@PreAuthorize("hasRole('ADMIN')")
	public void deleteIngredientById(int id){
		storageDAO.deleteIngredientById(id);
	}
}
