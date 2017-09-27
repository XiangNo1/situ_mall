package com.situ.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.ProductDao;
import com.situ.mall.pojo.Product;
import com.situ.mall.vo.PageBean;

@Service
public class ProductServiceImpl implements IProductService {

	@Autowired
	private ProductDao productDao;

	@Override
	public PageBean getPageBeanproduct(int pageIndex, int pageSize) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalCount = productDao.findTotalCountProduct();
		pageBean.setTotalCount(totalCount);
		int totalPage =(int) Math.ceil((double) totalCount / pageSize );
		pageBean.setTotalPage(totalPage);
		int index =( pageIndex - 1) * pageSize;
		List<Product> list = productDao.findProductBeanList(index, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public void addProduct(Product product) {
		// TODO Auto-generated method stub
		productDao.addProduct(product);
	}

	@Override
	public void deleteProductById(Integer id) {
		// TODO Auto-generated method stub
		productDao.deleteProductById(id);
	}

	@Override
	public Product findProductById(Integer id) {
		// TODO Auto-generated method stub
		return productDao.findProductById(id);
	}

	@Override
	public void updateProduct(Product product) {
		// TODO Auto-generated method stub
		productDao.updateProduct(product);
	}

	
}
