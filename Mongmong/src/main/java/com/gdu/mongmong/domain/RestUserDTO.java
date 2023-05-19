package com.gdu.mongmong.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RestUserDTO {

	private int userNo;
	private int userType;
	private String userId;
	private String userPw;
	private String userName;
	private String Contact;
	private String email;
	private String gender;
	private String birthyear;
	private String birthdate;
	private int agreecode;
	private Date joinedAt;
	private Date pwModifedAt;
	private String autologinId;
	private Date autologinExpiredAt;
	private int onBlacklist;
	private Date restAt;
}
