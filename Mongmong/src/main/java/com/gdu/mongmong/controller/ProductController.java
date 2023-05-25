package com.gdu.mongmong.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.mongmong.service.ProductService;

@RequestMapping("/product")
@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/pagination.do")
	public String productListPagination(HttpServletRequest request, Model model) {
		productService.getProductListUsingPagination(request, model);
		return "product/pagination";
	}
	
	@GetMapping("/change/record.do")
	public String changeRecord(HttpSession session
							 , HttpServletRequest request
							 , @RequestParam(value="recordPerPage", required=false, defaultValue="12") int recordPerPage) {
		session.setAttribute("recordPerPage", recordPerPage);
		return "redirect:" + request.getHeader("referer");
	}
	
	@GetMapping("/detail.do")
	public String detail(HttpServletRequest request, Model model) {
		model.addAttribute("product", productService.getProductDetailByProdNo(request));
		model.addAttribute("reviews", productService.getReviewListUsingPagination(request, model));
		/*model.addAttribute("qnaList", productService.getQnaListUsingPagination(request, model)); */
		return "product/detail";
	}
	
	@GetMapping("/review.do")
	public String review(HttpServletRequest request, Model model) {
		return "product/review";
	}
	
	@GetMapping("/qna.do")
	public String qna() {
		return "product/qna";
	}
	
}
