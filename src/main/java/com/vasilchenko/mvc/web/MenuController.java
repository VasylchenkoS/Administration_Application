package com.vasilchenko.mvc.web;

import com.vasilchenko.java.model.Dish;
import com.vasilchenko.java.model.Menu;
import com.vasilchenko.mvc.service.DishService;
import com.vasilchenko.mvc.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Set;
import java.util.stream.Collectors;

@Controller
public class MenuController {

	@Autowired MenuService menuService;
	@Autowired DishService dishService;

	@RequestMapping(value = "/menus", method = RequestMethod.GET)
	public String showMenuPage(Model model){
		model.addAttribute("menu", menuService.getAllMenu());
		return "menu/main_menu";
	}

	@RequestMapping(value = "/menus/edit/{id}", method = RequestMethod.GET)
	public String editMenu(@PathVariable("id") String id, Model model){
		Menu menu = menuService.getMenuById(Integer.parseInt(id));
		model.addAttribute("menu", menu);
		model.addAttribute("all_dishes", dishService.getAllDish());
		return "menu/update_menu";
	}

	@RequestMapping(value = "/menus/{id}/update", method = RequestMethod.POST)
	public String updateMenuPage(@PathVariable("id") String id,
								 @RequestParam("dishSet") Set<String> set,
								 @RequestParam("dishAdd1") String dishAdd1,
								 @RequestParam("dishAdd2") String dishAdd2,
								 @RequestParam("deleteDish") String deleteDish,
								 @RequestParam("menuNameFromInput") String menuName,
								 Model model){
		Menu menu = new Menu();
		menu.setMenuName(menuName);
		menu.setId(Integer.parseInt(id));
		if (!dishAdd1.isEmpty()) {
			set.add(dishAdd1);
			set.add(dishAdd2);
		}
		if (!deleteDish.isEmpty()) set.remove(deleteDish);
		Set<Dish> dishSet = set.stream().map(s -> dishService.findDishByName(s)).collect(Collectors.toSet());
		menu.setDishSet(dishSet);
		model.addAttribute("menu", menu);
		model.addAttribute("all_dishes", dishService.getAllDish());
		model.addAttribute("flag", "modify");
		menuService.modifyMenu(menu);
		return "menu/update_menu";
	}

	@RequestMapping(value = "/menus/add", method = RequestMethod.GET)
	public String addMenu(Model model) {
		model.addAttribute("menu", new Menu());
		return "menu/add_menu";
	}

	@RequestMapping(value = "/menus/new", method = RequestMethod.POST)
	public String saveMenu(@RequestParam("menuName") String menuName,
						   Model model) {
		Menu menu = new Menu();
		menu.setMenuName(menuName);
		menuService.addNewMenu(menu);
		model.addAttribute("menu", menu);
		model.addAttribute("all_dishes", dishService.getAllDish());
		model.addAttribute("flag", "add");
		return "menu/update_menu";
	}

	@RequestMapping(value = "/menus/remove/{id}", method = RequestMethod.GET)
	public String removeMenu(Model model, @PathVariable("id") String id) {
		menuService.deleteMenu(menuService.getMenuById(Integer.parseInt(id)));
		model.addAttribute("remove_flag", true);
		return "redirect:/menus";
	}
}