package com.gdu.mongmong.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor 
public class ProductDTO {
  private int prodNo;
  //private int categoryNo;
  private String prodName;
  private int prodPrice;
  private int prodStock;
  private String prodContent;
  private Date prodRegDate;
  private Date prodModDate;
  private int prodDeleted;
  private ProductCategoryDTO productCategoryDTO;
  private ProductSellerDTO productSellerDTO;
}
