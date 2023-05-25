package com.gdu.mongmong.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.mongmong.service.OrderService;

@RequestMapping("/order")
@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@GetMapping("/cart.form")
	public String cart() {
		return "order/cart";
	}
	@GetMapping("/orderComplete.form")
	public String orderComplete() {
		return "order/ordercomplete";
	}
	@GetMapping("/usecoupon.form")
	public String usecoupon() {
		return "order/usecoupon";
	}
	@GetMapping("/point.form")
	public String point() {
		return "order/pointList";
	}
	@GetMapping("/coupon.form")
	public String coupon() {
		return "order/couponList";
	}
	@GetMapping("/prodDetail.form")
	public String prodDetail() {
		return "order/prodDetail";
	}
	
	@GetMapping("/cartList.do")
	public String cartList(HttpServletRequest request, Model model) {
		model.addAttribute("cartList", orderService.getCartList(request));
		return "order/cart";
	}
	@PostMapping("/addCart.do")
	public String addCart(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		
		int addCartResult = orderService.addCart(request);
		redirectAttributes.addFlashAttribute("addCartResult", addCartResult);
		
		return "redirect:/order/cartList.do";
	}
	@GetMapping("/modifyCartAmount.do")
	public String modifyCartAmount(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("modifyResult" ,orderService.modifyCartAmount(request));
		return "redirect:/order/cartList.do";
	}
	@PostMapping("/removeCartList.do")
	public void removeCartList(HttpServletRequest request, HttpServletResponse response) {
		orderService.removeCartList(request, response);
	}
	
	@GetMapping("/order.form")
	public String orderForm(HttpServletRequest request, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = orderService.getOrderInfo(request);
		
		model.addAttribute("userInfo", map.get("userInfo"));
		model.addAttribute("cartList", map.get("cartList"));
		
		return "order/order";
	}
	@ResponseBody
	@GetMapping(value="/userAddresss.do", produces="application/json")
	  public Map<String, Object> userAddresss(@RequestParam("userNo") int userNo) {
	    return orderService.userAddresss(userNo);
	  }
	@PostMapping("/order.do")
	public String orderDo(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = orderService.addOrderContent(request);
		redirectAttributes.addFlashAttribute("order", map.get("order"));
		redirectAttributes.addFlashAttribute("cartList", map.get("cartList"));
		
		return "redirect:/order/ordercomplete.form?orderNo=" + map.get("orderNo") + "&senderName=" + map.get("senderName");
	}
	@GetMapping("/ordercomplete.form")
	public String ordercomplete(HttpServletRequest request, Model model) {
		
		model.addAttribute("order", orderService.getOrderComplete(request).get("order"));
		model.addAttribute("orderDetail", orderService.getOrderComplete(request).get("orderDetail"));
		return "/order/ordercomplete";
	}
	
}
