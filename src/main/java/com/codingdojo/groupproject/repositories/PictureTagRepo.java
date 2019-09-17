package com.codingdojo.groupproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.groupproject.models.PictureTag;

public interface PictureTagRepo extends CrudRepository<PictureTag, Long>{

	List<PictureTag> findAll();

}
