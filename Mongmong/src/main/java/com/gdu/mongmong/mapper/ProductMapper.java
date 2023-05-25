package com.gdu.mongmong.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.mongmong.domain.ProductDTO;
import com.gdu.mongmong.domain.ProductQnaDTO;
import com.gdu.mongmong.domain.ReviewDTO;

@Mapper
public interface ProductMapper {
	public int getProductCount();
	public List<ProductDTO> getProductListUsingPagination(Map<String, Object> map);
	
	public ProductDTO getProductDetailByProdNo(int prodNo);
	
	public int getReviewCount(int prodNo);
	public List<ReviewDTO> getReviewListUsingPagination(Map<String, Object> map);	
	/*
	public int getQnaCount();
	public List<ProductQnaDTO> getQnaListUsingPagination(Map<String, Object> map);	
	*/
}