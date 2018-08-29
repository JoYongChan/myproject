package com.naver.project.service;

import java.util.ArrayList;

import com.naver.project.entities.SaleProduct;

public interface SaleDAO {

	ArrayList<SaleProduct> selectSaleProductAll();

	void insertSaleProductRow(SaleProduct saleproduct);

	SaleProduct selectSaleProductRow(String saleprocode);

	void updateSaleProductRow(SaleProduct saleproduct);

	void deleteSaleProductRow(String saleprocode);

}
