package com.naver.project.service;

import java.util.ArrayList;

import com.naver.project.entities.Product;
import com.naver.project.entities.ProductStock;

public interface ProductDAO {
	ArrayList<Product> selectProductAll();
	
	int selectUsingProcode(String procode);
	
	int productInsertRow(Product product);
	
	Product selectOneUsingProcode(String procode);

	ArrayList<ProductStock> selectProductStockAll();
}
