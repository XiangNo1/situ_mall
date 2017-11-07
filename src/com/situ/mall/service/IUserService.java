package com.situ.mall.service;


import com.situ.mall.pojo.User;
import com.situ.mall.vo.PageBean;

public interface IUserService {

	PageBean getPageBeanUser(int pageIndex, int pageSize);

	boolean addUser(User user);

	boolean deleteUser(Integer id);

	User findUserById(Integer id);

	boolean updateUser(User user);

	User findUserByUser(String user);

	boolean checkUsername(String username);

	User findUserByUser2(String user);

}
