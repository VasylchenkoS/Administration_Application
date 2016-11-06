package com.vasilchenko.mvc.web;

import com.vasilchenko.java.model.Storage;
import com.vasilchenko.mvc.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Controller
public class StorageController {

	@Autowired StorageService storageService;

	@RequestMapping(value = "/storage", method = RequestMethod.GET)
	public String showMenuPage(Model model){
		model.addAttribute("storage", storageService.getAllIngredient());
		return "storage/main_storage";
	}

	@RequestMapping(value = "/ingredient/edit/{id}", method = RequestMethod.GET)
	public String editMenu(@PathVariable("id") String id, Model model){
		Storage storage = storageService.findById(Integer.parseInt(id));
		model.addAttribute("storage", storage);
		return "storage/update_storage";
	}

	@RequestMapping(value = "/ingredient/{id}/update", method = RequestMethod.POST)
	public String updateEmployeePage	(@RequestParam("name") String name,
									 @RequestParam("quantity") String quantity,
									 @PathVariable("id") String id, Model model) {
		Storage byId = storageService.findById(Integer.parseInt(id));
		if (!Objects.equals(name, "")) byId.setIngredientName(name);
		if (!Objects.equals(quantity, "")) byId.setQuantity(Long.parseLong(quantity));
		storageService.updateIngredient(byId);
		model.addAttribute("storage", byId);
		model.addAttribute("flag", "modify");
		return "storage/update_storage";
	}

	@RequestMapping(value = "/ingredient/add", method = RequestMethod.GET)
	public String addEmployee(Model model) {
		model.addAttribute("storage", new Storage());
		return "storage/add_storage";
	}

	@RequestMapping(value = "/ingredient/new", method = RequestMethod.POST)
	public String saveEmployee(@RequestParam("name") String name,
							   @RequestParam("quantity") String quantity,
							   Model model) {
		Storage storage = new Storage();
		storage.setIngredientName(name);
		if(!quantity.isEmpty())
			storage.setQuantity(Long.parseLong(quantity));
		storageService.addNewIngredient(storage);
		model.addAttribute("storage", storage);
		model.addAttribute("flag", "add");
		return "storage/update_storage";
	}

	@RequestMapping(value = "/ingredient/remove/{id}", method = RequestMethod.GET)
	public String removeEmployee(Model model, @PathVariable("id") String id) {
		storageService.deleteIngredientById(Integer.parseInt(id));
		model.addAttribute("remove_flag", true);
		return "redirect:/storage";
	}

	@RequestMapping(value = "/ingredient/filter", method = RequestMethod.GET)
	public String filter(@RequestParam("filter") String filter, Model model) {
		List<Storage> ingredients = storageService.getAllIngredient();
		List list = ingredients.stream().filter(storage -> storage.getIngredientName().toLowerCase().contains(filter.toLowerCase())).collect(Collectors.toList());
		model.addAttribute("storage", list);
		return "storage/main_storage";
	}
}
