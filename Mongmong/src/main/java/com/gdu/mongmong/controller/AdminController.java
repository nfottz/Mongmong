package com.gdu.mongmong.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.mongmong.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

  @Autowired
  private AdminService adminService;
  
  @GetMapping("/adminpageMain.form")
  public String adminpageMain() {
    return "admin1/adminMain";
  }
  
  @GetMapping("/categoryList.form")
  // 컨트롤러에서 @@RequestParam으로 파라미터에 대한 null처리하기.
  // pagination에서 사용할 경로를 위해 HttpServletRequest, 속성 저장을 위해 Model을 사용한다.
  public String categoryList(HttpServletRequest request, Model model) {
    
     adminService.getCategoryListUsingPagination(request, model);
     
     return "admin1/categoryList";
  }
  
  @GetMapping("/change/record.do")
  public String changeRecord(HttpSession session
                           , HttpServletRequest request
                           , @RequestParam(value = "recordPerPage", required = false, defaultValue = "5") int recordPerPage) {
    session.setAttribute("recordPerPage", recordPerPage);
    
    return "redirect:" + request.getHeader("referer");
  
  }
  
  @GetMapping(value="/autoComplete.do", produces="application/json")
  @ResponseBody
  public Map<String, Object> autoComplete(HttpServletRequest request){ 
    return adminService.getAutoComplete(request);
   
  }
  

  // 게시글 등록 화면이동
  @GetMapping("/addCategory.form")
  public String write() {
    return "admin1/addCategory";
  }
  
  // 게시글 등록
  @PostMapping("/addCategory.do")
  public String addCategory(HttpServletRequest request, RedirectAttributes redirectAttributes) {
    
    redirectAttributes.addFlashAttribute("addResult", adminService.addCategory(request));

    return "redirect:/admin/categoryList.form";
  }
  
  // 게시글 상세보기 화면 이동
  @GetMapping("/detailCategory.form")
  public String detailCategory1(HttpServletRequest request, Model model) {
    
     model.addAttribute("category", adminService.getCategory(request));
     
     return "admin1/detailCategory";
  }
   
  
  // 게시글 수정 화면 이동
  @PostMapping("/editCategory.form")
  public String editCategory1(HttpServletRequest request, Model model) {
    
  model.addAttribute("category", adminService.getCategory(request));
    return "admin1/editCategory";
  }
  
  // 게시글 수정
  @PostMapping("/editCategory.do")
  public String editCategory2(HttpServletRequest request, RedirectAttributes redirectAttributes) {
    
    redirectAttributes.addFlashAttribute("editResult", adminService.editCategory(request));
    return "redirect:/admin/detailCategory.form?categoryNo=" + request.getParameter("categoryNo");
  }

  // 게시글 삭제
  @PostMapping("/removeCategory.do")
  public String removeCategory(HttpServletRequest request, RedirectAttributes redirectAttributes) {
    
    redirectAttributes.addFlashAttribute("removeResult", adminService.removeCategory(request));
    
    return "redirect:/admin/categoryList.form";
  }
  
  @GetMapping("/csWrite.form")
  public String csWrite() {

    return "admin1/csWrite";
  }

}
