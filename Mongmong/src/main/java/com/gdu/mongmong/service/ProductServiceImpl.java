package com.gdu.mongmong.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gdu.mongmong.domain.ProductDTO;
import com.gdu.mongmong.domain.ProductQnaDTO;
import com.gdu.mongmong.domain.ReviewDTO;
import com.gdu.mongmong.mapper.ProductMapper;
import com.gdu.mongmong.util.PageUtil;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	// field
	private ProductMapper productMapper;
	private PageUtil pageUtil;
	
	@Override
	public void getProductListUsingPagination(HttpServletRequest request, Model model) {
		
		Optional<String> opt1 = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt1.orElse("1"));
		
		int totalRecord = productMapper.getProductCount();
		
		HttpSession session = request.getSession();
		Optional<Object> opt2 = Optional.ofNullable(session.getAttribute("recordPerPage"));
		int recordPerPage = (int)(opt2.orElse(12));
		
		Optional<String> opt3 = Optional.ofNullable(request.getParameter("order"));
		String order = opt3.orElse("ASC");
		
		Optional<String> opt4 = Optional.ofNullable(request.getParameter("column"));
		String column = opt4.orElse("P.PROD_NO");
		
		String categoryNoStr = request.getParameter("categoryNo");
		int categoryNo = Integer.parseInt(categoryNoStr != null ? categoryNoStr : "1");

		pageUtil.setPageUtil(page, totalRecord, recordPerPage);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", pageUtil.getBegin());
		map.put("end", pageUtil.getEnd());
		map.put("order", order);
		map.put("column", column);
		map.put("categoryNo", categoryNo);
		
		List<ProductDTO> products = productMapper.getProductListUsingPagination(map);
		
		model.addAttribute("products", products);
		model.addAttribute("pagination", pageUtil.getPagination(request.getContextPath() + "/product/pagination.do?categoryNo=" + categoryNo + "&column" + column + "&order=" + order));
		//model.addAttribute("beginNo",   totalRecord - (page - 1) * recordPerPage);
		switch(order) {
		case "ASC" : model.addAttribute("order", "DESC"); break;
		case "DESC" : model.addAttribute("order", "ASC"); break;
		}
		model.addAttribute("page", page);
		model.addAttribute("categoryNo", categoryNo);
	}
	
	@Override
	public ProductDTO getProductDetailByProdNo(HttpServletRequest request) {
		String strProdNo = request.getParameter("prodNo");
		int prodNo = 0;
		if(strProdNo != null && strProdNo.isEmpty() == false) {
			prodNo = Integer.parseInt(strProdNo);
		}
		return productMapper.getProductDetailByProdNo(prodNo);
	}
	
	@Override
	public List<ReviewDTO> getReviewListUsingPagination(HttpServletRequest request, Model model) {
		Optional<String> opt1 = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt1.orElse("1"));
		
		String strProdNo = request.getParameter("prodNo");
		int prodNo = 0;
		if(strProdNo != null && strProdNo.isEmpty() == false) {
			prodNo = Integer.parseInt(strProdNo);
		}
		int totalRecord = productMapper.getReviewCount(prodNo);
		
		HttpSession session = request.getSession();
		Optional<Object> opt2 = Optional.ofNullable(session.getAttribute("recordPerPage"));
		int recordPerPage = (int)(opt2.orElse(3));
		
		Optional<String> opt3 = Optional.ofNullable(request.getParameter("order"));
		String order = opt3.orElse("ASC");
		
		Optional<String> opt4 = Optional.ofNullable(request.getParameter("column"));
		String column = opt4.orElse("R.REVIEW_NO");
		
		pageUtil.setPageUtil(page, totalRecord, recordPerPage);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", pageUtil.getBegin());
		map.put("end", pageUtil.getEnd());
		map.put("order", order);
		map.put("column", column);
		map.put("prodNo", prodNo);
		
		List<ReviewDTO> reviews = productMapper.getReviewListUsingPagination(map);
		
		model.addAttribute("reviews", reviews);
		model.addAttribute("pagination", pageUtil.getPagination(request.getContextPath() + "/product/review.do?prodNo=" + prodNo + "&column" + column + "&order=" + order));
		//model.addAttribute("beginNo",   totalRecord - (page - 1) * recordPerPage);
		switch(order) {
		case "ASC" : model.addAttribute("order", "DESC"); break;
		case "DESC" : model.addAttribute("order", "ASC"); break;
		}
		model.addAttribute("page", page);
		model.addAttribute("prodNo", prodNo);
		
		return reviews;
	}
	/*
	@Override
	public List<ProductQnaDTO> getQnaListUsingPagination(HttpServletRequest request, Model model) {
		Optional<String> opt1 = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt1.orElse("1"));
		
		int totalRecord = productMapper.getProductCount();
		
		HttpSession session = request.getSession();
		Optional<Object> opt2 = Optional.ofNullable(session.getAttribute("recordPerPage"));
		int recordPerPage = (int)(opt2.orElse(3));
		
		Optional<String> opt3 = Optional.ofNullable(request.getParameter("order"));
		String order = opt3.orElse("ASC");
		
		Optional<String> opt4 = Optional.ofNullable(request.getParameter("column"));
		String column = opt4.orElse("Q.QNA_NO");
		
		String prodNoStr = request.getParameter("prodNo");
		int prodNo = Integer.parseInt(prodNoStr != null ? prodNoStr : "0");

		pageUtil.setPageUtil(page, totalRecord, recordPerPage);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", pageUtil.getBegin());
		map.put("end", pageUtil.getEnd());
		map.put("order", order);
		map.put("column", column);
		map.put("prodNo", prodNo);
		
		List<ProductQnaDTO> qnaList = productMapper.getQnaListUsingPagination(map);
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pagination", pageUtil.getPagination(request.getContextPath() + "/product/qna.do?prodNo=" + prodNo + "&column" + column + "&order=" + order));
		//model.addAttribute("beginNo",   totalRecord - (page - 1) * recordPerPage);
		switch(order) {
		case "ASC" : model.addAttribute("order", "DESC"); break;
		case "DESC" : model.addAttribute("order", "ASC"); break;
		}
		model.addAttribute("page", page);
		model.addAttribute("prodNo", prodNo);
		
		return qnaList;
		
	}
	*/
}
