package com.gdu.mongmong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mypage")
@Controller
public class MypageController {

	@GetMapping("/mypageMain.form")
	public String loginForm(@RequestHeader("referer") String url, Model model) {
		model.addAttribute("url", url);
		return "mypage/mypageMain";
	}
	
	@GetMapping("/orderlist.form")
	public String orderlist() {
		return "mypage/orderlist";
	}
	
	@GetMapping("/cancelOrder/form")
	public String cancelOrder() {
		return "mypage/cancelOrder";
	}
	
	@GetMapping("/coupon.form")
	public String coupon() {
		return "mypage/coupon";
	}
	
	@GetMapping("/point.form")
	public String point() {
		return "mypage/point";
	}
	
	@GetMapping("/reviewlist.form")
	public String reviewlist() {
		return "mypage/reviewlist";
	}
	
	@GetMapping("/productqnalist.form")
	public String productqna() {
		return "mypage/productqnalist";
	}
	
	@GetMapping("/csqnalist.form")
	public String csqnalist() {
		return "mypage/csqnalist";
	}
	
	@GetMapping("/modifyInfo.form")
	public String modifyInfo() {
		return "mypage/modifyInfo";
	}
	
	@GetMapping("/addresslist.form")
	public String addresslist() {
		return "mypage/addresslist";
	}
	
	@GetMapping("/leave.form")
	public String leave() {
		return "mypage/leave";
	}
}
