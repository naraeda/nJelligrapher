package com.codingdojo.groupproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.groupproject.models.Picture;
import com.codingdojo.groupproject.repositories.PictureRepo;

@Service
public class PictureServ {
	private final PictureRepo pRepo;
		
	public PictureServ(PictureRepo pRepo) {
		this.pRepo = pRepo;
	}
	
	public Picture createPicture(Picture p) {
		return pRepo.save(p);
	}
	
	public List<Picture> findAll(){
		return pRepo.findAll();
	}
	
	public Picture findById(Long id) {
		Optional<Picture> pic = pRepo.findById(id);
		if(pic.isPresent()) {
			return pic.get();
		}else {
			return null;
		}
	}
	
//	public List<Picture> findPicturesByTagNameIn(List<String> tags){
//		
//	}
}
