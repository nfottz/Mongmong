package com.gdu.mongmong.service;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.mongmong.domain.AddressDTO;
import com.gdu.mongmong.domain.LeaveUserDTO;
import com.gdu.mongmong.domain.SellerFilesDTO;
import com.gdu.mongmong.domain.UserDTO;
import com.gdu.mongmong.mapper.UserMapper;
import com.gdu.mongmong.util.JavaMailUtil;
import com.gdu.mongmong.util.MyFileUtil;
import com.gdu.mongmong.util.SecurityUtil;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	private UserMapper userMapper;
	private JavaMailUtil javaMailUtil;
	private SecurityUtil securityUtil;
	private MyFileUtil myFileUtil;
	
	@Override
	public void login(HttpServletRequest request, HttpServletResponse response) {
		
		String url = request.getParameter("url");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		pw = securityUtil.getSha256(pw);
		
		UserDTO userDTO = new UserDTO();
		userDTO.setUserId(id);
		userDTO.setUserPw(pw);
		
		UserDTO loginUserDTO = userMapper.selectUserByUserDTO(userDTO);
		
		if(loginUserDTO != null) {
			autoLogin(request, response);
			
			HttpSession session = request.getSession();
			session.setAttribute("loginId", id);
			session.setAttribute("userType", loginUserDTO.getUserType());
			session.setAttribute("userName", loginUserDTO.getUserName());
			System.out.println(loginUserDTO.getUserType());
			System.out.println(loginUserDTO.getUserName());
			int updateResult = userMapper.updateUserAccess(id);
			
			if(updateResult == 0) {
				userMapper.insertUserAccess(id);
			}
			
			try {
				response.sendRedirect(url);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			
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
	public void autoLogin(HttpServletRequest request, HttpServletResponse response) {
	
		String id = request.getParameter("id");
		String chkAutoLogin = request.getParameter("chkAutoLogin");
		
		if(chkAutoLogin != null) {
			HttpSession session = request.getSession();
			String sessionId = session.getId();
			
			UserDTO userDTO = new UserDTO();
			userDTO.setUserId(id);
			userDTO.setAutologinId(sessionId);
			userDTO.setAutologinExpiredAt(new Date(System.currentTimeMillis() + 3600 * 24 * 15 * 1000));
			userMapper.insertAutoLogin(userDTO);
			
			Cookie cookie = new Cookie("autoLoginId", sessionId);
			cookie.setMaxAge(3600 * 24 * 15);
			cookie.setPath(request.getContextPath());
			response.addCookie(cookie);
			
		} else {
			userMapper.deleteAutoLogin(id);
			Cookie cookie = new Cookie("autoLoginId", "");
			cookie.setMaxAge(0);
			cookie.setPath(request.getContextPath());
			response.addCookie(cookie);
		}
	}
	
	@Override
	public Map<String, Object> verifyId(String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enableId", userMapper.selectUserById(id) == null && userMapper.selectRestUserById(id) == null && userMapper.selectLeaveUserById(id) == null);
		return map;
	}
	
	@Override
	public Map<String, Object> verifyEmail(String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enableEmail", userMapper.selectUserByEmail(email) == null && userMapper.selectRestUserByEmail(email) == null && userMapper.selectLeaveUserByEmail(email) == null);
		return map;
	}
	
	@Override
	public Map<String, Object> sendAuthCode(String email) {
		String authCode = securityUtil.getRandomString(6, true, true);
		javaMailUtil.sendJavaMail(email, "[몽몽]회원가입 인증번호", "인증번호는 <strong>" + authCode + "</strong> 입니다.");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("authCode", authCode);
		return map;
	}
	
	@Transactional(readOnly=true)
	@Override
	public void join(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		int userType = Integer.parseInt(multipartRequest.getParameter("userType"));
		String id = multipartRequest.getParameter("id");
		String pw = multipartRequest.getParameter("pw");
		String name = multipartRequest.getParameter("name");
		String contact = multipartRequest.getParameter("contact");
		String emailAddr = multipartRequest.getParameter("emailAddr");
		String domain = multipartRequest.getParameter("domain");
		String gender = multipartRequest.getParameter("gender");
		String birthyear = multipartRequest.getParameter("birthyear");
		String birthmonth = multipartRequest.getParameter("birthmonth");
		String birthdate = multipartRequest.getParameter("birthdate");
		String location = multipartRequest.getParameter("location");
		String event = multipartRequest.getParameter("event");
		String sellerName = multipartRequest.getParameter("businessName");
		String sellerNo = multipartRequest.getParameter("businessNo");
		String businessyear = multipartRequest.getParameter("businessYear");
		String businessMonth = multipartRequest.getParameter("businessMonth");
		String businessDate = multipartRequest.getParameter("businessDate");
		String sellerOpenDate = businessyear + businessMonth + businessDate;
		
		pw = securityUtil.getSha256(pw);
		name = securityUtil.preventXSS(name);
		birthdate = birthmonth + birthdate;
		String email = emailAddr + "@" + domain;
		int agreecode = 0;
		if(location.isEmpty() == false) agreecode++;
		if(event.isEmpty() == false) agreecode += 2;
		
		UserDTO userDTO = new UserDTO();
		userDTO.setUserType(userType);
		userDTO.setUserId(id);
		userDTO.setUserPw(pw);
		userDTO.setUserName(name);
		userDTO.setContact(contact);
		userDTO.setEmail(email);
		userDTO.setGender(gender);
		userDTO.setBirthyear(birthyear);
		userDTO.setBirthDate(birthdate);
		userDTO.setAgreecode(agreecode);
		userDTO.setSellerName(sellerName);
		userDTO.setSellerCertif(sellerNo);
		userDTO.setSellerOpenDate(sellerOpenDate);
		
		int insertUserResult = userMapper.insertUser(userDTO);
		
		String postcode = multipartRequest.getParameter("postcode");
		String roadAddress = multipartRequest.getParameter("roadAddress");
		String jibunAddress = multipartRequest.getParameter("jibunAddress");
		String detailAddress = multipartRequest.getParameter("detailAddress");
		String extraAddress = multipartRequest.getParameter("extraAddress");
		
		if(postcode.isEmpty() == false) {
			
		AddressDTO addressDTO = new AddressDTO();
		addressDTO.setUserNo(userDTO.getUserNo());
		addressDTO.setAddrName(name);
		addressDTO.setAddrContact(contact);
		addressDTO.setAddrDefault(1);
		addressDTO.setPostcode(postcode);
		addressDTO.setRoadAddress(roadAddress);
		addressDTO.setJibunAddress(jibunAddress);
		addressDTO.setDetailAddress(detailAddress);
		addressDTO.setExtraAddress(extraAddress);
		
		userMapper.insertAddress(addressDTO);

		}
		
		if(userType == 3) {
  		MultipartFile file = multipartRequest.getFile("businessFile");
  		if(file != null) {
  			try {
  				String path = myFileUtil.getPath();
  				File dir = new File(path);
  				if(dir.exists() == false) {
  					dir.mkdirs();
  				}
  				String filesystemName = myFileUtil.getFilesystemName(file.getName());
  				File sellerFile = new File(dir, filesystemName);
  				file.transferTo(sellerFile);
  				
  				SellerFilesDTO sellerFilesDTO = new SellerFilesDTO();
  				sellerFilesDTO.setUserNo(userDTO.getUserNo());
  				sellerFilesDTO.setSellerFilePath(path);
  				sellerFilesDTO.setSellerFileSystemName(filesystemName);
  				
  				userMapper.insertSellerFile(sellerFilesDTO);
  				
  			} catch (Exception e) {
  				e.printStackTrace();
  			}
  		}		
		}
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			if(insertUserResult == 1) {
				out.println("alert('회원 가입되었습니다.')");
				out.println("location.href='" + multipartRequest.getContextPath() + "/index.do';");
			} else {
				out.println("alert('회원 가입에 실패했습니다.')");
				out.println("history.go(-2);");
			}
			out.println("</script>");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginId");
		userMapper.deleteAutoLogin(id);
		
		Cookie cookie = new Cookie("autoLoginId", "");
		cookie.setMaxAge(0);
		cookie.setPath(request.getContextPath());
		response.addCookie(cookie);
		
		session.invalidate();
		
	}
	
	@Transactional(readOnly=true)
	@Override
	public void leave(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginId");
		
		UserDTO userDTO = userMapper.selectUserById(id);
		String[] reasonArr = request.getParameterValues("reason");
		int reason = 0;
		if(reasonArr.length != 0) {
			for(int i = 0; i < reasonArr.length; i++) {
				reason += Integer.parseInt(reasonArr[i]);
			}
		}
		String message = request.getParameter("msg");
		
		LeaveUserDTO leaveUserDTO = new LeaveUserDTO();
		leaveUserDTO.setUserId(id);
		leaveUserDTO.setEmail(userDTO.getEmail());
		leaveUserDTO.setJoinedAt(userDTO.getJoinedAt());
		leaveUserDTO.setReason(reason);
		leaveUserDTO.setMessage(message);
		
		int insertResult = userMapper.insertLeaveUser(leaveUserDTO);
		int deleteResult = userMapper.deleteUser(id);
		
		try {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			if(insertResult == 1 && deleteResult == 1) {
				session.invalidate();
				out.println("alert('회원탈퇴되었습니다.');");
				out.println("location.href='" + request.getContextPath() + "/index.do';");
			}else {
				out.println("alert('회원 탈퇴에 실패하였습니다.');");
				out.println("history.back();");
			}
			out.println("</script>");
			out.flush();
			out.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Transactional(readOnly=true)
	@Override
	public void active(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("restUserId");
	
		int insertResult = userMapper.insertRestoreUser(id);
		int deleteResult = userMapper.deleteRestUser(id);
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			if(insertResult == 0 && deleteResult == 0) {
				session.removeAttribute("restUserId");
				out.println("alert('휴면 계정이 복구되었습니다. 휴면 계정 활성화를 위해서 곧바로 로그인 해주세요.');");
				out.println("location.href='" + request.getContextPath() + "/index.do';");
			} else {
				out.println("alert('휴면 계정이 복구되지 않았습니다. 다시 시도해주세요.');");
				out.println("history.back();");
			}
			out.println("</script>");
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void restUserHandle() {
		int insertResult = userMapper.insertRestUser();
		if(insertResult > 0) {
			userMapper.deleteUserForRest();
		}
	}
	
	@Override
	public Map<String, Object> findId(UserDTO userDTO) {
		Map<String, Object> user = new HashMap<String, Object>();
		user.put("findUser", userMapper.selectUserByNameAndEmail(userDTO));
		return user;
	}
	
}
