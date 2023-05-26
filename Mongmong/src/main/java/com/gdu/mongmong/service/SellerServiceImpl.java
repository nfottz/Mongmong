package com.gdu.mongmong.service;



import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.mongmong.domain.ProductCategoryDTO;
import com.gdu.mongmong.domain.ProductDTO;
import com.gdu.mongmong.domain.UserDTO;
import com.gdu.mongmong.mapper.SellerMapper;
import com.gdu.mongmong.mapper.UserMapper;
import com.gdu.mongmong.util.MyFileUtil;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class SellerServiceImpl implements SellerService {
	
	private SellerMapper sellerMapper;
	private MyFileUtil myFileUtil;
	private UserMapper userMapper;
	
	@Transactional(readOnly = true)
	@Override
	public int prodAdd(MultipartHttpServletRequest multipartRequest) {
			String prodName = multipartRequest.getParameter("prodName");
			String prodContent = multipartRequest.getParameter("prodContent");
			String prodPrice = multipartRequest.getParameter("prodPrice");
			String prodStock = multipartRequest.getParameter("prodStock");
			
			ProductDTO productDTO = new ProductDTO();
			productDTO.setProdName(prodName);
			productDTO.setProdContent(prodContent);
			productDTO.setProdPrice(0);
			productDTO.setProdStock(0);
			
			int addResult = sellerMapper.prodAdd(productDTO);
			
			
			
		return addResult;
	}
	
	@Transactional(readOnly = true)
	@Override
	public int prodUpload(MultipartHttpServletRequest multipartRequest) {
		
		String prodName = multipartRequest.getParameter("prodName");
		String prodContent = multipartRequest.getParameter("prodContent");
		String categoryNo = multipartRequest.getParameter("categoryNo");
		String prodStock = multipartRequest.getParameter("prodStock");
		String prodPrice = multipartRequest.getParameter("prodPrice");
		String prodImg = multipartRequest.getParameter("prodImg");
		String prodDeleted = multipartRequest.getParameter("prodDeleted");
		String prodRegDate = multipartRequest.getParameter("prodRegDate");
		String prodModDate = multipartRequest.getParameter("prodModDate");
		
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProdName(prodName);
		productDTO.setProdContent(prodContent);
		productDTO.setProdStock(0);
		productDTO.setProdPrice(0);
		productDTO.setProdDeleted(0);
		productDTO.setProdRegDate(null);
		productDTO.setProdModDate(null);
		
		int addResult = sellerMapper.prodAdd(productDTO);
		
		List<MultipartFile> files = multipartRequest.getFiles("files");
		
		for(MultipartFile multipartFile : files) {
			
			if(multipartFile != null && multipartFile.isEmpty() == false) {
				
				try {
					
					String path = myFileUtil.getPath();
					
					File dir = new File(path);
					if(dir.exists() == false) {
						dir.mkdirs();
						
					} 
					String originName = multipartFile.getOriginalFilename();
					originName = originName.substring(originName.lastIndexOf("\\") + 1);
					String filesystemName = myFileUtil.getFilesystemName(originName);
					File file = new File(dir, filesystemName);
					multipartFile.transferTo(file);
					
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		return addResult;
	}
	
	@Override
	public int modifyId(UserDTO userDTO) {
		int modifyResult = sellerMapper.modifyId(userDTO);
		return modifyResult;
	}
	
	@Override
	public void getProdList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		int userNo = userMapper.selectUserById(loginId).getUserNo();
		List<ProductDTO> prodList = sellerMapper.selectProdList(userNo);
		model.addAttribute("prodList", prodList);
	}
	
	@Override
	public List<ProductCategoryDTO> cateList() {
			
		return sellerMapper.cateList();
	}
}

