package com.vasilchenko.mvc.service;


import com.vasilchenko.java.dao.MenuDAO;
import com.vasilchenko.java.model.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class MenuService {

	@Autowired
	private MenuDAO menuDAO;

	public List<Menu> getAllMenu(){
		return menuDAO.getAllMenu();
	}

	@PreAuthorize("hasRole('ADMIN')")
	public void modifyMenu(Menu menu){
		menuDAO.updateMenu(menu);
	}

	@PreAuthorize("hasRole('ADMIN')")
	public void addNewMenu(Menu menu){
		menuDAO.addNewMenu(menu);
	}

	@PreAuthorize("hasRole('ADMIN')")
	public void deleteMenu(Menu menu){
		menuDAO.deleteMenuById(menu.getId());
	}

	@PreAuthorize("hasRole('ADMIN')")
	public Menu getMenuById(int id) {
		return menuDAO.getMenuById(id);
	}
}
