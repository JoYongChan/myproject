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
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.project.entities.Product;
import com.naver.project.entities.ProductStock;
import com.naver.project.service.ProductDAO;

@Controller
public class ProductController {
	@Autowired
	private SqlSession sqlSession;

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
		return "product/productstock_insert_form";
	}

	@RequestMapping(value = "/productStockInsert", method = RequestMethod.GET)
	public String productStockInsert(Model model) {
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

	@RequestMapping(value = "/productBuyList", method = RequestMethod.GET)
	public String productBuyList(Model model) {
		return "product/productbuy_list";
	}

	@RequestMapping(value = "/productBuyInsertForm", method = RequestMethod.GET)
	public String productBuyInsertForm(Model model) {
		return "product/productbuy_insert_form";
	}

	@RequestMapping(value = "/productBuyInsert", method = RequestMethod.GET)
	public String productBuyInsert(Model model) {
		return "redirect:productBuyList";
	}

	@RequestMapping(value = "/productBuyUpdateForm", method = RequestMethod.GET)
	public String productBuyUpdateForm(Model model) {
		return "product/productbuy_update_form";
	}

	@RequestMapping(value = "/productBuyUpdate", method = RequestMethod.GET)
	public String productBuyUpdate(Model model) {
		return "redirect:productBuyList";
	}

	@RequestMapping(value = "/productBuyDelete", method = RequestMethod.GET)
	public String productBuyDelete(Model model) {
		return "redirect:productBuyList";
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
