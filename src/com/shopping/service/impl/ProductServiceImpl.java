package com.shopping.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shopping.dao.ProductDao;
import com.shopping.entity.Page;
import com.shopping.entity.Product;
import com.shopping.entity.SearchCondition;
import com.shopping.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	@Resource
	private ProductDao pDao;

	@Override
	public Product getProductById(Long id) {
		if (id == null) {
			return null;
		}
		Product product = pDao.getProductById(id);
		System.out.println(id);
		System.out.println(product);
		return product;
	}

	@Override
	public Page<Map<String, Object>> getProductListByCondition(SearchCondition sc) {
		Page<Map<String, Object>> page = new Page<>(sc.getPageNo());
		sc.setKeywords("%" + sc.getKeywords() + "%");
		List<Map<String, Object>> products = pDao.getProductListByCondition(sc, page);
		page.setData(products);
		Integer rowTotal = pDao.getProductListCountByCondition(sc, page);
		page.setRowTotal(rowTotal);
		return page;
	}
}
