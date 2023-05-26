package com.gdu.mongmong.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.gdu.mongmong.domain.ProductCategoryDTO;
import com.gdu.mongmong.mapper.AdminMapper;
import com.gdu.mongmong.util.PageUtil;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService {

  private AdminMapper adminMapper;
  private PageUtil pageUtil;
  

  @Override
  public void getCategoryListUsingPagination(HttpServletRequest request, Model model) {
    
    // 파라미터 page가 전달되지 않은 경우 page=1로 처리한다.
    Optional<String> opt1 = Optional.ofNullable(request.getParameter("page"));
    int page = Integer.parseInt(opt1.orElse("1"));
  
    // 세션에 있는 recordPerPage를 가져온다. 세션에 없는 경우(첫 목록 - 1페이지 뿌릴 때) recordPerPage를=10으로 처리한다.
    HttpSession session = request.getSession();
    Optional<Object> opt2 = Optional.ofNullable(session.getAttribute("recordPerPage"));
    int recordPerPage = (int)(opt2.orElse(5)); 
    
    // 파라미터 order가 전달되지 않은 경우 order=ASC로 처리한다.
    Optional<String> opt3 = Optional.ofNullable(request.getParameter("order"));
    String order = opt3.orElse("ASC");

    // 파라미터 column이 전달되지 않은 경우 cloumn=CATEGORY_NO로 처리한다.
    Optional<String> opt4 = Optional.ofNullable(request.getParameter("columnorder"));
    String columnorder = opt4.orElse("CATEGORY_NO");
    
    // 파라미터 column이 전달되지 않은 경우 cloumn=CATEGORY_NO로 처리한다.
    Optional<String> opt5 = Optional.ofNullable(request.getParameter("query"));
    String query = opt5.orElse("");
    
    // 검색시 받는 정렬 칼럼
    Optional<String> opt6 = Optional.ofNullable(request.getParameter("columnsearch"));
    String columnsearch = opt6.orElse("CATEGORY_NO");
    
    
    
    Map<String, Object> map1 = new HashMap<String, Object>();
    map1.put("query", query);
    map1.put("columnsearch", columnsearch);
    
    // 전체 레코드 개수 구하기
    int totalRecord = adminMapper.getCategoryCountByQuery(map1);
    
    // 'recordPerPage' 값이 변경되었을 때, 현재 페이지의 데이터가 없는 경우를 확인합니다.
    
    int totalPage = (int) Math.ceil((double) totalRecord / recordPerPage);

    if ((page - 1) * recordPerPage >= totalRecord) {
        page = Math.max(totalPage, 1);
    }
    
    // 검색에 따라 
    // PageUtil(Pagination에 필요한 모든 정보 계산하기
    pageUtil.setPageUtil(page, totalRecord, recordPerPage);
    
    // DB로 보낼 Map 만기들기
    Map<String, Object> map2 = new HashMap<String, Object>();
    map2.put("begin", pageUtil.getBegin());
    map2.put("end", pageUtil.getEnd());
    map2.put("columnorder", columnorder);
    map2.put("columnsearch", columnsearch);
    map2.put("order", order);
    map2.put("query", query);
    
    // begin ~ end 사이의 목록 가져오기
    List<ProductCategoryDTO> categoryList = adminMapper.getCategoryListUsingPagination(map2);
    
    // category.jsp로 전달할 정보 저장하기
    model.addAttribute("categoryList", categoryList);
    
    // order의 값을 알고 있는 서비스에서 전달해주기.
    // column과 query 파라미터를 넘겨줘야 페이지가 바뀌어도 검색한 문자가 유지된다.
    model.addAttribute("pagination", pageUtil.getPagination(request.getContextPath() + "/admin/categoryList.form?columnorder=" +  columnorder + "&columnsearch=" +  columnsearch + "&order=" + order + "&query=" + query));
    model.addAttribute("beginNo", totalRecord - (page - 1) * recordPerPage);
    model.addAttribute("columnorder", columnorder);
    model.addAttribute("columnsearch", columnsearch);
    switch(order) {
    case "ASC" : model.addAttribute("order", "DESC"); break;  // 현재 ASC 정렬이므로 다음 정렬은 DESC이라고 Jsp에 알려준다.
    case "DESC" : model.addAttribute("order", "ASC"); break;  // 현재 ASC 정렬이므로 다음 정렬은 DESC이라고 Jsp에 알려준다.
    }
    
    model.addAttribute("page", page);
    model.addAttribute("query", query);
    
    // 마지막 페이지로 이동하는 경우 파라미터 값도 같이 변경합니다.
    if (page > totalPage) {
        // 마지막 페이지로 설정합니다.
        page = totalPage;
        // 파라미터 값을 변경합니다.
        map2.put("begin", pageUtil.getBegin());
        map2.put("end", pageUtil.getEnd());
    }
    
  }
  

  @Override
  public Map<String, Object> getAutoComplete(HttpServletRequest request) {
    
    Optional<String> opt2 = Optional.ofNullable(request.getParameter("query"));
    String query = opt2.orElse(""); 
    
    Map<String, Object> map = new HashMap <String, Object>();
    map.put("query", query);
    
    // 검색 결과 목록 가져오기
    List<ProductCategoryDTO> categoryComplete = adminMapper.getAutoComplete(map);
    
    // search.jsp로 응답할 데이터
    Map<String, Object> resultMap = new HashMap <String, Object>(); 
    resultMap.put("categoryComplete", categoryComplete);
    
    // 응답
    return resultMap;
  }
  
  @Override
  public ProductCategoryDTO getCategory(HttpServletRequest request) {
    
    int categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
    
    return adminMapper.getCategory(categoryNo);
  }

  @Override 
  public int addCategory(HttpServletRequest request) {
    
    ProductCategoryDTO productCategoryDTO = new ProductCategoryDTO();
    
    productCategoryDTO.setCategoryName(request.getParameter("categoryName"));
    
    
    return adminMapper.addCategory(productCategoryDTO);
    
  }
  
  @Override
  public int editCategory(HttpServletRequest request) {
    
    ProductCategoryDTO productCategoryDTO = new ProductCategoryDTO();
    
    productCategoryDTO.setCategoryNo(Integer.parseInt(request.getParameter("categoryNo")));
    productCategoryDTO.setCategoryName(request.getParameter("categoryName"));
    
    
    return adminMapper.editCategory(productCategoryDTO);
  }
  
  @Override
  public int removeCategory(HttpServletRequest request) {
    
    return adminMapper.removeCategory(Integer.parseInt(request.getParameter("categoryNo")));
  }
}
