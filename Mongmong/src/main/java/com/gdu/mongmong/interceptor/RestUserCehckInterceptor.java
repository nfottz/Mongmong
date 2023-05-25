package com.gdu.mongmong.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.gdu.mongmong.domain.RestUserDTO;
import com.gdu.mongmong.mapper.UserMapper;

@Component
public class RestUserCehckInterceptor implements HandlerInterceptor {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String id = request.getParameter("id");
		
		RestUserDTO restUserDTO = userMapper.selectRestUserById(id);
		
		if(restUserDTO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("restUserId", id);
			
			response.sendRedirect(request.getContextPath() + "/user/active.form");
			return false;
		}
	
		return true;
	}
	
}
