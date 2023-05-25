package com.gdu.mongmong.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gdu.mongmong.domain.CartDTO;
import com.gdu.mongmong.domain.ProductDTO;

public interface OrderService {
	
	public List<CartDTO> getCartList(HttpServletRequest request);
	public int addCart(HttpServletRequest request);
	public int modifyCartAmount(HttpServletRequest request);
	public void removeCartList(HttpServletRequest request, HttpServletResponse response);
	
	public Map<String, Object> getOrderInfo(HttpServletRequest request);
	public Map<String, Object> userAddresss(int userNo);
	public Map<String, Object> addOrderContent(HttpServletRequest request);
	public Map<String, Object> getOrderComplete(HttpServletRequest request);
}
