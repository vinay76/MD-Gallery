package com.darryl.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.darryl.dao.CustomerDAO;
import com.darryl.dao.OrderDAO;
import com.darryl.model.McImage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.util.WebUtils;

import com.darryl.MyCredentials;
import com.darryl.service.S3Service;

@Controller
@SessionAttributes("images")
public class AbstractController {

	public static final String IMAGES = "images";
	protected static Map<String, List<McImage>> bucketInformation;
	
	@Autowired
	CustomerDAO customerDAO;
	
	@Autowired
	OrderDAO orderDAO;
	

	@ModelAttribute
	public void bootStrapImageData(HttpServletRequest request, Model model){
		bucketInformation  =  (Map<String, List<McImage>>) WebUtils.getSessionAttribute(request, IMAGES);
		if(bucketInformation == null){
			S3Service s3Service = new S3Service();
			bucketInformation = s3Service.getBucketInformation(new MyCredentials());
			model.addAttribute("images", bucketInformation);
		}
	}
}
