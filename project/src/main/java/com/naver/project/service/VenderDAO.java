package com.naver.project.service;

import java.util.ArrayList;

import com.naver.project.entities.Vender;
import com.naver.project.entities.VenderProduct;

public interface VenderDAO {

	ArrayList<Vender> selectVenderAll();

	int insertVenderRow(Vender vender);

	int selectUsingVendercode(String vendercode);

	ArrayList<VenderProduct> selectVenderProductAll();
	
	int insertVenderProductRow(VenderProduct venderproduct);

	int selectUsingVenderProductcode(String venderproductcode);

	String selectVendername(String vendercode);

}
