package com.gdu.mongmong.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.mongmong.domain.AddressDTO;
import com.gdu.mongmong.domain.LeaveUserDTO;
import com.gdu.mongmong.domain.RestUserDTO;
import com.gdu.mongmong.domain.SellerFilesDTO;
import com.gdu.mongmong.domain.UserDTO;

@Mapper
public interface UserMapper {

	public UserDTO selectUserByUserDTO(UserDTO userDTO);
	public UserDTO selectUserById(String id);
	public RestUserDTO selectRestUserById(String id);
	public LeaveUserDTO selectLeaveUserById(String id);
	public UserDTO selectUserByEmail(String email);
	public RestUserDTO selectRestUserByEmail(String email);
	public LeaveUserDTO selectLeaveUserByEmail(String email);
	public int insertUser(UserDTO userDTO);
	public int insertAddress(AddressDTO addressDTO);
	public int insertSellerFile(SellerFilesDTO sellerFilesDTO);
	public int insertAutoLogin(UserDTO userDTO);
	public int deleteAutoLogin(String id);
	public int updateUserAccess(String id);
	public int insertUserAccess(String id);
	public UserDTO selectAutologin(String autoLoginId);
	public int insertLeaveUser(LeaveUserDTO leaveUserDTO);
	public int deleteUser(String id);
	public int insertRestUser();
	public int deleteUserForRest();
	public int insertRestoreUser(String id);
	public int deleteRestUser(String id);
	
}
