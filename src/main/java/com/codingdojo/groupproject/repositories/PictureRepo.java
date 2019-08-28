package com.codingdojo.groupproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.groupproject.models.Picture;



@Repository
public interface PictureRepo extends CrudRepository<Picture, Long>{
	public List<Picture> findAll();
	
//	public List<Picture> findPictureByTagNamesIn(List<String> tags);
}
