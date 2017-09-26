package com.situ.ssm.dao;

import org.apache.ibatis.annotations.Param;

public interface AccountDao {

	/**
     * 转钱到指定的账户
     * @param account 转入的账户
     * @param money 转入的金额
     */
    public void increaseMoney(@Param("account")int account, @Param("money")int money);
    /**
     * 从账户转出钱
     * @param account 要转出的账户
     * @param money 转出的金额
     */
    public void decreaseMoney(@Param("account")int account, @Param("money")int money);

}
