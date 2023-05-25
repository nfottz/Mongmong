package com.gdu.mongmong.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.mongmong.domain.ProductCategoryDTO;
import com.gdu.mongmong.domain.ProductDTO;
import com.gdu.mongmong.domain.UserDTO;



@Mapper
public interface SellerMapper {
		
	public int prodAdd(ProductDTO productDTO);
	public int modifyId(UserDTO userDTO);
	public List<ProductDTO> getProdList();
	public List<ProductCategoryDTO> cateList();
}
