package com.gdu.mongmong.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailDTO {
	private int orderDetailNo;
	private int orderNo;
	private int prodNo;
	private int couponNo;
	private int prodAmount;
}
