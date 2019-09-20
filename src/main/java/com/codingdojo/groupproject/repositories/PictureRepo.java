package com.codingdojo.groupproject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.groupproject.models.Picture;
import com.codingdojo.groupproject.models.Tag;



@Repository
public interface PictureRepo extends CrudRepository<Picture, Long>{
	List<Picture> findAll();

	List<Picture> findByTags(Optional<Tag> optionalTag);
//	List<Picture> findByTitle(String title);
	
	
//	public List<Picture> findPictureByTagNamesIn(List<String> tags);
}
