package com.gdu.mongmong.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.mongmong.domain.ProductCategoryDTO;

@Mapper
public interface AdminMapper {
  
  public int getCategoryCount();
  public int getCategoryCountByQuery(Map<String, Object> map);
  public ProductCategoryDTO getCategory(int categoryNo);
  public List<ProductCategoryDTO> getCategoryListUsingPagination(Map<String, Object> map);
  public int getCategorySearchCount(Map<String, Object> map);
  public List<ProductCategoryDTO> getAutoComplete(Map<String, Object> map);
  public int addCategory(ProductCategoryDTO productCategoryDTO);
  public int editCategory(ProductCategoryDTO productCategoryDTO);
  public int removeCategory(int categoryNo);

}
