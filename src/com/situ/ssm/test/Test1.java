package com.situ.ssm.test;

import javax.annotation.Resource;

import org.junit.Test;

import com.situ.ssm.service.IAccountService;

public class Test1 {

	 @Resource(name="accountService")
	    private IAccountService accountService;
	    
	    @Test
	    public void testTransfer() {
	       accountService.transfer(1, 2, 200);
	    }


}
