package com.gdu.mongmong.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartDTO {
	
	private int cartNo;
  private int userNo;
  private int prodNo;
  private int amount;
  private Date cartAddDate;

  private int categoryNo;
  private String prodName;
  private int prodPrice;
  private int prodStock;
  private Date prodRegDate;
  private Date prodModDate;
  private String prodImg;
  private int prodDeleted;

  private int deliveryPrice;
  private int discountRate;

  private int salePrice;
  private int totalPrice;

  public void initSaleTotal() {
      this.salePrice = (int) (this.prodPrice * (100 - this.discountRate) * 0.01);
      this.totalPrice = this.salePrice * this.amount;

  }
  
}
