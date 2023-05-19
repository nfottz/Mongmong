package com.gdu.mongmong.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CouponDTO {
	private int couponNo;
	private String couponName;
	private String couponContent;
	private int couponDcRate;
	private Date couponCreatedDate;
	private Date couponExpiredDate;
	private String couponState;
}
