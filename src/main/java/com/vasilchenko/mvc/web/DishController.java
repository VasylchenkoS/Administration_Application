package com.vasilchenko.mvc.web;

import com.vasilchenko.java.components.DishCategory;
import com.vasilchenko.java.model.Storage;
import com.vasilchenko.java.model.Dish;
import com.vasilchenko.mvc.service.StorageService;
import com.vasilchenko.mvc.service.DishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
public class DishController {

	@Autowired DishService dishService;
	@Autowired StorageService storageService;

	@RequestMapping(value = "/dishs", method = RequestMethod.GET)
	public String showDishPage(Model model){
		model.addAttribute("dish", dishService.getAllDish());
		return "dish/main_dish";
	}

	@RequestMapping(value = "/dishs/edit/{id}", method = RequestMethod.GET)
	public String editDish(@PathVariable("id") String id, Model model){
		Dish dish = dishService.findById(Integer.parseInt(id));
		model.addAttribute("dish", dish);
		model.addAttribute("category", DishCategory.values());
		model.addAttribute("all_ingredients", storageService.getAllIngredient());
		return "dish/update_dish";
	}

	@RequestMapping(value = "/dishs/{id}/update", method = RequestMethod.POST)
	public String updateDishPage(@PathVariable("id") String id,
								 @RequestParam("name") String name,
								 @RequestParam("category") String category,
								 @RequestParam("ingredientSet") Set<String> set,
								 @RequestParam("price") String price,
								 @RequestParam("weigth") String weigth,
								 @RequestParam("addIngr1") String dishAdd1,
								 @RequestParam("addIngr2") String dishAdd2,
								 @RequestParam("deleteIngr") String deleteStorage,
								 Model model){
		Dish dish = new Dish();
		dish.setName(name);
		dish.setId(Integer.parseInt(id));
		if (!dishAdd1.isEmpty()) {
			set.add(dishAdd1);
			set.add(dishAdd2);
		}
		if (!deleteStorage.isEmpty()) set.remove(deleteStorage);
		Set<Storage> dishSet = set.stream().map(s -> storageService.findByName(s)).collect(Collectors.toSet());
		dishSet.remove(null);
		dish.setIngredients(dishSet);
		dish.setCategory(DishCategory.valueOf(category));
		dish.setWeight(Double.parseDouble(weigth));
		dish.setPrice(Double.parseDouble(price));
		model.addAttribute("dish", dish);
		model.addAttribute("all_ingredients", storageService.getAllIngredient());
		model.addAttribute("flag", "modify");
		model.addAttribute("category", DishCategory.values());
		dishService.modifyDish(dish);
		return "dish/update_dish";
	}

	@RequestMapping(value = "/dishs/add", method = RequestMethod.GET)
	public String addDish(Model model) {
		model.addAttribute("dish", new Dish());
		model.addAttribute("category", DishCategory.values());
		model.addAttribute("all_ingredients", storageService.getAllIngredient());
		return "dish/add_dish";
	}

	@RequestMapping(value = "/dishs/new", method = RequestMethod.POST)
	public String saveDish(@RequestParam("name") String name,
						   @RequestParam("category") String category,
						   @RequestParam("ingredientSet") String ingredient,
						   @RequestParam("price") String price,
						   @RequestParam("weigth") String weigth,
						   Model model) {
		Dish dish = new Dish();
		dish.setName(name);
		dish.setCategory(DishCategory.valueOf(category));
		Set<Storage> dishSet = new HashSet<>();
		dishSet.add(storageService.findByName(ingredient));
		dish.setIngredients(dishSet);
		dish.setPrice(Double.parseDouble(price));
		dish.setWeight(Double.parseDouble(weigth));
		dishService.addNewDish(dish);
		model.addAttribute("dish", dish);
		model.addAttribute("all_ingredients", storageService.getAllIngredient());
		model.addAttribute("flag", "add");
		model.addAttribute("category", DishCategory.values());
		return "dish/update_dish";
	}

	@RequestMapping(value = "/dishs/remove/{id}", method = RequestMethod.GET)
	public String removeDish(Model model, @PathVariable("id") String id) {
		dishService.deleteDish(dishService.findById(Integer.parseInt(id)));
		model.addAttribute("remove_flag", true);
		return "redirect:/dishs";
	}
}