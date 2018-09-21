package com.naver.project.service;

import java.util.ArrayList;

import com.naver.project.entities.Storemanagement;

public interface StoremanagementDAO {
	int insertRow(Storemanagement storemanagement);
	int selectStoreConfirm(String storecode);
	ArrayList<Storemanagement> selectAll();
	Storemanagement selectOne(String storecode);
	int updateRow(Storemanagement storemanagement);
	int deleteRow(String storecode);
	Storemanagement login(Storemanagement storemanagement);
	
}
