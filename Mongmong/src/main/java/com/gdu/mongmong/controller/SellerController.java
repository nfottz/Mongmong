package com.gdu.mongmong.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.mongmong.domain.UserDTO;
import com.gdu.mongmong.service.SellerService;

@Controller
@RequestMapping("/seller")
public class SellerController {
	
	@Autowired
	private SellerService sellerService;
	
	@GetMapping("/sellermain.do")
	public String sellerMain() {
		return "seller/sellermain";
	}
	
	@PostMapping("/addproduct.do")
	public String addProduct(MultipartHttpServletRequest mutipartRequest, RedirectAttributes redirectAttributes) {
		int addResult = sellerService.prodAdd(mutipartRequest);
		redirectAttributes.addFlashAttribute("addResult", addResult);
		return"redirect:/seller/addproduct";
	}
	
	@GetMapping("/productdetail.do")
	public String productDetail() {
		return "seller/productdetail";
	}
	
	@GetMapping("/qnadetail.do")
	public String qnaDetail() {
		return "seller/qnadetail";
	}
	
	@GetMapping("/reviewdetail.do")
	public String reviewDetail() {
		return "seller/reviewdetail";
	}
	
	@PostMapping("/prodAdd.do")
	public String prodAdd(MultipartHttpServletRequest multipartRequest, RedirectAttributes redirectAttributes) {
		int addResult = sellerService.prodUpload(multipartRequest);
		redirectAttributes.addFlashAttribute("addResult", addResult);
		return "redirect:/seller/productdetail.do";
	}
	@PostMapping("/modify.do")
	public String modify(UserDTO userDTO, RedirectAttributes redirectAttributes) {
		int modifyResult = sellerService.modifyId(userDTO);
		redirectAttributes.addFlashAttribute("modifyResult", modifyResult);
		return "redirect:/seller/sellermain.do?userName=" + userDTO.getUserName();
	}
	@GetMapping("/addproduct.form")
	public String addproduct() {
		
		return "seller/addproduct";
	}
}
