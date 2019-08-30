package com.codingdojo.groupproject.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.codingdojo.groupproject.services.EventServ;

@Controller
public class TagCtrl {
	
	@Autowired
	private EventServ eS;
//	@Autowired
//	private TagServ tS;
//	
//	@PostMapping("/search")
//	public String search(@RequestParam("tag") String name) {
//		return "redirect:/search/" + name;
//	}
	
	@GetMapping("/showmap/{id}")
	public String getLocation(Model model, @PathVariable("id") Long id) {
		model.addAttribute("event", eS.getEventById(id));
		return "adminPage.jsp";
	}
}
