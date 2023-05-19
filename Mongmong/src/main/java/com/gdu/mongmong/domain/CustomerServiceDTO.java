package com.gdu.mongmong.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerServiceDTO {
	
	private int csNo;
	private int csWriter;
	private String csTitle;
	private String csContent;
	private Date csRegDate;
	private Date csModDate;
	private int csStatus;
	private int csCategory;
	private int depth;
	private int groupNo;
	private int groupOrder;
	private int isSecret;
	private String secretPw;
	private int isAnswer;
	
	
	
}
