package com.gdu.mongmong.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.mongmong.domain.CartDTO;
import com.gdu.mongmong.domain.OrderDTO;
import com.gdu.mongmong.domain.OrderDetailDTO;
import com.gdu.mongmong.domain.PointDetailDTO;
import com.gdu.mongmong.domain.ProductDTO;
import com.gdu.mongmong.domain.UserDTO;
import com.gdu.mongmong.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	
	@Override
	  public void login(HttpServletRequest request, HttpServletResponse response) {
	    
	    // 요청 파라미터
	    String url = request.getParameter("url");  // 로그인 화면의 이전 주소(로그인 후 되돌아갈 주소)
	    String id = request.getParameter("id");
	    String pw = request.getParameter("pw");
	    
	    // 비밀번호 SHA-256 암호화
	    
	    // UserDTO 만들기
	    UserDTO userDTO = new UserDTO();
	    userDTO.setUserId(id);
	    userDTO.setUserPw(pw);
	    
	    // DB에서 UserDTO 조회하기
	    UserDTO loginUserDTO = orderMapper.selectUserByUserDTO(userDTO);
	    
	    // ID, PW가 일치하는 회원이 있으면 로그인 성공
	    // 0. 자동 로그인 처리하기(autoLogin 메소드에 맡기기)
	    // 1. session에 ID 저장하기
	    // 2. 회원 접속 기록 남기기
	    // 3. 이전 페이지로 이동하기
	    if(loginUserDTO != null) {
	      
	      HttpSession session = request.getSession();
	      session.setAttribute("loginId", id);
	      
	      try {
	        response.sendRedirect(url);
	      } catch (Exception e) {
	        e.printStackTrace();
	      }
	      
	    }
	    // ID, PW가 일치하는 회원이 없으면 로그인 실패
	    else {
	      
	      // 응답
	      try {
	        
	        response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>");
	        out.println("alert('일치하는 회원 정보가 없습니다.');");
	        out.println("location.href='" + request.getContextPath() + "/index.do';");
	        out.println("</script>");
	        out.flush();
	        out.close();
	        
	      } catch (Exception e) {
	        e.printStackTrace();
	      }
	      
	    }
	    
	  }
	
	
	@Override
	  public void logout(HttpServletRequest request, HttpServletResponse response) {
	    

	    // 1. 자동 로그인을 해제한다.
	    
	    // DB에서 AUTOLOGIN_ID 칼럼과 AUTOLOGIN_EXPIRED_AT 칼럼 정보 삭제하기
	    HttpSession session = request.getSession();

	    // 2. session에 저장된 모든 정보를 지운다. (자동 로그인 먼저 해제.)    
	    session.invalidate();
	  }
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<ProductDTO> getProdList() {
		return orderMapper.getProdList();
	}
	
	@Override
	public ProductDTO getProdByNo(HttpServletRequest request) {
		String strProdNo = request.getParameter("prodNo");
		int prodNo = 0;
		if(strProdNo != null && strProdNo.isEmpty() == false) { 
			prodNo = Integer.parseInt(strProdNo);
		} 
		return orderMapper.selectProductByNo(prodNo);
	}

	@Override
	public List<CartDTO> getCartList(HttpServletRequest request) {
		HttpSession session = request.getSession();
	    String sessionloginId = (String) session.getAttribute("loginId");
	    /*if(session.getAttribute("loginId") == null) {
	    	return orderMapper.getCartList(null);
	    }*/ 
	    int userNo = orderMapper.selectUserById(sessionloginId).getUserNo();
	    Map<String, Object> cartMap = new HashMap<String, Object>();
	    cartMap.put("userNo", userNo);
	    List<CartDTO> list = orderMapper.getCartList(cartMap);
	    for(CartDTO cart : list) {
	    	cart.initSaleTotal();
	    }
	    System.out.println(list);
		return list;
	}
	
	@Override
	public int addCart(HttpServletRequest request) {
		
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		HttpSession session = request.getSession();
	    String sessionloginId = (String) session.getAttribute("loginId");
	    int userNo = orderMapper.selectUserById(sessionloginId).getUserNo();
		int amount = Integer.parseInt(request.getParameter("amount"));
		if(sessionloginId == null) {
			sessionloginId = session.getId();
		}
		
		CartDTO cartDTO = new CartDTO();
		cartDTO.setProdNo(prodNo);
		cartDTO.setUserNo(userNo);
		cartDTO.setAmount(amount);
		
		int addResult = 0;
		
		if(orderMapper.checkCart(cartDTO) == null) {
			return addResult = orderMapper.addCart(cartDTO);
		} else {
			return addResult;
		}
		
	}
	
	@Override
	public int modifyCartAmount(HttpServletRequest request) {
		
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		HttpSession session = request.getSession();
	    String sessionloginId = (String) session.getAttribute("loginId");
	    int userNo = orderMapper.selectUserById(sessionloginId).getUserNo();
		
		CartDTO cartDTO = new CartDTO();
		cartDTO.setProdNo(prodNo);
		cartDTO.setUserNo(userNo);
		cartDTO.setAmount(amount);
		
		int modifyResult = orderMapper.modifyCartAmount(cartDTO);
		
		return modifyResult;
	}
	
	@Override
	public void removeCartList(HttpServletRequest request, HttpServletResponse response) {
		// 파라미터 cartNoList를 받아온다. 
		String[] cartNoList = request.getParameterValues("cartNoList");
		int removeResult = orderMapper.removeCartList(Arrays.asList(cartNoList));    // Arrays.asList(boardNoList)) : String[] cartNoList를 ArrayList로 바꾸는 코드. (매퍼쪽으로 어레이리스트 전달하기로 했으니까. 그약속 지켰다)
		// 3개를 전달해서 3개를 지웠다면 removeResult 가 3이 나온다.
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			if(removeResult == cartNoList.length) {
				out.println("alert('선택된 모든 상품이 삭제되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/order/cartList.do'");
			} else {
				out.println("alert('선택된 상품이 삭제되지 않았습니다.')");
				out.println("history.back()");
			}
			out.println("</script>");
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	
	@Override
	public Map<String, Object> getOrderInfo(HttpServletRequest request) {

		HttpSession session = request.getSession();
	    String sessionloginId = (String) session.getAttribute("loginId");
	    String[] prodNoList = request.getParameterValues("prodNoList");
		List<String> prodList = Arrays.asList(prodNoList);  
	    UserDTO userInfo = new UserDTO(); 
	    userInfo = orderMapper.selectUserById(sessionloginId);
	    
	    int userNo = orderMapper.selectUserById(sessionloginId).getUserNo();

	    Map<String, Object> cartMap = new HashMap<String, Object>();
	    cartMap.put("prodNoList", prodList);
	    cartMap.put("userNo", userNo);
		
	    List<CartDTO> cartList = orderMapper.getCartList(cartMap);
	    for(CartDTO cart : cartList) {
	    	cart.initSaleTotal();
	    }
	    System.out.println(cartList);
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("userInfo", userInfo);
	    map.put("cartList", cartList);
	    
	    System.out.println(map);
		return map;
	}
	
	@Override
	public Map<String, Object> userAddresss(int userNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userAddresss", orderMapper.getUserAddress(userNo));
		
		return map;
	}
	
	@Transactional(readOnly=true)
	@Override
	public Map<String, Object> addOrderContent(HttpServletRequest request) {
		String senderName = request.getParameter("senderName");
		int deliveryPrice = Integer.parseInt(request.getParameter("deliveryPrice"));
		
		HttpSession session = request.getSession();
	    String sessionloginId = (String) session.getAttribute("loginId");
	    int userNo = orderMapper.selectUserById(sessionloginId).getUserNo();
		int orderTotalPrice = Integer.parseInt(request.getParameter("orderTotalPrice"));
		String payMethod = request.getParameter("payMethod");
		String orderStatus = "결제완료";
		String strPoint = request.getParameter("membershipPoint");
		int membershipPoint = 0;
		if(strPoint.isEmpty() == false) {
			membershipPoint = Integer.parseInt(strPoint);
		}
		String orderName = request.getParameter("orderName");
		String contact = request.getParameter("contact");
		String postcode = request.getParameter("postcode");
		String roadAddress = request.getParameter("roadAddress");
		String jibunAddress = (request.getParameter("jibunAddress").isEmpty()) ? "(지번주소)" : request.getParameter("jibunAddress");
		String detailAddress = (request.getParameter("detailAddress").isEmpty()) ? "(상세주소)" : request.getParameter("detailAddress");
		String extraAddress = (request.getParameter("extraAddress").isEmpty()) ? "(참고항목)" : request.getParameter("extraAddress");
		String orderRequest = request.getParameter("orderRequest");
		
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setUserNo(userNo);
		orderDTO.setOrderTotalPrice(orderTotalPrice);
		orderDTO.setPayMethod(payMethod);
		orderDTO.setOrderStatus(orderStatus);
		orderDTO.setMembershipPoint(membershipPoint);
		orderDTO.setOrderName(orderName);
		orderDTO.setContact(contact);
		orderDTO.setPostcode(postcode);
		orderDTO.setRoadAddress(roadAddress);
		orderDTO.setJibunAddress(jibunAddress);
		orderDTO.setDetailAddress(detailAddress);
		orderDTO.setExtraAddress(extraAddress);
		orderDTO.setOrderRequest(orderRequest);
		orderDTO.setSenderName(senderName);
		orderDTO.setDeliveryPrice(deliveryPrice);
		
		int addOrderResult = orderMapper.addOrderContent(orderDTO);
		
		
		// 오더
		int orderNo = orderDTO.getOrderNo();
		/*
		 * Map<String, Object> orderMap = new HashMap<String, Object>();
		 * orderMap.put("userNo", userNo); orderMap.put("orderNo", orderNo);
		 */
		System.out.println(orderDTO);
		
		// 카트 
		String[] prodNoList = request.getParameterValues("prodNo");
		List<String> prodList = Arrays.asList(prodNoList);  
		Map<String, Object> cartMap = new HashMap<String, Object>();
	    cartMap.put("userNo", userNo);
	    cartMap.put("prodNoList", prodList);
	    List<CartDTO> cartList = orderMapper.getCartList(cartMap);
	    
	    
	    // OrderDetailDTO 만들기
	    OrderDTO trOrderDTO = new OrderDTO();
	    trOrderDTO.setOrderNo(orderNo);
	    ProductDTO trProductDTO = new ProductDTO();
	    int prodNo = 0;
	    OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
	    orderDetailDTO.setOrderDTO(trOrderDTO);
	    
	    for(CartDTO cart : cartList) {
	    	cart.initSaleTotal();
	    	prodNo = cart.getProdNo();
	    	trProductDTO.setProdNo(prodNo);
	    	orderDetailDTO.setProdAmount(cart.getAmount());
	    	orderDetailDTO.setProductDTO(trProductDTO);
	    	orderMapper.addOrderDetail(orderDetailDTO);
	    }
	    
		
		// pointDetail
	    PointDetailDTO pointDetailDTO = new PointDetailDTO();
	    pointDetailDTO.setOrderNo(orderNo);
	    pointDetailDTO.setUserNo(userNo);
	    pointDetailDTO.setPointDetail("구매적립");
	    Map<String, Object> pointMap = new HashMap<String, Object>();
	    pointMap.put("userNo", userNo);
	    pointMap.put("orderNo", orderNo);
	    OrderDTO orderPoint = orderMapper.getOrderByNo(pointMap);
	    int point = 0;
	    if( (int) (orderPoint.getPointRate() * orderPoint.getOrderTotalPrice() * 0.01) == 0 ) {
	    	pointDetailDTO.setPointAmount(point);
	    } else {
	    	point = (int) (orderPoint.getPointRate() * orderPoint.getOrderTotalPrice() * 0.01);
	    	pointDetailDTO.setPointAmount(point);
	    }
	    orderMapper.addPoint(pointDetailDTO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderNo", orderNo);
		map.put("senderName", senderName);
		map.put("order", orderDTO);
		map.put("cartList", cartList);
		
		
		orderMapper.afterOrderDeleteCart(cartMap);
		
		return map;
	}
	@Override
	public Map<String, Object> getOrderComplete(HttpServletRequest request) {
		HttpSession session = request.getSession();
	    String sessionloginId = (String) session.getAttribute("loginId");
	    int userNo = orderMapper.selectUserById(sessionloginId).getUserNo();
	    String strOrderNo = request.getParameter("orderNo");
	    int orderNo = 0;
	    if(strOrderNo == null) {
	    	orderNo = 0;
	    } else {
	    	orderNo = Integer.parseInt(strOrderNo);
	    }
	    String senderName = request.getParameter("senderName");
	    
	    
	    Map<String, Object> getMap = new HashMap<String, Object>();
	    getMap.put("userNo", userNo);
	    getMap.put("orderNo", orderNo);
	    
	    OrderDTO order = new OrderDTO();
	    order = orderMapper.getOrderByNo(getMap);
	    order.setSenderName(senderName);
	    
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("order", order);
	    map.put("orderDetail", orderMapper.getOrderDetail(orderNo));
		
		return map;
	}
	
	
}
