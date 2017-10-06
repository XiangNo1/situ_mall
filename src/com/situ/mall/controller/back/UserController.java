package com.situ.mall.controller.back;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.situ.mall.pojo.User;
import com.situ.mall.service.IUserService;
import com.situ.mall.vo.PageBean;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	private IUserService userService;
	
	
	@RequestMapping(value="/updateUser2")
	public String updateUser2(User user){
		userService.updateUser(user);
		return "redirect:/user/findUser.action";
	}
	
	@RequestMapping(value="/updateUser")
	public String updateUser(Integer id, Model model){
		User user = userService.findUserById(id);
		model.addAttribute("user", user);
		return "updateUser";
	}
	
	@RequestMapping(value="/deleteUser")
	public String deleteUser(Integer id){
		userService.deleteUser(id);
		return "redirect:/user/findUser.action";
	}
	
	@RequestMapping(value="/addUser2")
	public String addUser2(User user){
		userService.addUser(user);
		return "redirect:/user/findUser.action";
	}
	
	@RequestMapping(value="/addUser")
	public String addUser(){
		return "addUser";
	}
	
	@RequestMapping(value="/findUser")
	public String findUser(String pageIndex, String pageSize,Model model) {
		int pageIndex1 = 1;
		if (pageIndex!= null && !pageIndex.equals("")) {
			pageIndex1 = Integer.parseInt(pageIndex);
		}
		int pageSize1 = 3;
		if (pageSize != null && !pageSize.equals("")) {
			pageSize1 = Integer.parseInt(pageSize);
		}
		PageBean pageBean = userService.getPageBeanUser(pageIndex1,pageSize1);
		System.out.println(pageBean);
		model.addAttribute("pageBean", pageBean);
		return "findUser";
	}

}
