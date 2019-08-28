package com.codingdojo.groupproject.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.codingdojo.groupproject.models.Picture;
import com.codingdojo.groupproject.services.PictureServ;

@Controller
public class PictureCtrl {
	private final PictureServ pS;
	
	public PictureCtrl(PictureServ pS) {
		this.pS = pS;
	}

	@GetMapping("/events/pictures")
	public String allPics(Model model) {
		List<Picture> pictures = pS.findAll();
		model.addAttribute("pictures",pictures);
		return "allPics.jsp";
	}
}
