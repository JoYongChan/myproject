package com.naver.project.service;

import java.util.ArrayList;

import com.naver.project.entities.Product;
import com.naver.project.entities.ProductStock;

public interface ProductDAO {
	ArrayList<Product> selectProductAll();
	
	int selectUsingProcode(String procode);
	
	void productInsertRow(Product product);
	
	void productUpdateRow(Product product);

	void productDeleteRow(String procode);
	
	Product selectOneUsingProcode(String procode);

	ArrayList<ProductStock> selectProductStockAll();

	void productstockInsertRow(ProductStock productstock);

	int selectCurStockUsingStockid(String stockid);

	void addProductStock(ProductStock productstock);

	void close(ProductStock productstock);

	ProductStock selectProductStockOne(String stockid);

	void productstockDeleteRow(String stockid);

	void updateProductStockRow(ProductStock productstock);

	ProductStock selectLastProductStock(String procode);

	void updateProductStock(ProductStock productstock);

	
}
