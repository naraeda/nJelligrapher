package com.codingdojo.groupproject.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.groupproject.models.Event;
import com.codingdojo.groupproject.models.Picture;
import com.codingdojo.groupproject.models.User;
import com.codingdojo.groupproject.models.UserEvent;
import com.codingdojo.groupproject.services.EventServ;
import com.codingdojo.groupproject.services.UserServ;

@Controller 
public class EventCtrl {
	
	@Autowired 
	private EventServ eS;
	
	@Autowired
	private UserServ uS; 
	
	 @GetMapping("/events")
	    public String home(@ModelAttribute("event") Event event, HttpSession session, Model model, RedirectAttributes rA) {
	    	if(session.getAttribute("userId")==null) {
	    		rA.addFlashAttribute("NonLoggedInError", "Please log in first!");
	    		return "redirect:/";
	    	}
	    	else {
	    		
		    		Long userId = (Long) session.getAttribute("userId");
		    		User loggedInUser = uS.findUserById(userId);
		    		model.addAttribute("user", loggedInUser);
		    		model.addAttribute("eventsInState", eS.getEventByState(loggedInUser.getState()));
		    		model.addAttribute("eventsOutState", eS.getEventByOppState(loggedInUser.getState()));
		    		model.addAttribute("middleTable", new UserEvent());
		    		return "eventDashboard.jsp";
	    		}
	    }
	
	@PostMapping("/events")
	public String addEvents(@Valid @ModelAttribute("event") Event event, BindingResult result, RedirectAttributes rA) {
		
		if(result.hasErrors()) {
			rA.addFlashAttribute("invalidEventInfo", "Fields cannot be empty!" );
			return "redirect:/events";
		}
		else {
			eS.createEvent(event);
			return "redirect:/events";
		}
	}
	
	@GetMapping("/events/{id}")
	public String showOneEvent(@PathVariable("id") Long id, Model model, HttpSession session, @ModelAttribute("picture") Picture pic, @ModelAttribute("event") Event event) {
		Long userId = (Long) session.getAttribute("userId");
		User u = uS.findUserById(userId);
		model.addAttribute("user", u);
		model.addAttribute("event", eS.getEventById(id));
		return "/eventDetail.jsp";
	}
	
	@PutMapping("/events/{id}/edit")
	public String editEvent(@PathVariable("id") Long id, @ModelAttribute("event") Event event) {
		eS.createEvent(event);
		return "redirect:/events/" + id;
	}
	
	@DeleteMapping("/events/{id}")
	public String removeEvent(@PathVariable("id") Long id) {
		eS.deleteEvent(id);
		return "redirect:/events";
	}
	
	@PostMapping("/search")
	public String search(@RequestParam("tag") String tag) {
		return "redirect:/search/" + tag;
	}
	
	@GetMapping("/announcements")
	public String announcements() {
		return "announcements.jsp";
	}
}
