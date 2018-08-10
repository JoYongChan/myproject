package com.naver.project.service;

import java.util.ArrayList;

import com.naver.project.entities.Vender;
import com.naver.project.entities.VenderProduct;
import com.naver.project.entities.VenderProductBuy;

public interface VenderDAO {

	ArrayList<Vender> selectVenderAll();

	int insertVenderRow(Vender vender);

	int selectUsingVendercode(String vendercode);

	ArrayList<VenderProduct> selectVenderProductAll();
	
	int insertVenderProductRow(VenderProduct venderproduct);

	VenderProduct selectUsingVenderProductcode(String venderproductcode);

	String selectVendername(String vendercode);

	ArrayList<VenderProductBuy> selectVenderProductBuyAll();

}
