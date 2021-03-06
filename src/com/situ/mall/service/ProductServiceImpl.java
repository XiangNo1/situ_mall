package com.situ.mall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.common.ServerResponse;
import com.situ.mall.dao.ProductDao;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.vo.PageBean;
import com.situ.mall.vo.SearchProductByCondition;

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
	public ServerResponse addProduct(Product product) {
		// TODO Auto-generated method stub
		try {
 			int rowCount = productDao.addProduct(product);
 			if (rowCount > 0) {
 				return ServerResponse.createSuccess("添加商品成功");
 			} else {
 				return ServerResponse.createError("添加商品失败");
 			}
 		} catch (Exception e) {
 			return ServerResponse.createError("添加商品失败");
 		}
	}

	@Override
	public ServerResponse deleteProductById(Integer id) {
		// TODO Auto-generated method stub
		try {
			int rowCount = productDao.deleteProductById(id);
			if (rowCount > 0) {
				return ServerResponse.createSuccess("删除商品成功");
			}
			else {
				return ServerResponse.createError("删除商品失败");
			}
		} catch (Exception e) {
			return ServerResponse.createError("删除商品失败");
		}
	}

	@Override
	public Product findProductById(Integer id) {
		// TODO Auto-generated method stub
		return productDao.findProductById(id);
	}

	@Override
	public ServerResponse updateProduct(Product product) {
		// TODO Auto-generated method stub
		try {
			int i = productDao.updateProduct(product);
			if (i > 0) {
				return ServerResponse.createSuccess("修改商品成功");
			} else {
				return ServerResponse.createError("修改商品失败");
			}
		} catch (Exception e) {
			return ServerResponse.createError("修改商品失败");
		}
	}

	@Override
	public boolean updateStatusProduct(Integer id, Integer status) {
		int i = productDao.updateStatusProduct(id, status);
		return i > 0 ? true : false;
	}

	@Override
	public PageBean getProductSearchPageBean(SearchProductByCondition searchCondition) {
		int pageIndex = searchCondition.getPageIndex();
		int pageSize = searchCondition.getPageSize();
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalCount = productDao.findTotalCountSearchProduct(searchCondition);
		pageBean.setTotalCount(totalCount);
		int totalPage =(int) Math.ceil((double) totalCount / pageSize );
		pageBean.setTotalPage(totalPage);
		int index =( pageIndex - 1) * pageSize;
		List<Product> list = productDao.findSearchProductBeanList(index, searchCondition);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public List<Category> selectFirst() {
		// TODO Auto-generated method stub
		return productDao.selectFirst();
	}

	@Override
	public List<Category> selectSecond(Integer id) {
		// TODO Auto-generated method stub
		return productDao.selectSecond(id);
	}

	@Override
	public boolean upProductById(Integer id) {
		int i = productDao.upProductById(id);
		return i>0?true:false;
	}

	@Override
	public boolean downProductById(Integer id) {
		int i = productDao.downProductById(id);
		return i>0?true:false;
	}

	@Override
	public Category findCategoryById(Integer id) {
		// TODO Auto-generated method stub
		return productDao.findCategoryById(id);
	}

	@Override
	public List<Product> findProductByCategoryId(Integer parent_id) {
		// TODO Auto-generated method stub
		return productDao.findProductByCategoryId(parent_id);
	}

	@Override
	public PageBean getPageBeanproductByid(int pageIndex, int pageSize, Integer id, String name) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalCount = productDao.findTotalCountProductByid(id, name);
		pageBean.setTotalCount(totalCount);
		int totalPage =(int) Math.ceil((double) totalCount / pageSize );
		pageBean.setTotalPage(totalPage);
		int index =( pageIndex - 1) * pageSize;
		List<Product> list = productDao.findProductBeanListByid(index, pageSize, id, name);
		pageBean.setList(list);
		return pageBean;
	}

	
}
