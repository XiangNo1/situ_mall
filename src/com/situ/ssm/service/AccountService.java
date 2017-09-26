package com.situ.ssm.service;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.situ.ssm.dao.AccountDao;

@Service("accountService")
public class AccountService implements IAccountService {

	@Resource(name="accountDao")
	private AccountDao accountDao;
	
	@Override
	public void transfer(int fromAccout, int toAccount, int money) {
		 accountDao.decreaseMoney(fromAccout, money);
	       //发生了异常要回滚
	     //  int i = 1/0;
	       accountDao.increaseMoney(toAccount, money);

		
	}

}
