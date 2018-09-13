package com.naver.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.project.entities.Vender;
import com.naver.project.entities.VenderProduct;
import com.naver.project.entities.VenderProductBuy;

public interface VenderDAO {

	ArrayList<Vender> selectVenderAll();

	void insertVenderRow(Vender vender);
	
	void updateVenderRow(Vender vender);
	
	void deleteVenderRow(String vendercode);

	int selectUsingVendercode(String vendercode);

	ArrayList<VenderProduct> selectVenderProductAll();
	
	int insertVenderProductRow(VenderProduct venderproduct);

	VenderProduct selectUsingVenderProductcode(String venderproductcode);

	String selectVendername(String vendercode);

	ArrayList<VenderProductBuy> selectVenderProductBuyAll();

	int selectSequenceNo(VenderProductBuy venderproductbuy);

	ArrayList<VenderProduct> selectVenderProduct(String vendercode);

	int insertVenderProductBuyRow(VenderProductBuy venderproductbuy);

	ArrayList<VenderProductBuy> selectBuySearchRollup(HashMap buysearch);

	ArrayList<VenderProductBuy> selectBuySearchRollupYY(HashMap buysearch);

	ArrayList<VenderProductBuy> selectBuySearchRollupMM(HashMap buysearch);

	Vender selectVenderUsingVendercode(String vendercode);

	VenderProductBuy selectVenderproductbuyOne(int buyid);

	void updateVenderProductBuyRow(VenderProductBuy venderproductbuy);

	void deleteVenderProductBuy(int buyid);

	void updateVenderProductRow(VenderProduct venderproduct);

	void deleteVenderProduct(String venderproductcode);

	int selectUsingVenderproductcode(String venderproductcode);

}
