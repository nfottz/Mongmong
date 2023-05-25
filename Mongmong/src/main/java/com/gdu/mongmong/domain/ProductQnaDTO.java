package com.gdu.mongmong.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductQnaDTO {
	private int qnaNo;
	private ProductDTO productDTO;
	private int userNo;
	private int qnaCategory;
	private String qnaWriter;
//	private String qnaInfo;
	private Date qnaRegDate;
	private String qnaTitle;
	private String qnaContent;
	private int hasQnaFile;
	private int isSecret;
	private String secretPw;
	private int isAnswer;
}
