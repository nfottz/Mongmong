package com.gdu.mongmong.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.gdu.mongmong.domain.ProductDTO;
import com.gdu.mongmong.domain.ProductQnaDTO;
import com.gdu.mongmong.domain.ReviewDTO;

public interface ProductService {
	public void getProductListUsingPagination(HttpServletRequest request, Model model);
	public ProductDTO getProductDetailByProdNo(HttpServletRequest request);
	public List<ReviewDTO> getReviewListUsingPagination(HttpServletRequest request, Model model);
	/*
	public List<ProductQnaDTO> getQnaListUsingPagination(HttpServletRequest request, Model model);
	*/
}
