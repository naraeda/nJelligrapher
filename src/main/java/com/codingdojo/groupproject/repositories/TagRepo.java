package com.codingdojo.groupproject.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.groupproject.models.Tag;

@Repository
public interface TagRepo extends CrudRepository<Tag, Long> {

	Optional<Tag> findByName(String tagName);
	
	

}
