package com.naver.project;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SaleController {
	@RequestMapping(value = "/saleList", method = RequestMethod.GET)
	public String saleList(Model model) {
		return "sale/sale_list";
	}

	@RequestMapping(value = "/saleInsertForm", method = RequestMethod.GET)
	public String saleInsertForm(Model model) {
		return "sale/sale_insert_form";
	}
	
	@RequestMapping(value = "/saleInsert", method = RequestMethod.GET)
	public String saleInsert(Model model) {
		return "redirect:saleList";
	}
	
	@RequestMapping(value = "/saleUpdateForm", method = RequestMethod.GET)
	public String saleUpdateForm(Model model) {
		return "sale/sale_update_form";
	}
	
	@RequestMapping(value = "/saleUpdate", method = RequestMethod.GET)
	public String saleUpdate(Model model) {
		return "redirect:saleList";
	}
	
	@RequestMapping(value = "/saleDelete", method = RequestMethod.GET)
	public String saleDelete(Model model) {
		return "redirect:saleList";
	}

	@RequestMapping(value = "/salenoteList", method = RequestMethod.GET)
	public String salenoteList(Model model) {
		return "sale/salenote_list";
	}

	@RequestMapping(value = "/salenoteInsertForm", method = RequestMethod.GET)
	public String salenoteInsertForm(Model model) {
		return "sale/salenote_insert_form";
	}
	
	@RequestMapping(value = "/salenoteInsert", method = RequestMethod.GET)
	public String salenoteInsert(Model model) {
		return "redirect:salenoteList";
	}
	
	@RequestMapping(value = "/salenoteUpdateForm", method = RequestMethod.GET)
	public String salenoteUpdateForm(Model model) {
		return "sale/salenote_update_form";
	}
	
	@RequestMapping(value = "/salenoteUpdate", method = RequestMethod.GET)
	public String salenoteUpdate(Model model) {
		return "redirect:salenoteList";
	}
	
	@RequestMapping(value = "/salenoteDelete", method = RequestMethod.GET)
	public String salenoteDelete(Model model) {
		return "redirect:salenoteList";
	}

	@RequestMapping(value = "/saleproductList", method = RequestMethod.GET)
	public String saleproductList(Model model) {
		return "sale/saleproduct_list";
	}

	@RequestMapping(value = "/saleproductInsertForm", method = RequestMethod.GET)
	public String saleproductInsertForm(Model model) {
		return "sale/saleproduct_insert_form";
	}
	
	@RequestMapping(value = "/saleproductInsert", method = RequestMethod.GET)
	public String saleproductInsert(Model model) {
		return "redirect:saleproductList";
	}
	
	@RequestMapping(value = "/saleproductUpdateForm", method = RequestMethod.GET)
	public String saleproductUpdateForm(Model model) {
		return "sale/saleproduct_update_form";
	}
	
	@RequestMapping(value = "/saleproductUpdate", method = RequestMethod.GET)
	public String saleproductUpdate(Model model) {
		return "redirect:saleproductList";
	}
	
	@RequestMapping(value = "/saleproductDelete", method = RequestMethod.GET)
	public String saleproductDelete(Model model) {
		return "redirect:saleproductList";
	}
}
