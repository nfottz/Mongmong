package com.gdu.mongmong.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.mongmong.domain.ProductCategoryDTO;

public interface AdminService {
  
  public void getCategoryListUsingPagination(HttpServletRequest request, Model model);
  public Map<String, Object> getAutoComplete(HttpServletRequest request);
  public ProductCategoryDTO getCategory(HttpServletRequest request);
  public int addCategory(HttpServletRequest request);
  public int editCategory(HttpServletRequest request);
  public int removeCategory(HttpServletRequest request);

}
