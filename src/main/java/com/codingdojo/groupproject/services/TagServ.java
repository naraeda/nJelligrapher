package com.codingdojo.groupproject.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.groupproject.models.Tag;
import com.codingdojo.groupproject.repositories.TagRepo;

@Service
public class TagServ {

	@Autowired
	private TagRepo tR;
	


}
