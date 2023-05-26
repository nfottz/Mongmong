package com.gdu.mongmong.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.gdu.mongmong.domain.ProductDTO;

public interface ProductService {
	public void getProductListUsingPagination(HttpServletRequest request, Model model);
	public ProductDTO getProductDetailByProdNo(HttpServletRequest request);
	public void getReviewListUsingPagination(HttpServletRequest request, Model model);
	public void getQnaListUsingPagination(HttpServletRequest request, Model model);
	public void insertReview(HttpServletRequest request, HttpServletResponse response);
	public void insertQna(HttpServletRequest request, HttpServletResponse response);
}
