package com.gdu.mongmong.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserCouponDTO {
	private int couponNo;
	private int userNo;
}
