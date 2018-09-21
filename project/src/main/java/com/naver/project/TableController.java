package com.naver.project;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.StringTokenizer;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.project.entities.Product;
import com.naver.project.entities.Table;
import com.naver.project.service.TableDAO;


@Controller


public class TableController<Item> {
	
	@Autowired
	 private SqlSession sqlsession;
	 
	 @Autowired
	 private Product product;
	 
	 @Autowired
	 private Table table;
	 
	 
	
	@RequestMapping(value = "/tableSelect", method = RequestMethod.GET)
	public String tableSelect(Model model) {
		return "table/table_select_form";
	}
	
	@RequestMapping(value = "/tableOrder", method = RequestMethod.GET)
	public String tableOrder(Model model, @RequestParam int num) {
		
		model.addAttribute("userid", "table "+num);
		model.addAttribute("usernum", num);
		
		TableDAO dao=sqlsession.getMapper(TableDAO.class);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		
		table.setTableno(num);
		table.setYyyy(date.substring(0, 4));
		table.setMm(date.substring(5,7));
		table.setDd(date.substring(8,10));
		table.setTableno(num);
		
		int no = dao.selectSequenceNo(table)+1;
		
		table.setNo(no);
		
		String arr[]= {};
		arr=dao.selectProductCategory();
		
		ArrayList<Product> products=new ArrayList();
		
		products=dao.selectProduct("noodle");
		
		model.addAttribute(table);
		model.addAttribute("category",arr);
		model.addAttribute("products",products);
		
		return "table/table_order_form";
	}
	
	@RequestMapping(value = "/tableConfirm", method = RequestMethod.GET)
	public String tableConfirm(Model model) {
		
		model.addAttribute("userid", "counter");
		
		TableDAO dao=sqlsession.getMapper(TableDAO.class);
		
		ArrayList<Table> tables=new ArrayList<Table>();
		
		tables=dao.selectTable();
		
		model.addAttribute("tables",tables);
		
		tables=dao.selectProductOrder(1);
		
		model.addAttribute("orders",tables);
		
		
		return "table/table_confirm_form";
	}
	
		
	@RequestMapping(value = "/tableT", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<Product> tableT(String category,Model model) {
		
		
		ArrayList<Product> ps=new ArrayList<Product>();
		
		Product p=new Product();
		
		TableDAO dao=sqlsession.getMapper(TableDAO.class);
		
		ps=dao.selectProduct(category.replaceAll(" ",""));
		
		p=ps.get(0);
		
		
		System.out.println(p.getProname());
		return ps;
	}
	
	@RequestMapping(value = "/tableC", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<Table> tableC(int tableno,Model model) {
		
		
		
		ArrayList<Table> ts=new ArrayList<Table>();
		
		TableDAO dao=sqlsession.getMapper(TableDAO.class);
		
		ts=dao.selectProductOrder(tableno);
		
		if(ts==null) {
			return null;
		}
		
		return ts;
	}
	
	@RequestMapping(value = "/tableTe", method = RequestMethod.POST)
	@ResponseBody
	public Table tableTe(String proname,String price,String qty,String sum,Integer tableno,Integer no) {
		
		TableDAO dao=sqlsession.getMapper(TableDAO.class);		
		

		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());

		StringTokenizer t1 = new StringTokenizer(proname);
		StringTokenizer t2 = new StringTokenizer(price);
		StringTokenizer t3 = new StringTokenizer(qty);
		StringTokenizer t4 = new StringTokenizer(sum);
		
		int occurance = StringUtils.countOccurrencesOf(proname, ",");

		ArrayList<Table> tables=new ArrayList<Table>();
		
		for(int i=0;i<occurance+1;i++) {
			Table t= new Table();
			t.setProname(t1.nextToken( ","));
			t.setPrice( Integer.parseInt(t2.nextToken( ",")));
			t.setQty( Integer.parseInt(t3.nextToken( ",")));
			t.setSum( Integer.parseInt(t4.nextToken( ",")));
			t.setTableno(tableno);
			t.setNo(no);
			
			t.setYyyy(date.substring(0, 4));
			t.setMm(date.substring(5,7));
			t.setDd(date.substring(8,10));

			tables.add(t);
		}
		
		for( Table t: tables) {
			dao.insertTable(t);
		}
		
		
		return table;
	}
	
	@RequestMapping(value = "/tableIn", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<Table> tableIn(String seq) {
		
		TableDAO dao=sqlsession.getMapper(TableDAO.class);		

		StringTokenizer t1 = new StringTokenizer(seq);
		int occurance = StringUtils.countOccurrencesOf(seq, ",");
		
		for(int i=0;i<occurance+1;i++) {
			dao.insertTableOrder(Integer.parseInt(t1.nextToken(",")));
		}
		
		ArrayList<Table> tables=new ArrayList<Table>();
		
		tables=dao.selectTable();
		
		if(tables==null) {
			return null;
		}
		
		return tables;
	}
	
	@RequestMapping(value = "/tableCo", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<Table> tableCo(String tableno) {
		
		TableDAO dao=sqlsession.getMapper(TableDAO.class);		

		StringTokenizer t1 = new StringTokenizer(tableno);
		int occurance = StringUtils.countOccurrencesOf(tableno, ",");
		
		for(int i=0;i<occurance+1;i++) {
			dao.completeTableOrder( Integer.parseInt(t1.nextToken(",")) );
		}
		
		ArrayList<Table> tables=new ArrayList<Table>();
		
		tables=dao.selectTable();
		
		if(tables==null) {
			return null;
		}
		
		return tables;
	}
	
	
}

