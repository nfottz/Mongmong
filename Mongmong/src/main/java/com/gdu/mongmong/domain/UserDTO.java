package com.gdu.mongmong.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {

	private int userNo;
	private int userType;
	private String userId;
	private String userPw;
	private String userName;
	private String contact;
	private String email;
	private String gender;
	private String birthyear;
	private String birthDate;
	private int agreecode;
	private Date joinedAt;
	private Date pwModifiedAt;
	private String autologinId;
	private Date autologinExpiredAt;
	private int onBlacklist;
	private String sellerName;
	private String sellerCertif;
	private String sellerOpenDate;
	
	private int userPoint;
	
}
