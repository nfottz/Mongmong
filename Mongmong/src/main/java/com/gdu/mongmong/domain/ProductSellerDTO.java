package com.gdu.mongmong.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductSellerDTO {
	private int prodNo;
	private int userNo;
	private int deliveryPrice;
	private int discountRate;
}
