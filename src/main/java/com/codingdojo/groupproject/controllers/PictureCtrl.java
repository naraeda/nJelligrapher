package com.codingdojo.groupproject.controllers;

import java.io.IOException;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.model.ObjectMetadata;
import com.codingdojo.groupproject.models.Picture;
import com.codingdojo.groupproject.s3Services.UploadFile;
import com.codingdojo.groupproject.services.PictureServ;

@Controller
public class PictureCtrl {
	private final PictureServ pS;
	
	public PictureCtrl(PictureServ pS) {
		this.pS = pS;
	}
	
//	@PostMapping("/events/pictures")
//	public String createPic(@Valid @ModelAttribute("picture") Picture pic, BindingResult result) {
//		return "redirect:/events/pictures";
//	}
	@PostMapping("/test")
	public String testUpload(@RequestParam("imgUrl") MultipartFile file, @Valid @ModelAttribute("picture") Picture pic, BindingResult result){
		
		if(result.hasErrors()) {
			return "redirect:/events";
		}
		else {
			System.out.println("---URL");
			UploadFile s3Uploader = new UploadFile();
			
			try {
				System.out.println();
				ObjectMetadata metaData = new ObjectMetadata();
				metaData.setContentType("image/png");
				String imgUrl = s3Uploader.Upload("eventsimg132", file.getOriginalFilename(), file.getInputStream(), metaData);
				pic.setUrl(imgUrl);
				pS.createPicture(pic);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "redirect:/events/pictures";
		}
	}

	@GetMapping("/events/pictures")
	public String allPics(Model model) {
		List<Picture> pictures = pS.findAll();
		model.addAttribute("pictures",pictures);
		return "allPics.jsp";
	}
	
}
