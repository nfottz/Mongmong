package com.gdu.mongmong.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDTO {
	private int reviewNo;
	// private int orderDetailNo;
	private OrderDetailDTO orderDetailDTO;
	private int bestReview;
	private double prodScore;
	private double sellerScore;
	private int hasImg;
	private String reviewWriter;
	private String reviewContent;
	private Date reviewRegDate;
	private Date reviewExpiredAt;
	private int reviewCommentDepth;
	private int reviewCommentGroupNo;
}
