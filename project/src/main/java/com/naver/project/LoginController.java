package com.naver.project;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naver.project.entities.Employee;
import com.naver.project.entities.Storemanagement;
import com.naver.project.entities.Tableaccount;
import com.naver.project.service.EmployeeDAO;
import com.naver.project.service.StoremanagementDAO;
import com.naver.project.service.TableaccountDAO;

@Controller
public class LoginController {
	
	@Autowired				
	private SqlSession sqlSessoin;
	@Autowired
	private Storemanagement storemanagement;
	@Autowired
	private Tableaccount tableaccount;
	@Autowired
	private Employee employee;
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(Model model) {
		return "login/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute Storemanagement storemanagement,HttpSession session) {
		StoremanagementDAO dao = sqlSessoin.getMapper(StoremanagementDAO.class);
		Storemanagement data = dao.login(storemanagement);
		if(data == null) {
			return "login/login_fail";
		}else {
			//세션 선언
			session.setAttribute("sessionstorecode", data.getStorecode());
			session.setAttribute("sessionstorepass", data.getStorepass());
			session.setAttribute("sessionceocode", data.getCeocode());
			session.setAttribute("sessionstorename", data.getStorename());
			return "home";
		}
		
	}
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)	
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home";
	}
	
	
	
	@RequestMapping(value = "/storeSelected", method = RequestMethod.POST)	
	@ResponseBody
	public Employee storeSelected(@RequestParam String empcode) {
		EmployeeDAO dao = sqlSessoin.getMapper(EmployeeDAO.class);
		employee = dao.selectOne(empcode);
		return employee;
	}

	@RequestMapping(value = "/storeAdmin", method = RequestMethod.GET)
	public String storeAdmin(Model model) {
		EmployeeDAO dao = sqlSessoin.getMapper(EmployeeDAO.class);
		ArrayList<Employee> employee = dao.selectAll();
		model.addAttribute("employee",employee);
		return "register/store_insert_form";
	}
	
	@RequestMapping(value = "/storecodeConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int storecodeConfirm(@RequestParam String storecode) {
		StoremanagementDAO dao = sqlSessoin.getMapper(StoremanagementDAO.class);
		int exist =0;
		exist= dao.selectStoreConfirm(storecode);
		
		return exist;
	}
	
	@RequestMapping(value = "/storeInsert", method = RequestMethod.POST)
	public String storeInsert(Model model,@ModelAttribute Storemanagement storemanagement) {
		StoremanagementDAO dao = sqlSessoin.getMapper(StoremanagementDAO.class);
		dao.insertRow(storemanagement);
		
		return "login/login";
	}
	
	@RequestMapping(value = "/storeListForm", method = RequestMethod.GET)
	public String storeListForm(Model model) {
		StoremanagementDAO dao = sqlSessoin.getMapper(StoremanagementDAO.class);
		ArrayList<Storemanagement> storemanagements = dao.selectAll();
		model.addAttribute("storemanagements",storemanagements);
		
		return "register/store_list_form";
	}
	
	@RequestMapping(value = "/storeDetail", method = RequestMethod.GET)
	public String storeDetail(Model model, String storecode) {
		StoremanagementDAO dao = sqlSessoin.getMapper(StoremanagementDAO.class);
		Storemanagement storemanagement = dao.selectOne(storecode);
		model.addAttribute("storemanagement",storemanagement);
		
		return "register/store_update_form";
	}
	
	@RequestMapping(value = "/storeUpdateForm", method = RequestMethod.POST)
	public String storeUpdateForm(Model model, @ModelAttribute Storemanagement storemanagement) {
		StoremanagementDAO dao = sqlSessoin.getMapper(StoremanagementDAO.class);
		dao.updateRow(storemanagement);
		return "redirect:storeListForm";
	}
	
	@RequestMapping(value = "/storeDelete", method = RequestMethod.GET)
	public String storeDelete(String storecode) {
		StoremanagementDAO dao = sqlSessoin.getMapper(StoremanagementDAO.class);
		dao.deleteRow(storecode);
		return "redirect:storeListForm";
	}
	
	@RequestMapping(value = "/tableAccount", method = RequestMethod.GET)
	public String tableAccount(Model model) {
		
		return "register/table_insert_form";
	}
	
	@RequestMapping(value = "/tableInsert", method = RequestMethod.POST)
	public String tableInsert(Model model,@ModelAttribute Tableaccount tableaccount) {
		TableaccountDAO dao = sqlSessoin.getMapper(TableaccountDAO.class);
		dao.insertRow(tableaccount);
		
		return "home";
	}
	
	@RequestMapping(value = "/tablecodeConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int tablecodeConfirm(@RequestParam String tablecode) {
		TableaccountDAO dao = sqlSessoin.getMapper(TableaccountDAO.class);
		int exist =0;
		exist= dao.selecttableConfirm(tablecode);
		
		return exist;
	}

	@RequestMapping(value = "/tableListForm", method = RequestMethod.GET)
	public String tableListForm(Model model) {
		TableaccountDAO tabledao = sqlSessoin.getMapper(TableaccountDAO.class);
		ArrayList<Tableaccount> tableaccounts = tabledao.selectAll();
		model.addAttribute("tableaccounts",tableaccounts);
		
		return "register/table_list_form";
	}
	
	@RequestMapping(value = "/tableDetail", method = RequestMethod.GET)
	public String tableDetail(Model model, String tablecode) {
		TableaccountDAO dao = sqlSessoin.getMapper(TableaccountDAO.class);
		Tableaccount tableaccount = dao.selectOne(tablecode);
		model.addAttribute("tableaccount",tableaccount);
		return "register/table_update_form";
	}
	
	@RequestMapping(value = "/tableUpdateForm", method = RequestMethod.POST)
	public String tableUpdateForm(Model model, @ModelAttribute Tableaccount tableaccount) {
		TableaccountDAO dao = sqlSessoin.getMapper(TableaccountDAO.class);
		dao.updateRow(tableaccount);
		return "redirect:tableListForm";
	}
	
	@RequestMapping(value = "/tableDelete", method = RequestMethod.GET)
	public String tableDelete(String tablecode) {
		TableaccountDAO dao = sqlSessoin.getMapper(TableaccountDAO.class);
		dao.deleteRow(tablecode);
		return "redirect:tableListForm";
	}
	
}
