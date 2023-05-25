package com.gdu.mongmong.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.mongmong.domain.ProductCategoryDTO;
import com.gdu.mongmong.domain.UserDTO;

public interface SellerService {
	
	public int prodAdd(MultipartHttpServletRequest mutipartRequest);
	public int prodUpload(MultipartHttpServletRequest multipartRequest);
	public int modifyId(UserDTO userDTO);
	public void getProdList(HttpServletRequest request, Model model);
	public List<ProductCategoryDTO> cateList();
}
