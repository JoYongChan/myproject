package com.naver.project;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.project.entities.Product;
import com.naver.project.entities.ProductStock;
import com.naver.project.service.ProductDAO;

@Controller
public class ProductController {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ProductStock productstock;

	@RequestMapping(value = "/productStockList", method = RequestMethod.GET)
	public String productStockList(Model model) {
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		ArrayList<ProductStock> productstocks = dao.selectProductStockAll();
		for (int i = 0; i < productstocks.size(); i++) {
			productstocks.get(i).setDate(productstocks.get(i).getYear() + "년"
					+ productstocks.get(i).getMonth() + "월"
					+ productstocks.get(i).getDay() + "일");
			productstocks.get(i).setProname(dao.selectOneUsingProcode(productstocks.get(i).getProcode()).getProname());
			productstocks.get(i).setCapacity(dao.selectOneUsingProcode(productstocks.get(i).getProcode()).getCapacity());
		}
		model.addAttribute("productstocks", productstocks);
		return "product/productstock_list";
	}

	@RequestMapping(value = "/productStockInsertForm", method = RequestMethod.GET)
	public String productStockInsertForm(Model model) {
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		ArrayList<Product> products = dao.selectProductAll();
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		productstock.setYear(date.substring(0, 4));
		productstock.setMonth(date.substring(5, 7));
		productstock.setDay(date.substring(8, 10));
		model.addAttribute("productstock", productstock);
		model.addAttribute("products", products);
		return "product/productstock_insert_form";
	}
	
	@ResponseBody
	@RequestMapping(value = "/productStockInsertCheck", method = RequestMethod.POST)
	public int productStockInsertCheck(@RequestParam String stockid) {
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		ArrayList<ProductStock> productstocks = dao.selectProductStockAll();
		int check = 1;
		for(ProductStock productstock : productstocks) {
			if(productstock.getStockid().equals(stockid)){
				check = 0;
			}
		}
		return check;
	}

	@RequestMapping(value = "/productStockInsert", method = RequestMethod.POST)
	public String productStockInsert(Model model, @ModelAttribute ProductStock productstock) {
		productstock.setStockid(productstock.getYear() + productstock.getMonth()
		+ productstock.getDay() + productstock.getProcode());
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		int result = 0;
		try {
			result = dao.productstockInsertRow(productstock);
			System.out.println("productStockInsert result : " + result);
		}
		catch(Exception e) {
			System.out.println("productStockInsert error : " + e.getMessage());
		}
		return "redirect:productStockList";
	}

	@RequestMapping(value = "/productStockUpdateForm", method = RequestMethod.GET)
	public String productStockUpdateForm(Model model) {
		return "product/productstock_update_form";
	}

	@RequestMapping(value = "/productStockUpdate", method = RequestMethod.GET)
	public String productStockUpdate(Model model) {
		return "redirect:productStockList";
	}

	@RequestMapping(value = "/productStockDelete", method = RequestMethod.GET)
	public String productStockDelete(Model model) {
		return "redirect:productStockList";
	}

	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String productList(Model model) {
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		ArrayList<Product> products = dao.selectProductAll();
		model.addAttribute("products", products);
		return "product/product_list";
	}

	@RequestMapping(value = "/productInsertForm", method = RequestMethod.GET)
	public String productInsertForm(Model model) {
		return "product/product_insert_form";
	}

	@ResponseBody
	@RequestMapping(value = "/productConfirm", method = RequestMethod.POST)
	public int productConfirm(@RequestParam String procode) {
		System.out.println("productConfirm code : " + procode);
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		int exists = 0;
		try {
			exists = dao.selectUsingProcode(procode);
			System.out.println("productConfirm exists : " + exists);
		} catch (Exception e) {
			System.out.println("confirm error : " + e.getMessage());
		}
		return exists;
	}

	@RequestMapping(value = "/productInsert", method = RequestMethod.POST)
	public String productInsert(Model model, @ModelAttribute Product product) {
		System.out.println("productInsert productcode : " + product.getProcode());
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		int result = 0;
		try {
			result = dao.productInsertRow(product);
			System.out.println("productInsert result : " + result);
		} catch (Exception e) {
			System.out.println("productInsert error : " + e.getMessage());
		}
		return "redirect:productList";
	}

	@RequestMapping(value = "/productUpdateForm", method = RequestMethod.GET)
	public String productUpdateForm(Model model) {
		return "product/product_update_form";
	}

	@RequestMapping(value = "/productUpdate", method = RequestMethod.GET)
	public String productUpdate(Model model) {
		return "redirect:productList";
	}

	@RequestMapping(value = "/productDelete", method = RequestMethod.GET)
	public String productDelete(Model model) {
		return "redirect:productList";
	}
}
