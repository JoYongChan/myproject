package com.naver.project.service;

import java.util.ArrayList;

import com.naver.project.entities.Product;
import com.naver.project.entities.Table;

public interface TableDAO {
	
	int selectSequenceNo(Table table);
	
	String[] selectProductCategory();
	
	ArrayList<Product> selectProduct(String category);
	
	ArrayList<Table> selectProductOrder(int tableno);
	
	int insertTable(Table table);
	
	int insertTableOrder(int seq);
	
	ArrayList<Table> selectTable();
	
	int completeTableOrder(int tableno);
	
}
