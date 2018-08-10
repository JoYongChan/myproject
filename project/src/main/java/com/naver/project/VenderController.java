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
import com.naver.project.entities.Vender;
import com.naver.project.entities.VenderProduct;
import com.naver.project.entities.VenderProductBuy;
import com.naver.project.service.ProductDAO;
import com.naver.project.service.VenderDAO;

@Controller
public class VenderController {
	@Autowired
	private SqlSession sqlSession;

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
		System.out.println("venderConfirm code : " + vendercode);
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
		System.out.println("venderInsert vendercode : " + vender.getVendercode());
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		int result = 0;
		vender.setBusno(vender.getBusno1() + vender.getBusno2() + vender.getBusno3());
		vender.setPhone(vender.getPhone1() + vender.getPhone2() + vender.getPhone3());
		try {
			result = dao.insertVenderRow(vender);
			System.out.println("venderInsert result : " + result);
		} catch (Exception e) {
			System.out.println("venderInsert Error : " + e.getMessage());
		}
		return "redirect:venderList";
	}

	@RequestMapping(value = "/venderUpdateForm", method = RequestMethod.GET)
	public String venderUpdateForm(Model model, @RequestParam String venderproductcode) {
		return "vender/vender_update_form";
	}

	@RequestMapping(value = "/venderUpdate", method = RequestMethod.GET)
	public String venderUpdate(Model model) {
		return "redirect:venderList";
	}

	@RequestMapping(value = "/venderDelete", method = RequestMethod.GET)
	public String venderDelete(Model model) {
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
	public String venderproductUpdateForm(Model model) {
		return "vender/venderproduct_update_form";
	}

	@RequestMapping(value = "/venderproductUpdate", method = RequestMethod.GET)
	public String venderproductUpdate(Model model) {
		return "redirect:venderproductList";
	}

	@RequestMapping(value = "/venderproductDelete", method = RequestMethod.GET)
	public String venderproductDelete(Model model) {
		return "redirect:venderproductList";
	}

	// venderProductBuy-------------------------------------------------------------
	@RequestMapping(value = "/venderProductBuyList", method = RequestMethod.GET)
	public String venderProductBuyList(Model model) {
		VenderDAO dao = sqlSession.getMapper(VenderDAO.class);
		ProductDAO prodao = sqlSession.getMapper(ProductDAO.class);
		ArrayList<VenderProductBuy> venderproductbuys = dao.selectVenderProductBuyAll();
		for (VenderProductBuy venderproductbuy : venderproductbuys) {
			String vendercode = dao.selectUsingVenderProductcode(venderproductbuy.getVenderproductcode()).getVendercode();
			String vendername = dao.selectVendername(vendercode);
			String procode = dao.selectUsingVenderProductcode(venderproductbuy.getVenderproductcode()).getProcode();
			String proname = prodao.selectOneUsingProcode(procode).getProname();
			String capacity = prodao.selectOneUsingProcode(procode).getCapacity();
			
			venderproductbuy.setVendername(vendername);
			venderproductbuy.setProname(proname);
			venderproductbuy.setCapacity(capacity);
		}
		model.addAttribute("venderproductbuys", venderproductbuys);
		return "vender/venderProductBuy_list";
	}

	@RequestMapping(value = "/venderProductBuyInsertForm", method = RequestMethod.GET)
	public String venderProductBuyInsertForm(Model model) {
		return "vender/venderProductBuy_insert_form";
	}

	@RequestMapping(value = "/venderProductBuyInsert", method = RequestMethod.GET)
	public String venderProductBuyInsert(Model model) {
		return "redirect:venderProductBuyList";
	}

	@RequestMapping(value = "/venderProductBuyUpdateForm", method = RequestMethod.GET)
	public String venderProductBuyUpdateForm(Model model) {
		return "vender/venderProductBuy_update_form";
	}

	@RequestMapping(value = "/venderProductBuyUpdate", method = RequestMethod.GET)
	public String venderProductBuyUpdate(Model model) {
		return "redirect:venderProductBuyList";
	}

	@RequestMapping(value = "/venderProductBuyDelete", method = RequestMethod.GET)
	public String venderProductBuyDelete(Model model) {
		return "redirect:venderProductBuyList";
	}
}
