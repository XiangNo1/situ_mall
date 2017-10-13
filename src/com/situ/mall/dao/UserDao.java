package com.situ.mall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.User;

public interface UserDao {

	int findTotalCountUser();

	List<User> findUserBeanList(@Param(value="index")int index, @Param(value="pageSize")int pageSize);

	int addUser(User user);

	int deleteUser(Integer id);

	User findUserById(Integer id);

	int updateUser(User user);

	User findUserByUser(String user);

	int checkUsername(String username);

	
}
