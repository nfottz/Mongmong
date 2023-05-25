package com.gdu.mongmong.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.mongmong.service.UserService;

@RequestMapping("/user")
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@GetMapping("/login.form")
	public String loginForm(@RequestHeader("referer") String url, Model model) {
		model.addAttribute("url", url);
		return "user/login";
	}
	
	@GetMapping("/joinlist.form")
	public String joinlistForm() {
		return "user/joinlist";
	}
	
	@GetMapping("/agree.form")
	public String agreeForm() {
		return "user/agree";
	}
	
	@GetMapping("/join.form")
	public String joinForm() {
		return "user/join";
	}
	
	@GetMapping("/findId.form")
	public String findIdForm() {
		return "user/findId";
	}
	
	@GetMapping("/findPw.form")
	public String findPwForm() {
		return "user/findPw";
	}
	
	@GetMapping("/active.form")
	public String active() {
		return "user/active";
	}
	
	@GetMapping("/active.do")
	public void active(HttpServletRequest request, HttpServletResponse response) {
		userService.active(request, response);
	}
	
	@ResponseBody
	@GetMapping(value="/verifyId.do", produces="application/json")
	public Map<String, Object> verifyId(@RequestParam("id") String id){
		return userService.verifyId(id);
	}
	
	@ResponseBody
	@GetMapping(value="/verifyEmail.do", produces="application/json")
	public Map<String, Object> verifyEmail(@RequestParam("email") String email){
		return userService.verifyEmail(email);
	}
	
	@ResponseBody
	@GetMapping(value="/sendAuthCode.do", produces="application/json")
	public Map<String, Object> sendAuthCode(@RequestParam("email") String email){
		return userService.sendAuthCode(email);
	}
	
	@PostMapping("/join.do")
	public void join(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		userService.join(multipartRequest, response);
	}
	
	@PostMapping("/login.do")
	public void login(HttpServletRequest request, HttpServletResponse response) {
		userService.login(request, response);
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		userService.logout(request, response);
		return "redirect:/";
	}
	
	@GetMapping("/leave.do")
	public void leave(HttpServletRequest request, HttpServletResponse response) {
		userService.leave(request, response);
	}
	
}
