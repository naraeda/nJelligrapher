package com.codingdojo.groupproject.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.groupproject.models.Event;
import com.codingdojo.groupproject.models.User;
import com.codingdojo.groupproject.models.UserEvent;
import com.codingdojo.groupproject.repositories.UserEventRepo;

@Service
public class UserEventServ {
	@Autowired
	private UserEventRepo ueR;
	
	public UserEvent addUserToEvent(UserEvent uE) {
		return ueR.save(uE);
	}
	
	public void removeUserFromEvent(User u, Event e) {
		UserEvent uE= ueR.findByUserAndEvent(u, e);
		ueR.deleteById(uE.getId());
	}
}
