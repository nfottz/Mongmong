package com.gdu.mongmong.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDTO {
	private int orderNo;
	private int userNo;
	private Date orderDate;
	private int orderTotalPrice;
	private String payMethod;
	private String orderStatus;
	private Date shippedDate;
	private int membershipPoint;
	private int pointRate;
	private int isMember;
	private String orderName;
	private String contact;
	private String postcode;
	private String roadAddress;
	private String jibunAddress;
	private String detailAddress;
	private String extraAddress;    // sql에 이거 없음.
	private String orderRequest;
	private int orderCanceled;
}
