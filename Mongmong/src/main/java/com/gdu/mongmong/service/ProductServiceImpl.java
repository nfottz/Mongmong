package com.gdu.mongmong.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gdu.mongmong.domain.OrderDTO;
import com.gdu.mongmong.domain.OrderDetailDTO;
import com.gdu.mongmong.domain.ProductDTO;
import com.gdu.mongmong.domain.ProductQnaDTO;
import com.gdu.mongmong.domain.ReviewDTO;
import com.gdu.mongmong.mapper.ProductMapper;
import com.gdu.mongmong.util.PageUtil;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	// field
	private ProductMapper productMapper;
	private PageUtil pageUtil;
	
	@Override
	public void getProductListUsingPagination(HttpServletRequest request, Model model) {
		
		Optional<String> opt1 = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt1.orElse("1"));
		
		String categoryNoStr = request.getParameter("categoryNo");
		int categoryNo = Integer.parseInt(categoryNoStr != null ? categoryNoStr : "1");
		
		int totalRecord = productMapper.getCateProductCount(categoryNo);
		
		HttpSession session = request.getSession();
		Optional<Object> opt2 = Optional.ofNullable(session.getAttribute("recordPerPage"));
		int recordPerPage = (int)(opt2.orElse(12));
		
		Optional<String> opt3 = Optional.ofNullable(request.getParameter("order"));
		String order = opt3.orElse("ASC");
		
		Optional<String> opt4 = Optional.ofNullable(request.getParameter("column"));
		String column = opt4.orElse("P.PROD_NO");		

		pageUtil.setPageUtil(page, totalRecord, recordPerPage);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", pageUtil.getBegin());
		map.put("end", pageUtil.getEnd());
		map.put("order", order);
		map.put("column", column);
		map.put("categoryNo", categoryNo);
		
		List<ProductDTO> products = productMapper.getProductListUsingPagination(map);
		
		model.addAttribute("products", products);
		model.addAttribute("pagination", pageUtil.getPagination(request.getContextPath() + "/product/pagination.do?categoryNo=" + categoryNo + "&column" + column + "&order=" + order));
		//model.addAttribute("beginNo",   totalRecord - (page - 1) * recordPerPage);
		switch(order) {
		case "ASC" : model.addAttribute("order", "DESC"); break;
		case "DESC" : model.addAttribute("order", "ASC"); break;
		}
		model.addAttribute("page", page);
		model.addAttribute("categoryNo", categoryNo);
	}
	
	@Override
	public ProductDTO getProductDetailByProdNo(HttpServletRequest request) {
		String strProdNo = request.getParameter("prodNo");
		int prodNo = 0;
		if(strProdNo != null && strProdNo.isEmpty() == false) {
			prodNo = Integer.parseInt(strProdNo);
		}
		return productMapper.getProductDetailByProdNo(prodNo);
	}
	
	@Override
	public void getReviewListUsingPagination(HttpServletRequest request, Model model) {
		
		Optional<String> opt1 = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt1.orElse("1"));
		
		String strProdNo = request.getParameter("prodNo");
		int prodNo = 0;
		if(strProdNo != null && strProdNo.isEmpty() == false) {
			prodNo = Integer.parseInt(strProdNo);
		}
		int totalRecord = productMapper.getReviewCount(prodNo);
		
		int recordPerPage = 3;

		pageUtil.setPageUtil(page, totalRecord, recordPerPage);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", pageUtil.getBegin());
		map.put("end", pageUtil.getEnd());
		map.put("prodNo", prodNo);
		
		List<ReviewDTO> reviews = productMapper.getReviewListUsingPagination(map);
		
		model.addAttribute("reviews", reviews);
		model.addAttribute("pagination", pageUtil.getPagination(request.getContextPath() + "/product/detail.do?prodNo=" + prodNo));
		model.addAttribute("page", page);
		model.addAttribute("prodNo", prodNo);
		
	}

	@Override
	public void getQnaListUsingPagination(HttpServletRequest request, Model model) {
		Optional<String> opt1 = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt1.orElse("1"));
		
		String strProdNo = request.getParameter("prodNo");
		int prodNo = 0;
		if(strProdNo != null && strProdNo.isEmpty() == false) {
			prodNo = Integer.parseInt(strProdNo);
		}
		
		int totalRecord = productMapper.getQnaCount(prodNo);
		
		int recordPerPage = 3;

		pageUtil.setPageUtil(page, totalRecord, recordPerPage);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", pageUtil.getBegin());
		map.put("end", pageUtil.getEnd());
		map.put("prodNo", prodNo);
		
		List<ProductQnaDTO> qnaList = productMapper.getQnaListUsingPagination(map);
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pagination", pageUtil.getPagination(request.getContextPath() + "/product/detail.do?prodNo=" + prodNo));
		model.addAttribute("page", page);
		model.addAttribute("prodNo", prodNo);
	}
	
	/*
	 * @Override public void insertReview(HttpServletRequest request,
	 * HttpServletResponse response) {
	 * 
	 * int prodNo = Integer.parseInt(request.getParameter("prodNo"));
	 * 
	 * String strOrderDetailNo = request.getParameter("orderDetailNo"); int
	 * orderDetailNo = 0; if(strOrderDetailNo != null && strOrderDetailNo.isEmpty()
	 * == false) { orderDetailNo = Integer.parseInt(strOrderDetailNo); }
	 * 
	 * OrderDetailDTO orderDetailDTO = new OrderDetailDTO();
	 * orderDetailDTO.setOrderDetailNo(orderDetailNo);
	 * 
	 * String strSellerScore = request.getParameter("reviewStar1"); int sellerScore
	 * = 0; if(strSellerScore != null && strSellerScore.isEmpty() == false) {
	 * sellerScore = Integer.parseInt(strSellerScore); }
	 * 
	 * String strProdScore = request.getParameter("reviewStar2"); int prodScore = 0;
	 * if(strProdScore != null && strProdScore.isEmpty() == false) { prodScore =
	 * Integer.parseInt(strProdScore); }
	 * 
	 * String reviewWriter = request.getParameter("reviewWriter"); String
	 * reviewContent = request.getParameter("reviewContent");
	 * 
	 * ReviewDTO review = new ReviewDTO(); review.setOrderDetailDTO(orderDetailDTO);
	 * review.setSellerScore(sellerScore); review.setProdScore(prodScore);
	 * review.setReviewWriter(reviewWriter); review.setReviewContent(reviewContent);
	 * 
	 * int addReview = productMapper.insertReview(review);
	 * 
	 * try { response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
	 * response.getWriter();
	 * 
	 * out.println("<script>"); if(addReview == 1 ) {
	 * out.println("alert('리뷰가 등록되었습니다.')"); out.println("location.href='" +
	 * request.getContextPath() + "/produt/detail.do?prodNo=" + prodNo + "'"); }
	 * else { out.println("alert('리뷰 등록에 실패하였습니다.')");
	 * out.println("history.back()"); }
	 * 
	 * out.println("</script>"); out.flush(); out.close();
	 * 
	 * } catch(Exception e) { e.printStackTrace(); } }
	 */
	
	@Override
	public void insertQna(HttpServletRequest request, HttpServletResponse response) {
		
		int qnaCategory = Integer.parseInt(request.getParameter("qnaCategory"));
		String qnaTitle = request.getParameter("qnaTitle");
		String qnaContent = request.getParameter("qnaContent");
		
		ProductDTO productDTO = new ProductDTO();
		int prodNo = Integer.parseInt(request.getParameter("prodNo"));
		productDTO.setProdNo(prodNo);
		
		HttpSession session = request.getSession();
		Optional<Object> opt = Optional.ofNullable(session.getAttribute("loginId"));
		int userNo = (int)(opt.orElse(0));
		
		ProductQnaDTO qnaDTO = new ProductQnaDTO();
		qnaDTO.setQnaCategory(qnaCategory);
		qnaDTO.setQnaTitle(qnaTitle);
		qnaDTO.setQnaContent(qnaContent);
		qnaDTO.setProductDTO(productDTO);
		qnaDTO.setUserNo(userNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qnaDTO", qnaDTO);
		map.put("productDTO", productDTO);
		int addResult = productMapper.insertQna(map);
		
		try {
			response.setContentType("text/html; charset=UTF-8"); 
			PrintWriter out = response.getWriter();
			 
			out.println("<script>"); 
			if(addResult == 1 ) {
				out.println("alert('리뷰가 등록되었습니다.')"); 
				out.println("location.href='" +	request.getContextPath() + "/product/pagination.do'"); 
			} else { out.println("alert('리뷰 등록에 실패하였습니다.')");
			 	out.println("history.back()"); 
			}
			out.println("</script>"); 
			out.flush(); 
			out.close();	
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
