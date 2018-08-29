package com.naver.project;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.naver.project.entities.SaleProduct;
import com.naver.project.service.SaleDAO;

@Controller
public class SaleController {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private SaleProduct saleproduct;
	
//	-----------------------------------------------------------------
	@RequestMapping(value = "/saleproductList", method = RequestMethod.GET)
	public String saleproductList(Model model) {
		SaleDAO dao = sqlSession.getMapper(SaleDAO.class);
		ArrayList<SaleProduct> saleproducts = dao.selectSaleProductAll();
		model.addAttribute("saleproducts", saleproducts);
		return "sale/saleproduct_list";
	}

	@RequestMapping(value = "/saleproductInsertForm", method = RequestMethod.GET)
	public String saleproductInsertForm(Model model) {
		return "sale/saleproduct_insert_form";
	}
	
	@RequestMapping(value = "/saleproductInsert", method = RequestMethod.POST)
	public String saleproductInsert(@ModelAttribute SaleProduct saleproduct) {
		SaleDAO dao = sqlSession.getMapper(SaleDAO.class);
		try {
			dao.insertSaleProductRow(saleproduct);
		}
		catch(Exception e) {
			System.out.println("saleproductInsert error : " + e.getMessage());
		}
		return "redirect:saleproductList";
	}
	
	@RequestMapping(value = "/saleproductUpdateForm", method = RequestMethod.GET)
	public String saleproductUpdateForm(Model model, @RequestParam String saleprocode) {
		SaleDAO dao = sqlSession.getMapper(SaleDAO.class);
		SaleProduct saleproduct = dao.selectSaleProductRow(saleprocode);
		model.addAttribute("saleproduct", saleproduct);
		return "sale/saleproduct_update_form";
	}
	
	@RequestMapping(value = "/saleproductUpdate", method = RequestMethod.POST)
	public String saleproductUpdate(@ModelAttribute SaleProduct saleproduct) {
		SaleDAO dao = sqlSession.getMapper(SaleDAO.class);
		try {
			dao.updateSaleProductRow(saleproduct);
		}
		catch(Exception e) {
			System.out.println("saleproductUpdate error : " + e.getMessage());
		}
		return "redirect:saleproductList";
	}
	
	@RequestMapping(value = "/saleproductDelete", method = RequestMethod.GET)
	public String saleproductDelete(@RequestParam String saleprocode) {
		SaleDAO dao = sqlSession.getMapper(SaleDAO.class);
		try {
			dao.deleteSaleProductRow(saleprocode);
		}
		catch(Exception e){
			System.out.println("saleproductDelete error : " + e.getMessage());
		}
		return "redirect:saleproductList";
	}
}
