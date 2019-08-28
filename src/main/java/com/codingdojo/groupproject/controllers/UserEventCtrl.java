package com.codingdojo.groupproject.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.groupproject.models.Event;
import com.codingdojo.groupproject.models.User;
import com.codingdojo.groupproject.models.UserEvent;
import com.codingdojo.groupproject.services.UserEventServ;

@Controller
public class UserEventCtrl {
	@Autowired
	private UserEventServ ueS;
	
	@PostMapping("/events/join")
	public String joinEvent(@ModelAttribute("middleTable") UserEvent uE) {
		ueS.addUserToEvent(uE);
		return "redirect:/events";
	}
	 
	@DeleteMapping("/events/cancel")
	public String cancelEvent(@RequestParam("user") User uId, @RequestParam("event") Event eId) {
		ueS.removeUserFromEvent(uId, eId);
		return "redirect:/events";
	}
}
