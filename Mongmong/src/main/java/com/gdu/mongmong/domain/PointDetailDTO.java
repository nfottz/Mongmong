package com.gdu.mongmong.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PointDetailDTO {
	private int pointDetailNo;
	private int userNo;
	private int orderNo;
	private int reviewNo;
	private String pointDetail;
	private int pointAmount;
	private Date pointDate;
	private Date pointExpiredDate;
}
