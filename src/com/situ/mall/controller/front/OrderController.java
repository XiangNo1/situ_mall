package com.situ.mall.controller.front;

import java.io.IOException;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.situ.mall.constant.MallConstant;
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
import com.situ.mall.vo.PageBean;

import jdk.nashorn.internal.ir.Flags;

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
	@RequestMapping(value="/findOrderItem")
	public String findOrderItem(Long order_no, Model model){
		List<OrderItem> list = orderItemService.findOrderItemByorder_no(order_no);
		model.addAttribute("list", list);
		return "findOrderItem";
	}
	
	@RequestMapping(value="/pay")
	public String pay(){
		
		return "order2";
	}
	
	@RequestMapping(value="/myorder")
	public ModelAndView myorder(String pageIndex, HttpServletRequest request,ModelAndView modelAndView) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userSession");
		int pageIndex1 = 1;
		if (pageIndex!= null && !pageIndex.equals("")) {
			pageIndex1 = Integer.parseInt(pageIndex);
		}
		int pageSize1 = 5;
		PageBean pageBean = orderService.getPageBeanorder(user.getId(),pageIndex1,pageSize1);
		System.out.println(pageBean);
		//List<Order> orders = orderService.findOrderByUser(user.getId());
		modelAndView.addObject("pageBean", pageBean);
		List<OrderItem> orderItems = orderItemService.findOrderItemByUser(user.getId());
		modelAndView.addObject("orderItems", orderItems);
		modelAndView.setViewName("myOrderList");
		return modelAndView;
	}
	
	@RequestMapping(value="/order")
	public String order(Model model,Integer[] ids, HttpServletRequest request, HttpServletResponse response){
		for (Integer integer : ids) {
			System.out.println(integer);
		}
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
		BuyCartVO buyCartVO2 = buyCartVO;
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userSession");
		for (int id : ids) {
			for (CartItemVO cartItemVO : buyCartVO2.getItems()) {
				if(id == cartItemVO.getProduct().getId()){
					Product product = productService.findProductById(cartItemVO.getProduct().getId());
					cartItemVO.getProduct().setName(product.getName());
					cartItemVO.getProduct().setPrice(product.getPrice());
					cartItemVO.getProduct().setMain_image(product.getMain_image());
				}
			}
		}
		
		Iterator<CartItemVO> iterator = buyCartVO2.getItems().iterator();
		while(iterator.hasNext()){
			boolean flag = false;
			for(int id : ids){
				if (iterator.next().getProduct().getId() == id) {
					flag = true;
				}
			}
			if (!flag) {
				iterator.remove();
			}
		}
		System.out.println("buyCartVO2");
		System.out.println(buyCartVO2);
		model.addAttribute("buyCartVO", buyCartVO2);
		//shapping 收货地址
		List<Shipping> shippings = shippingService.findShippingByUserId(user.getId());
		model.addAttribute("shippings", shippings);
		String idss = "";
		for (Integer integer : ids) {
			idss = idss + integer + ",";
		}
		model.addAttribute("ids", idss);

		return "order";
	}
	
	@RequestMapping(value="/order2")
	public String order2(String idsss, Integer[] shipping_id,Integer payment_type, HttpServletRequest request,HttpServletResponse response, Model model){
		System.out.println(idsss);
		String[] iddd = idsss.split(",");
		for (String string : iddd) {
			System.out.println(string);
		}
		Integer[] idss = new Integer[iddd.length];
		for(int i = 0 ; i < iddd.length; i++){
			idss[i] = Integer.parseInt(iddd[i]);
		}
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
		for (Integer idsssss : shipping_id) {
			i = idsssss;
		}
		System.out.println(payment_type);
		System.out.println(i);
		order.setShipping_id(i);
		order.setPayment(new BigDecimal(buyCartVO.getTotalPrice()));
		order.setPayment_type(payment_type);
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
			System.out.println(orderItem);
			orderItemService.addOrderItem(orderItem);
		}
		//4.生成订单后要清楚cookie
	       /*Cookie cookie = new Cookie(MallConstant.BUY_CART_COOKIE,null);
	       cookie.setPath("/");
	       cookie.setMaxAge(0);
	       response.addCookie(cookie);*/
			Iterator<CartItemVO> iterator = buyCartVO.getItems().iterator();
			while(iterator.hasNext()){
				boolean flag = false;
				for(int id : idss){
					if (iterator.next().getProduct().getId() == id) {
						flag = true;
					}
				}
				if (flag) {
					iterator.remove();
				}
			}
			//把购物车对象BuyCartVO以json形式写到cookie里面
			StringWriter stringWriter = new StringWriter();
		    try {
				objectMapper.writeValue(stringWriter, buyCartVO);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			//将购物车json数据放到cookie里面
			Cookie cookie = new Cookie("buy_cart_cookie", stringWriter.toString());
			//默认关闭浏览器cookie销毁
			cookie.setMaxAge(60 * 60 * 24);
			
			cookie.setPath("/");
			
			//将cookie发送给浏览器
			response.addCookie(cookie);
	       
	       
	       
	       Shipping shipping = shippingService.findShippingById(i);
	       session.setAttribute("shipping_session", shipping);
	       session.setAttribute("order_session", order);
	      /* model.addAttribute("shipping", shipping);
	       model.addAttribute("order", order);*/
		return "pay_info";
	}
}
