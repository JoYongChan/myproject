package com.naver.project;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.project.entities.Product;
import com.naver.project.entities.ProductStock;
import com.naver.project.entities.Vender;
import com.naver.project.entities.VenderProduct;
import com.naver.project.entities.VenderProductBuy;
import com.naver.project.entities.VenderProductBuySearchBean;
import com.naver.project.service.ProductDAO;
import com.naver.project.service.VenderDAO;

@Controller
public class VenderController {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private Vender vender;
	
	@Autowired
	private Product product;

	@Autowired
	private VenderProduct venderproduct;

	@Autowired
	private VenderProductBuy venderproductbuy;

	@Autowired
	private ProductStock productstock;

	// vender------------------------------------------------------------------
	@RequestMapping(value = "/venderList", method = RequestMethod.GET)
	public String venderList(Model model) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		ArrayList<Vender> venders = dao.selectVenderAll();
		model.addAttribute("venders", venders);
		return "vender/vender_list";
	}

	@RequestMapping(value = "/venderInsertForm", method = RequestMethod.GET)
	public String venderInsertForm(Model model) {
		return "vender/vender_insert_form";
	}

	@ResponseBody
	@RequestMapping(value = "/venderConfirm", method = RequestMethod.POST)
	public int venderConfirm(@RequestParam String vendercode) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		int exists = 0;
		try {
			exists = dao.selectUsingVendercode(vendercode);
			System.out.println("venderConfirm exists : " + exists);
		} catch (Exception e) {
			System.out.println("confirm error : " + e.getMessage());
		}
		return exists;
	}

	@RequestMapping(value = "/venderInsert", method = RequestMethod.POST)
	public String venderInsert(Model model, @ModelAttribute Vender vender) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		vender.setBusno(vender.getBusno1() + vender.getBusno2() + vender.getBusno3());
		vender.setPhone(vender.getPhone1() + vender.getPhone2() + vender.getPhone3());
		try {
			dao.insertVenderRow(vender);
		} catch (Exception e) {
			System.out.println("venderInsert Error : " + e.getMessage());
		}
		return "redirect:venderList";
	}

	@RequestMapping(value = "/venderUpdateForm", method = RequestMethod.GET)
	public String venderUpdateForm(Model model, @RequestParam String vendercode) {
		System.out.println("venderUpdateForm vendercode : " + vendercode);
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		Vender vender = dao.selectVenderUsingVendercode(vendercode);
		if(vender.getPhone().length() == 11) {
			vender.setPhone1(vender.getPhone().substring(0,3));
			vender.setPhone2(vender.getPhone().substring(3,7));
			vender.setPhone3(vender.getPhone().substring(7,11));
		}
		else {
			vender.setPhone1(vender.getPhone().substring(0,2));
			vender.setPhone2(vender.getPhone().substring(2,6));
			vender.setPhone3(vender.getPhone().substring(6,10));
		}
		vender.setBusno1(vender.getBusno().substring(0, 3));
		vender.setBusno2(vender.getBusno().substring(3, 5));
		vender.setBusno3(vender.getBusno().substring(5, 10));
		model.addAttribute("vender", vender);
		return "vender/vender_update_form";
	}

	@RequestMapping(value = "/venderUpdate", method = RequestMethod.POST)
	public String venderUpdate(Model model, @ModelAttribute Vender vender) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		vender.setBusno(vender.getBusno1() + vender.getBusno2() + vender.getBusno3());
		vender.setPhone(vender.getPhone1() + vender.getPhone2() + vender.getPhone3());
		try {
			dao.updateVenderRow(vender);
		} catch (Exception e) {
			System.out.println("venderUpdate Error : " + e.getMessage());
		}
		return "redirect:venderList";
	}

	@RequestMapping(value = "/venderDelete", method = RequestMethod.GET)
	public String venderDelete(Model model, @RequestParam String vendercode) {
		System.out.println("venderDelete vendercode : " + vendercode);
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		try {
			dao.deleteVenderRow(vendercode);
		}
		catch(Exception e) {
			System.out.println("venderDelete Error : " + e.getMessage());
		}
		return "redirect:venderList";
	}

	// venderProduct----------------------------------------------------------------
	@RequestMapping(value = "/venderproductList", method = RequestMethod.GET)
	public String venderproductList(Model model) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		ProductDAO prodao = sqlSession.getMapper(ProductDAO.class);
		ArrayList<VenderProduct> venderproducts = dao.selectVenderProductAll();
		for (int i = 0; i < venderproducts.size(); i++) {
			venderproducts.get(i).setVendername(dao.selectVendername(venderproducts.get(i).getVendercode()));
			venderproducts.get(i)
					.setProname(prodao.selectOneUsingProcode(venderproducts.get(i).getProcode()).getProname());
			venderproducts.get(i)
					.setCapacity(prodao.selectOneUsingProcode(venderproducts.get(i).getProcode()).getCapacity());
		}
		model.addAttribute("venderproducts", venderproducts);
		return "vender/venderproduct_list";
	}

	@RequestMapping(value = "/venderproductInsertForm", method = RequestMethod.GET)
	public String venderproductInsertForm(Model model) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		ProductDAO prodao = sqlSession.getMapper(ProductDAO.class);
		ArrayList<Vender> venders = dao.selectVenderAll();
		ArrayList<Product> products = prodao.selectProductAll();
		model.addAttribute("venders", venders);
		model.addAttribute("products", products);
		return "vender/venderproduct_insert_form";
	}
	
	@ResponseBody
	@RequestMapping(value = "/venderProductConfirm", method = RequestMethod.POST)
	public int venderProductConfirm(@RequestParam String venderproductcode) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		int exists = 0;
		try {
			exists = dao.selectUsingVenderproductcode(venderproductcode);
			System.out.println("venderConfirm exists : " + exists);
		} catch (Exception e) {
			System.out.println("confirm error : " + e.getMessage());
		}
		return exists;
	}

	@RequestMapping(value = "/venderproductInsert", method = RequestMethod.POST)
	public String venderproductInsert(Model model, @ModelAttribute VenderProduct venderproduct) {
		System.out.println("venderproductInsert venderproductcode : " + venderproduct.getVenderproductcode());
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		int result = 0;
		try {
			result = dao.insertVenderProductRow(venderproduct);
			System.out.println("venderproductInsert result : " + result);
		} catch (Exception e) {
			System.out.println("venderproductInsert error : " + e.getMessage());
		}
		return "redirect:venderproductList";
	}

	@RequestMapping(value = "/venderproductUpdateForm", method = RequestMethod.GET)
	public String venderproductUpdateForm(Model model, @RequestParam String venderproductcode) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		ProductDAO prodao = sqlSession.getMapper(ProductDAO.class);
		VenderProduct venderproduct = dao.selectUsingVenderProductcode(venderproductcode);
		Vender vender = dao.selectVenderUsingVendercode(venderproduct.getVendercode());
		Product product = prodao.selectOneUsingProcode(venderproduct.getProcode());
		venderproduct.setVendername(vender.getVendername());
		venderproduct.setProname(product.getProname());
		venderproduct.setCapacity(product.getCapacity());
		model.addAttribute("venderproduct", venderproduct);
		return "vender/venderproduct_update_form";
	}

	@RequestMapping(value = "/venderproductUpdate", method = RequestMethod.POST)
	public String venderproductUpdate(@ModelAttribute VenderProduct venderproduct) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		try {
			dao.updateVenderProductRow(venderproduct);
		}
		catch(Exception e) {
			System.out.println("venderproductUpdate error : " + e.getMessage());
		}
		return "redirect:venderproductList";
	}

	@RequestMapping(value = "/venderproductDelete", method = RequestMethod.GET)
	public String venderproductDelete(@RequestParam String venderproductcode) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		try {
			dao.deleteVenderProduct(venderproductcode);
		}
		catch(Exception e) {
			System.out.println("venderproductDelete error : " + e.getMessage());
		}
		return "redirect:venderproductList";
	}

	// venderProductBuy-------------------------------------------------------------
	@RequestMapping(value = "/venderProductBuyInsertForm", method = RequestMethod.GET)
	public String venderProductBuyInsertForm(Model model,
			@ModelAttribute("venderproductbuy") VenderProductBuy venderproductbuy,
			@ModelAttribute("venderproductbuys") ArrayList<VenderProductBuy> venderproductbuys,
			@ModelAttribute("redirectchk") String redirectchk) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		ProductDAO prodao = sqlSession.getMapper(ProductDAO.class);
		String insertchk;
		if (redirectchk.equals("insert")) {
			HashMap buysearch = new HashMap();
			buysearch.put("venderproductcode", venderproductbuy.getVenderproductcode());
			buysearch.put("year", venderproductbuy.getYear());
			buysearch.put("month", venderproductbuy.getMonth());
			buysearch.put("day", venderproductbuy.getDay());
			venderproductbuys = dao.selectBuySearchRollup(buysearch);
			ArrayList<VenderProduct> venderproducts = selectVenderProduct(venderproductbuy.getVendercode());
			model.addAttribute("venderproducts", venderproducts);
		}
		for(VenderProductBuy buy : venderproductbuys) {
			buy.setVendername(dao.selectVendername(buy.getVendercode()));
			buy.setProname(prodao.selectOneUsingProcode(buy.getProcode()).getProname());
			buy.setPrice(dao.selectUsingVenderProductcode(buy.getVenderproductcode()).getPrice());
			buy.setCapacity(prodao.selectOneUsingProcode(buy.getProcode()).getCapacity());
		}
		ArrayList<Vender> venders = dao.selectVenderAll();
		System.out.println("venderProductBuyInsertForm venderproductbuy get vendercode : " + venderproductbuy.getVendercode());
		model.addAttribute("venders", venders);
		model.addAttribute("venderproductbuy", venderproductbuy);
		model.addAttribute("venderproductbuys", venderproductbuys);
		return "vender/venderproductbuy_insert_form";
	}

	@ResponseBody
	@RequestMapping(value = "/selectVenderProduct", method = RequestMethod.POST)
	public ArrayList<VenderProduct> selectVenderProduct(@RequestParam String vendercode) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		ProductDAO prodao = sqlSession.getMapper(ProductDAO.class);
		ArrayList<VenderProduct> venderproducts = dao.selectVenderProduct(vendercode);
		for (VenderProduct venderproduct : venderproducts) {
			venderproduct.setProname(prodao.selectOneUsingProcode(venderproduct.getProcode()).getProname());
			venderproduct.setCapacity(prodao.selectOneUsingProcode(venderproduct.getProcode()).getCapacity());
		}
		return venderproducts;
	}

	@ResponseBody
	@RequestMapping(value = "/venderProductBuyNew", method = RequestMethod.POST)
	public VenderProductBuy venderProductBuyNew(@RequestParam String venderproductcode) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		ProductDAO prodao = sqlSession.getMapper(ProductDAO.class);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		venderproductbuy.setYear(date.substring(0, 4));
		venderproductbuy.setMonth(date.substring(5, 7));
		venderproductbuy.setDay(date.substring(8, 10));
		venderproductbuy.setVenderproductcode(venderproductcode);
		venderproductbuy.setNo(dao.selectSequenceNo(venderproductbuy));
		venderproductbuy.setHang(1);
		String procode = dao.selectUsingVenderProductcode(venderproductcode).getProcode();
		productstock = prodao.selectLastProductStock(procode);
		venderproductbuy.setStock(productstock.getCurstock());
		venderproductbuy.setPrice(dao.selectUsingVenderProductcode(venderproductcode).getPrice());
		return venderproductbuy;
	}

	@RequestMapping(value = "/venderProductBuyInsert", method = RequestMethod.POST)
	public String venderProductBuyInsert(@ModelAttribute VenderProductBuy venderproductbuy,
			RedirectAttributes redirectattribute) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		ProductDAO prodao = sqlSession.getMapper(ProductDAO.class);
		try {
			dao.insertVenderProductBuyRow(venderproductbuy);
			String procode = dao.selectUsingVenderProductcode(venderproductbuy.getVenderproductcode()).getProcode();
			String stockid = venderproductbuy.getYear() + venderproductbuy.getMonth() + venderproductbuy.getDay()
					+ procode;
			productstock.setStockid(stockid);
			productstock.setProcode(procode);
			productstock.setYear(venderproductbuy.getYear());
			productstock.setMonth(venderproductbuy.getMonth());
			productstock.setDay(venderproductbuy.getDay());
			productstock.setIncstock(venderproductbuy.getQty());
			productstock.setPreddstock(prodao.selectLastProductStock(procode).getCurstock());
			productstock.setCurstock(productstock.getPreddstock() + productstock.getIncstock());
			prodao.addProductStock(productstock);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		venderproductbuy.setHang(venderproductbuy.getHang() + 1);
		System.out.println("venderProductBuyInsert venderproductbuy get vendercode : " + venderproductbuy.getVendercode());
		redirectattribute.addFlashAttribute("redirectchk", "insert");
		redirectattribute.addFlashAttribute("venderproductbuy", venderproductbuy);
		return "redirect:venderProductBuyInsertForm";
	}
	
	@RequestMapping(value = "/venderProductBuySearch", method = RequestMethod.GET)
	public String venderProductBuySearch(Model model, @ModelAttribute("venderproductbuysearchbean") VenderProductBuySearchBean venderproductbuysearchbean,
			RedirectAttributes redirectattribute) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		HashMap buysearch = new HashMap();
		buysearch.put("venderproductcode", venderproductbuysearchbean.getSearchvenderproductcode());
		buysearch.put("year", venderproductbuysearchbean.getSearchyear());
		buysearch.put("month", String.format("%02d", Integer.parseInt(venderproductbuysearchbean.getSearchmonth())));
		buysearch.put("day", String.format("%02d", Integer.parseInt(venderproductbuysearchbean.getSearchday())));
		ArrayList<VenderProductBuy> venderproductbuys;
		if (venderproductbuysearchbean.getSearchmonth().equals("0")) {
			venderproductbuys = dao.selectBuySearchRollupYY(buysearch);
		} else if (venderproductbuysearchbean.getSearchday().equals("0")) {
			venderproductbuys = dao.selectBuySearchRollupMM(buysearch);
		} else {
			venderproductbuys = dao.selectBuySearchRollup(buysearch);
		}
		redirectattribute.addFlashAttribute("redirectchk", "search");
		redirectattribute.addFlashAttribute("venderproductbuys", venderproductbuys);
		return "redirect:venderProductBuyInsertForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/venderproductbuyDetail", method = RequestMethod.POST)
	public VenderProductBuy venderproductbuyDetail(@RequestParam int buyid) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		ProductDAO prodao = sqlSession.getMapper(ProductDAO.class);
		venderproductbuy = dao.selectVenderproductbuyOne(buyid);
		venderproduct = dao.selectUsingVenderProductcode(venderproductbuy.getVenderproductcode());
		vender = dao.selectVenderUsingVendercode(venderproduct.getVendercode());
		product = prodao.selectOneUsingProcode(venderproduct.getProcode());
		venderproductbuy.setStock(prodao.selectLastProductStock(venderproduct.getProcode()).getCurstock());
		venderproductbuy.setVendercode(venderproduct.getVendercode());
		venderproductbuy.setVendername(vender.getVendername());
		venderproductbuy.setProname(product.getProname());
		venderproductbuy.setCapacity(product.getCapacity());
		venderproductbuy.setPrice(venderproduct.getPrice());
		return venderproductbuy;
	}

	@RequestMapping(value = "/venderProductBuyUpdate", method = RequestMethod.POST)
	public String venderProductBuyUpdate(@ModelAttribute VenderProductBuy venderproductbuy) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		ProductDAO prodao = sqlSession.getMapper(ProductDAO.class);
		String procode = dao.selectUsingVenderProductcode(venderproductbuy.getVenderproductcode()).getProcode();
		String stockid = venderproductbuy.getYear() + venderproductbuy.getMonth() + venderproductbuy.getDay()
				+ procode;
		productstock.setStockid(stockid);
		productstock.setIncstock(venderproductbuy.getQty()-venderproductbuy.getPreqty());
		try {
			dao.updateVenderProductBuyRow(venderproductbuy);
			prodao.updateProductStock(productstock);
		}
		catch(Exception e) {
			System.out.println("venderProductBuyUpdate error : " + e.getMessage());
		}
		return "redirect:venderProductBuyInsertForm";
	}

	@RequestMapping(value = "/venderProductBuyDelete", method = RequestMethod.GET)
	public String venderProductBuyDelete(@RequestParam int buyid) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		ProductDAO prodao = sqlSession.getMapper(ProductDAO.class);
		venderproductbuy = dao.selectVenderproductbuyOne(buyid);
		venderproduct = dao.selectUsingVenderProductcode(venderproductbuy.getVenderproductcode());
		String procode = venderproduct.getProcode();
		String stockid = venderproductbuy.getYear() + venderproductbuy.getMonth() + venderproductbuy.getDay()
		+ procode;
		productstock.setStockid(stockid);
		productstock.setIncstock(-venderproductbuy.getQty());
		System.out.println("venderProductBuyDelete incstock : " + productstock.getIncstock());
		try {
			dao.deleteVenderProductBuy(buyid);
			prodao.updateProductStock(productstock);
		}
		catch(Exception e) {
			System.out.println("venderProductBuyDelete");
		}
		return "redirect:venderProductBuyInsertForm";
	}

}
