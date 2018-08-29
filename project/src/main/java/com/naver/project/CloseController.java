package com.naver.project;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naver.project.entities.ProductStock;
import com.naver.project.service.ProductDAO;

@Controller
public class CloseController {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private ProductStock productstock;
	
	@RequestMapping(value = "/closeForm", method = RequestMethod.GET)
	public String closeForm(Model model) {
		return "close/close_form";
	}
	
	@RequestMapping(value = "/closeAll", method = RequestMethod.GET)
	public String closeAll(Model model) {
		ProductDAO dao = sqlSession.getMapper(ProductDAO.class);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		Calendar cal = Calendar.getInstance();
		cal.set(Integer.parseInt(date.substring(0, 4)), Integer.parseInt(date.substring(5, 7))-1, Integer.parseInt(date.substring(8, 10)));
		cal.add(Calendar.DATE, 1);
		String year = Integer.toString(cal.get(Calendar.YEAR));
		String month = String.format("%02d", cal.get(Calendar.MONTH)+1);
		String day = String.format("%02d", cal.get(Calendar.DATE));
		ArrayList<ProductStock> stocks = dao.selectProductStockAll();
		for(ProductStock stock : stocks) {
			if(stock.getDay().equals(String.format("%02d", cal.get(Calendar.DATE)-1))){
				String stockid = year + month + day + stock.getProcode();
				stock.setStockid(stockid);
				stock.setYear(year);
				stock.setMonth(month);
				stock.setDay(day);
				stock.setPreddstock(stock.getCurstock());
				stock.setDecstock(0);
				stock.setIncstock(0);
				dao.productstockDeleteRow(stockid);
				dao.productstockInsertRow(stock);
			}
		}
		return "redirect:closeForm";
	}
}
