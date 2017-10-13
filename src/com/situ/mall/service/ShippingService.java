package com.situ.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.ShippingDao;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.vo.PageBean;

@Service
public class ShippingService implements IShippingService{

	@Autowired
	private ShippingDao shippingDao;

	@Override
	public List<Shipping> findShippingByUserId(Integer id) {
		// TODO Auto-generated method stub
		return shippingDao.findShippingByUserId(id);
	}

	@Override
	public List<Shipping> findShipping() {
		// TODO Auto-generated method stub
		return shippingDao.findShipping();
	}

	@Override
	public PageBean getPageBeanShipping(int pageIndex, int pageSize) {
		PageBean<Shipping> pageBean = new PageBean<Shipping>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalCount = shippingDao.findTotalCountShipping();
		pageBean.setTotalCount(totalCount);
		int totalPage =(int) Math.ceil((double) totalCount / pageSize );
		pageBean.setTotalPage(totalPage);
		int index =( pageIndex - 1) * pageSize;
		List<Shipping> list = shippingDao.findShippingBeanList(index, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public boolean addShipping(Shipping shipping) {
		// TODO Auto-generated method stub
		int i = shippingDao.addShipping(shipping);
		return i>0?true:false;
	}

	@Override
	public boolean deleteShippingByid(Integer id) {
		// TODO Auto-generated method stub
		int i = shippingDao.deleteShippingByid(id);
		return i>0?true:false;
	}

	@Override
	public Shipping findShippingById(Integer id) {
		// TODO Auto-generated method stub
		return shippingDao.findShippingById(id);
	}

	@Override
	public boolean updateShipping(Shipping shipping) {
		// TODO Auto-generated method stub
		int i = shippingDao.updateShipping(shipping);
		return i>0?true:false;
	}
}
