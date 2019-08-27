package com.codingdojo.groupproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.groupproject.models.Event;
import com.codingdojo.groupproject.repositories.EventRepo;

@Service
public class EventServ {
	
	@Autowired
	private EventRepo eR;
	
	public List<Event> getAllEvents(){
		return eR.findAll();
	}
	
	public Event getEventById(Long id) {
		Optional<Event> optEvent = eR.findById(id);
		if(optEvent.isPresent()) {
			return optEvent.get();
		}
		return null;
	}
	
	public Event createEvent(Event event) {
		return eR.save(event);
	}
	
	public List<Event> getEventByState(String state) {
		return eR.findAllByStateOrderByDateDesc(state);
	}
	public List<Event> getEventByOppState(String state){
		return eR.findAllByStateNotContaining(state);
	}

	public void deleteEvent(Long id) {
		eR.deleteById(id);
	}
	
}
