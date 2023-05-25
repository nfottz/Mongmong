package com.gdu.mongmong.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.mongmong.domain.AddressDTO;
import com.gdu.mongmong.domain.CartDTO;
import com.gdu.mongmong.domain.OrderDTO;
import com.gdu.mongmong.domain.OrderDetailDTO;
import com.gdu.mongmong.domain.PointDetailDTO;
import com.gdu.mongmong.domain.ProductDTO;
import com.gdu.mongmong.domain.UserDTO;

@Mapper
public interface OrderMapper {
	
	public List<ProductDTO> getProdList();
	public ProductDTO selectProductByNo(int prodNo);
	public List<CartDTO> getCartList(Map<String, Object> cartMap);
	public CartDTO checkCart(CartDTO cartDTO); 
	public int addCart(CartDTO cartDTO);
	public int modifyCartAmount(CartDTO cartDTO);
	public int removeCartList(List<String> cartNoList);
	public AddressDTO getUserAddress(int userNo);
	public int addOrderContent(OrderDTO orderDTO);
	public OrderDTO getOrderByNo(Map<String, Object> map);
	public int addOrderDetail(OrderDetailDTO orderDetailDTO);
	public int addPoint(PointDetailDTO pointDetailDTO);
	public int afterOrderDeleteCart(Map<String, Object> map);
	public List<OrderDetailDTO> getOrderDetail(int orderNo);
}
