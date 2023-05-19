package com.gdu.mongmong.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {

	private int UserNo;
	private int UserType;
	private String UserId;
	private String UserPw;
	private String UserName;
	private String Contact;
	private String Email;
	private String Gender;
	private String Birthyear;
	private String BirthDate;
	private int agreecode;
	private Date joinedAt;
	private Date pwModifiedAt;
	private String autologinId;
	private Date autologinExpiredAt;
	private int onBlacklist;
	private String sellerName;
	private String sellerNo;
	private int sellerCertif;
	private Date sellerOpenDate;
	private int userPoint;
	
}
