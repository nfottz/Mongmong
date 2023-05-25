package com.gdu.mongmong.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface UserService {

	public void login(HttpServletRequest request, HttpServletResponse response);
	public void autoLogin(HttpServletRequest request, HttpServletResponse response);
	public Map<String, Object> verifyId(String id);
	public Map<String, Object> verifyEmail(String email);
	public Map<String, Object> sendAuthCode(String email);
	public void join(MultipartHttpServletRequest multipartRequest, HttpServletResponse response);
	public void logout(HttpServletRequest request, HttpServletResponse response);
	public void leave(HttpServletRequest request, HttpServletResponse response);
	public void active(HttpServletRequest request, HttpServletResponse response);
	public void restUserHandle();
	
}
