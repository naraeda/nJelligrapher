package com.codingdojo.groupproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.groupproject.models.Event;
import com.codingdojo.groupproject.models.User;
import com.codingdojo.groupproject.models.UserEvent;

@Repository
public interface UserEventRepo extends CrudRepository <UserEvent, Long>{
	List<UserEvent> findAll();

	UserEvent deleteByEventAndUser(Event event, User user);

	UserEvent findByUserAndEvent(User u, Event e );
}
