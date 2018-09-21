package com.naver.project;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naver.project.entities.Tableaccount;
import com.naver.project.service.TableaccountDAO;

@Controller
public class TableLoginController {
	@Autowired				
	private SqlSession sqlSessoin;
	@Autowired
	private Tableaccount tableaccount;
	
	@RequestMapping(value = "/TableloginForm", method = RequestMethod.GET)
	public String TableloginForm(Model model) {
		return "login/tablelogin";
	}
	
	@RequestMapping(value = "/tableLogin", method = RequestMethod.POST)
	public String tableLogin(@ModelAttribute Tableaccount tableaccount,HttpSession session) {
		TableaccountDAO dao = sqlSessoin.getMapper(TableaccountDAO.class);
		Tableaccount data = dao.tableLogin(tableaccount);
		if(data==null) {
			return "login/tablelogin_fail";
		}else {
			session.setAttribute("sessiontablecode",data.getTablecode());
			session.setAttribute("sessiontablepass",data.getTablepass());
			session.setAttribute("sessiontablestorecode",data.getStorecode());
			return "home";
		}
		
	}
	
	//로그아웃
	@RequestMapping(value = "/tablelogout", method = RequestMethod.GET)	
	public String tablelogout(HttpSession session) {
		session.invalidate();
		return "redirect:loginForm";
	}
		
	
}
