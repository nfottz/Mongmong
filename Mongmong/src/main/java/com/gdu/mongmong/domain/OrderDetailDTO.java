package com.gdu.mongmong.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailDTO {
	private int orderDetailNo;
	private OrderDTO orderDTO;
	private ProductDTO productDTO;
	private int couponNo;
	private int prodAmount;
}
