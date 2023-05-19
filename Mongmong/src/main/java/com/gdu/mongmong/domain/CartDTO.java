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
}
