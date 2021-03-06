package com.shopping.entity;

import java.util.List;

public class CategoryThree {
	/**
	 * 三级菜单编号
	 */
	private Integer categoryThreeId;
	/**
	 * 二级菜单
	 */
	private CategoryTwo categoryTwo;
	/**
	 * 三级菜单名称
	 */
	private String categoryThreeName;

	/**
	 * 产品列表
	 */
	private List<Product> products;

	// getter --- setter
	public Integer getCategoryThreeId() {
		return categoryThreeId;
	}

	public void setCategoryThreeId(Integer categoryThreeId) {
		this.categoryThreeId = categoryThreeId;
	}

	public CategoryTwo getCategoryTwo() {
		return categoryTwo;
	}

	public void setCategoryTwo(CategoryTwo categoryTwo) {
		this.categoryTwo = categoryTwo;
	}

	public String getCategoryThreeName() {
		return categoryThreeName;
	}

	public void setCategoryThreeName(String categoryThreeName) {
		this.categoryThreeName = categoryThreeName;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

}
