package com.situ.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.UserDao;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.User;
import com.situ.mall.vo.PageBean;

@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private UserDao userDao;

	@Override
	public PageBean getPageBeanUser(int pageIndex, int pageSize) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalCount = userDao.findTotalCountUser();
		pageBean.setTotalCount(totalCount);
		int totalPage =(int) Math.ceil((double) totalCount / pageSize );
		pageBean.setTotalPage(totalPage);
		int index =( pageIndex - 1) * pageSize;
		List<Product> list = userDao.findUserBeanList(index, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public boolean addUser(User user) {
		// TODO Auto-generated method stub
		int i = userDao.addUser(user);
		return i>0?true:false;
	}

	@Override
	public boolean deleteUser(Integer id) {
		// TODO Auto-generated method stub
		int i = userDao.deleteUser(id);
		return i>0?true:false;
	}

	@Override
	public User findUserById(Integer id) {
		// TODO Auto-generated method stub
		return userDao.findUserById(id);
	}

	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		int i = userDao.updateUser(user);
		return i>0?true:false;
	}

	@Override
	public User findUserByUser(String user) {
		// TODO Auto-generated method stub
		return userDao.findUserByUser(user);
	}

	
}
