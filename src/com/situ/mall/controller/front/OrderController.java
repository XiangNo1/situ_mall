package com.situ.mall.controller.front;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.pojo.User;
import com.situ.mall.service.IOrderItemService;
import com.situ.mall.service.IOrderService;
import com.situ.mall.service.IProductService;
import com.situ.mall.service.IShippingService;
import com.situ.mall.vo.BuyCartVO;
import com.situ.mall.vo.CartItemVO;

@Controller
@RequestMapping(value="/order")
public class OrderController {

	
	@Autowired
	private IOrderService orderService;
	@Autowired
	private IProductService productService;
	@Autowired
	private IShippingService shippingService;
	@Autowired
	private IOrderItemService orderItemService;
	
	
	@RequestMapping(value="/order")
	public String order(Model model, HttpServletRequest request){
		//从cookie获取buyCartVO
		//springmvc
		ObjectMapper objectMapper = new ObjectMapper();
		//只有对象里面不是null的才转换
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		BuyCartVO buyCartVO = null;
		Cookie[] cookies = request.getCookies();
		//1.如果cookie有这个购物车对象，那就从cookie里面取出这个购物车对象
		if (null != cookies && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if ("buy_cart_cookie".equals(cookie.getName())) {
					//之前已经有购物车
					//"{\"items\":[{\"product\":{\"id\":45},\"amount\":1}],\"productId\":45}"
					String value = cookie.getValue();
					try {
						buyCartVO = objectMapper.readValue(value, BuyCartVO.class);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userSession");
		for (CartItemVO cartItemVO : buyCartVO.getItems()) {
			Product product = productService.findProductById(cartItemVO.getProduct().getId());
			cartItemVO.getProduct().setName(product.getName());
			cartItemVO.getProduct().setPrice(product.getPrice());
			cartItemVO.getProduct().setMain_image(product.getMain_image());
		}
		model.addAttribute("buyCartVO", buyCartVO);
		//shapping 收货地址
		List<Shipping> shippings = shippingService.findShippingByUserId(user.getId());
		model.addAttribute("shippings", shippings);
		return "order";
	}
	
	@RequestMapping(value="/order2")
	public String order2(Integer[] shipping_id, HttpServletRequest request, Model model){
		//从cookie获取buyCartVO
		//springmvc
		ObjectMapper objectMapper = new ObjectMapper();
		//只有对象里面不是null的才转换
		objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		BuyCartVO buyCartVO = null;
		Cookie[] cookies = request.getCookies();
		//1.如果cookie有这个购物车对象，那就从cookie里面取出这个购物车对象
				if (null != cookies && cookies.length > 0) {
					for (Cookie cookie : cookies) {
						if ("buy_cart_cookie".equals(cookie.getName())) {
							//之前已经有购物车
							//"{\"items\":[{\"product\":{\"id\":45},\"amount\":1}],\"productId\":45}"
							String value = cookie.getValue();
							try {
								buyCartVO = objectMapper.readValue(value, BuyCartVO.class);
							} catch (IOException e) {
								e.printStackTrace();
							}
						}
					}
				}
		for (CartItemVO cartItemVO : buyCartVO.getItems()) {
			Product product = productService.findProductById(cartItemVO.getProduct().getId());
			cartItemVO.getProduct().setName(product.getName());
			cartItemVO.getProduct().setPrice(product.getPrice());
			cartItemVO.getProduct().setMain_image(product.getMain_image());
		}
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userSession");
		//order
		Order order = new Order();
		order.setOrder_no(new Date().getTime());
		order.setUser_id(user.getId());
		Integer i = null;
		for (Integer ids : shipping_id) {
			i = ids;
		}
		System.out.println(i);
		order.setShipping_id(i);
		order.setPayment(new BigDecimal(buyCartVO.getTotalPrice()));
		order.setPayment_type(1);
		order.setPostage(0);
		order.setStatus(10);
		orderService.addOrder(order);
		//order_item
		for (CartItemVO cartItemVO : buyCartVO.getItems()) {
			Product product = productService.findProductById(cartItemVO.getProduct().getId());
			OrderItem orderItem = new OrderItem();
			orderItem.setUser_id(user.getId());
			orderItem.setOrder_no(order.getOrder_no());
			orderItem.setProduct_id(product.getId());
			orderItem.setProduct_name(product.getName());
			orderItem.setProduct_image(product.getMain_image());
			orderItem.setCurrent_unit_price(product.getPrice());
			orderItem.setQuantity(cartItemVO.getAmount());
			orderItem.setTotal_price(new BigDecimal(cartItemVO.getAmount() * product.getPrice().doubleValue()));
			orderItemService.addOrderItem(orderItem);
		}
		
		return "order2";
	}
}