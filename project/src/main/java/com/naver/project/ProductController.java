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
	

	private void productStockInsert(String procode) {
		// TODO Auto-generated method stub
		productstock.setProcode(procode);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		productstock.setYear(date.substring(0, 4));
		productstock.setMonth(date.substring(5, 7));
		productstock.setDay(date.substring(8, 10));
		productstock.setStockid(productstock.getYear() + productstock.getMonth()
		+ productstock.getDay() + procode);
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		try {
			dao.productstockInsertRow(productstock);
		}
		catch(Exception e) {
			System.out.println("productStockInsert error : " + e.getMessage());
		}
	}

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

	@RequestMapping(value = "/productStockUpdateForm", method = RequestMethod.GET)
	public String productStockUpdateForm(Model model, @RequestParam String stockid) {
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		ProductStock productstock = dao.selectProductStockOne(stockid);
		Product product = dao.selectOneUsingProcode(productstock.getProcode());
		productstock.setProname(product.getProname());
		productstock.setCapacity(product.getCapacity());
		System.out.println("productStockUpdateForm stockid : " + productstock.getStockid());
		System.out.println("productStockUpdateForm curstock : " + productstock.getCurstock());
		model.addAttribute("productstock", productstock);
		return "product/productstock_update_form";
	}

	@RequestMapping(value = "/productStockUpdate", method = RequestMethod.POST)
	public String productStockUpdate(Model model, @ModelAttribute ProductStock productstock) {
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		System.out.println("productStockUpdate stockid : " + productstock.getStockid());
		System.out.println("productStockUpdate curstock : " + productstock.getCurstock());
		try {
			dao.updateProductStockRow(productstock);
		}
		catch(Exception e) {
			System.out.println("productStockUpdate error + " + e.getMessage());
		}
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
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		int exists = 0;
		try {
			exists = dao.selectUsingProcode(procode);
		} catch (Exception e) {
			System.out.println("productconfirm error : " + e.getMessage());
		}
		return exists;
	}

	@RequestMapping(value = "/productInsert", method = RequestMethod.POST)
	public String productInsert(Model model, @ModelAttribute Product product) {
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		try {
			dao.productInsertRow(product);
			productStockInsert(product.getProcode());
		} catch (Exception e) {
			System.out.println("productInsert error : " + e.getMessage());
		}
		return "redirect:productList";
	}


	@RequestMapping(value = "/productUpdateForm", method = RequestMethod.GET)
	public String productUpdateForm(Model model, @RequestParam String procode) {
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		Product product = dao.selectOneUsingProcode(procode);
		model.addAttribute("product", product);
		return "product/product_update_form";
	}

	@RequestMapping(value = "/productUpdate", method = RequestMethod.POST)
	public String productUpdate(Model model, @ModelAttribute Product product) {
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		try {
			dao.productUpdateRow(product);
		}
		catch(Exception e) {
			System.out.println("productUpdate error : " + e.getMessage());
		}
		return "redirect:productList";
	}

	@RequestMapping(value = "/productDelete", method = RequestMethod.GET)
	public String productDelete(Model model, @RequestParam String procode) {
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		try {
			dao.productDeleteRow(procode);
		}
		catch(Exception e) {
			System.out.println("productDelete error : " + e.getMessage());
		}
		return "redirect:productList";
	}
}
