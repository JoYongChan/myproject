package com.naver.project;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.naver.project.entities.Commute;
import com.naver.project.entities.Employee;
import com.naver.project.entities.Salary;
import com.naver.project.entities.Salaryroll;
import com.naver.project.entities.Storemanagement;
import com.naver.project.service.CommuteDAO;
import com.naver.project.service.EmployeeDAO;
import com.naver.project.service.SalaryDAO;
import com.naver.project.service.StoremanagementDAO;

@Controller
public class EmployeeController {
	@Autowired				
	private SqlSession sqlSessoin;
	@Autowired
	private Employee employee;
	@Autowired
	private Commute commute;
	@Autowired
	private Salaryroll salaryroll;
	
	@RequestMapping(value = "/employeeInsertForm", method = RequestMethod.GET)
	public String employeeInsertForm(Model model) {
		StoremanagementDAO dao = sqlSessoin.getMapper(StoremanagementDAO.class);
		ArrayList<Storemanagement> storemanagements = dao.selectAll();
		model.addAttribute("storemanagements",storemanagements);
		return "employee/employee_insert_form";
	}
	
	@RequestMapping(value = "/empcodeConfirm", method = RequestMethod.POST)
	@ResponseBody
	public int empcodeConfirm(@RequestParam String empcode) {
		EmployeeDAO dao = sqlSessoin.getMapper(EmployeeDAO.class);
		int exist =0;
		exist= dao.selectEmpConfirm(empcode);
		
		return exist;
	}
	
	@RequestMapping(value = "/employeeInsert", method = RequestMethod.POST)
	public String employeeInsert(Model model,@ModelAttribute Employee employee,@RequestParam CommonsMultipartFile imgfile) {
		String originalname = imgfile.getOriginalFilename();
		int position = originalname.lastIndexOf(".");	//마지막 . 위치
		String strempcode = employee.getEmpcode();  
		String ext ="";
		String newfilename="";
		String realpath = "";
		String path = "C:/Users/IT/Desktop/sourcetree/project/src/main/webapp/resources/empphoto/";
		//이미지 디폴트
		if(originalname.equals("")) {
			ext = ".png";
			newfilename ="noimage1.png";
			realpath = "resources/img/";
		}else {
			ext = originalname.substring(position);//마지막부터 끝까지
			newfilename = strempcode+ext;
			realpath = "resources/empphoto/";
			try {
				byte bytes[] = imgfile.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path+newfilename));
				output.write(bytes);
				output.flush();
				output.close();
			} catch (Exception e) {
				System.out.println("error: "+e.getMessage());
			}
		}
		employee.setPhoto(realpath+newfilename);
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		employee.setHiredate(format.format(date));
		EmployeeDAO dao = sqlSessoin.getMapper(EmployeeDAO.class);
		dao.insertRow(employee);
		
		return "redirect:employeeListForm";
	}
	
	@RequestMapping(value = "/employeeListForm", method = RequestMethod.GET)
	public String employeeListForm(Model model) {
		EmployeeDAO dao = sqlSessoin.getMapper(EmployeeDAO.class);
		ArrayList<Employee> employees = dao.selectAll();
		model.addAttribute("employees", employees);
		
		return "employee/employee_list_form";
	}
	
	@RequestMapping(value = "/employeeDetail", method = RequestMethod.GET)
	public String employeeDetail(Model model, String empcode) {
		EmployeeDAO dao = sqlSessoin.getMapper(EmployeeDAO.class);
		Employee employee = dao.selectOne(empcode);
		model.addAttribute("employee",employee);
		StoremanagementDAO storedao = sqlSessoin.getMapper(StoremanagementDAO.class);
		ArrayList<Storemanagement> storemanagements = storedao.selectAll();
		model.addAttribute("storemanagements",storemanagements);
		
		return "employee/employee_update_form";
	}
	
	@RequestMapping(value = "/employeeUpdateForm", method = RequestMethod.POST)
	public String employeeUpdateForm(Model model,@ModelAttribute Employee employee,@RequestParam CommonsMultipartFile imgfile) {
		String originalname = imgfile.getOriginalFilename();
		String strempcode = employee.getEmpcode();  
		String newfilename="";
		String realpath = "";
		//이미지 디폴트
		if(originalname.equals("")) {
			employee.setPhoto(employee.getBeforephoto());
		}else {
			int position = originalname.lastIndexOf(".");	//마지막 . 위치
			String ext = originalname.substring(position);//마지막부터 끝까지
			newfilename = strempcode+ext;
			realpath = "resources/empphoto/";
			try {
				String path = "C:/Users/IT/Desktop/sourcetree/project/src/main/webapp/resources/empphoto/";
				employee.setPhoto(realpath+newfilename);
				byte bytes[] = imgfile.getBytes();
				BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(path+newfilename));
				output.write(bytes);
				output.flush();
				output.close();
			} catch (Exception e) {
				System.out.println("error: "+e.getMessage());
			}
		}
		EmployeeDAO dao = sqlSessoin.getMapper(EmployeeDAO.class);
		dao.updateRow(employee);
		
		return "redirect:employeeListForm";
	}
	
	@RequestMapping(value = "/employeeDelete", method = RequestMethod.GET)
	public String employeeDelete(Model model,@ModelAttribute Employee employee) {
		EmployeeDAO dao = sqlSessoin.getMapper(EmployeeDAO.class);
		dao.deleteRow(employee);
		
		return "redirect:employeeListForm";
	}
	
	@RequestMapping(value = "/employeeSalaryForm", method = RequestMethod.GET)
	public String employeeSalaryForm(Model model,String yyyy,String mm,String dd) {
		EmployeeDAO dao = sqlSessoin.getMapper(EmployeeDAO.class);
		CommuteDAO commutedao = sqlSessoin.getMapper(CommuteDAO.class);
		ArrayList<Employee> employee = dao.selectAll();
		ArrayList<Commute> commute = commutedao.selectAll();
		model.addAttribute("employee",employee);
		model.addAttribute("commute",commute);
		return "employee/employee_salary_form";
	}
	
	@RequestMapping(value = "/employeeSelected", method = RequestMethod.POST)	
	@ResponseBody
	public Employee employeeSelected(@RequestParam String empcode) {
		EmployeeDAO dao = sqlSessoin.getMapper(EmployeeDAO.class);
		employee = dao.selectOne(empcode);
		return employee;
	}
	
	//salary insert
	@RequestMapping(value = "/employeeSalary", method = RequestMethod.POST)	
	public String employeeSalary(Model model,@ModelAttribute Salary salary,@ModelAttribute Employee employee, String empcode) {
		SalaryDAO dao = sqlSessoin.getMapper(SalaryDAO.class);
		CommuteDAO commutedao = sqlSessoin.getMapper(CommuteDAO.class);
		
		ArrayList<Commute> commute = commutedao.selectCommutes(empcode);
		for(Commute commutes:commute) {
			commutes.setAthh(commutes.getAttendancetime().substring(0, 2));
			commutes.setLehh(commutes.getLeaveworktime().substring(0, 2));
			
			int hhtime = (Integer.parseInt(commutes.getLehh()) - Integer.parseInt(commutes.getAthh())-1); //일한시간 8시간
			int hhpay = 0; int hhextra = 0; int holidaypay = 0; int hhnighttime = 2; //시급,추가급여,주휴수당,야근시간 2시간
			int extra = 0;
			int daycount = commutedao.selectCount(empcode); //일한날짜
			int nighttime = commutes.getLeaveworktype(); //야근유무
			
			if(employee.getMemlevel() == 0) {
				hhpay = 30000;
				hhextra = (int) (hhpay * 1.5);
				holidaypay = (hhpay * 8) * 4;
				int pay = (hhpay * hhtime)  * daycount;
				salary.setPay(pay);
				if(nighttime == 1) {
					extra = ((hhextra * hhnighttime) * daycount);
				}else {
					extra = 0;
				}
				salary.setExtra(extra+holidaypay);
			}else if(employee.getMemlevel() == 1) {
				hhpay = 15500;
				hhextra = (int) (hhpay * 1.5);
				holidaypay = (hhpay * 8)  * 4;
				int pay = (hhpay * hhtime) * daycount;
				salary.setPay(pay);
				if(nighttime == 1) {
					extra = ((hhextra * hhnighttime) * daycount);
				}else {
					extra = 0;
				}
				salary.setExtra(extra+holidaypay);
			}else {
				hhpay = 12000;
				hhextra = (int) (hhpay * 1.5);
				holidaypay = (hhpay * 8) * 4;
				int pay = (hhpay * hhtime) * daycount;
				salary.setPay(pay);
				if(nighttime == 1) {
					extra = ((hhextra * hhnighttime) * daycount);
				}else {
					extra = 0;
				}
				salary.setExtra(extra+holidaypay);
			}
		}
		
		dao.salaryDelete(salary);
		dao.insertSalaryRow(salary);
		
		return "redirect:employeeSalaryListForm";
	}
	
	@RequestMapping(value = "/employeeSalaryListForm", method = RequestMethod.GET)
	public String employeeSalaryListForm(Model model) {
		SalaryDAO dao = sqlSessoin.getMapper(SalaryDAO.class);
		ArrayList<Salary> salarys = dao.selectSalaryAll();
		model.addAttribute("salarys",salarys);
		return "employee/employee_salary_list_form";
	}
	
	@RequestMapping(value = "/salaryDetail", method = RequestMethod.GET)
	public String salaryDetail(Model model, String empcode) {
		SalaryDAO dao = sqlSessoin.getMapper(SalaryDAO.class);
		Salary salary = dao.selectOne(empcode);
		model.addAttribute("salary",salary);
		
		return "employee/employee_salary_update_form";
	}
	
	@RequestMapping(value = "/employeeSalaryUpdateForm", method = RequestMethod.POST)
	public String employeeSalaryUpdateForm(Model model,@ModelAttribute Salary salary,String empcode) {
		SalaryDAO dao = sqlSessoin.getMapper(SalaryDAO.class);
		CommuteDAO commutedao = sqlSessoin.getMapper(CommuteDAO.class);
		
		ArrayList<Commute> commute = commutedao.selectCommutes(empcode);
		for(Commute commutes:commute) {
			commutes.setAthh(commutes.getAttendancetime().substring(0, 2));
			commutes.setLehh(commutes.getLeaveworktime().substring(0, 2));
			
			int hhtime = (Integer.parseInt(commutes.getLehh()) - Integer.parseInt(commutes.getAthh())-1); //일한시간 8시간
			int hhpay = 0; int hhextra = 0; int holidaypay = 0; int hhnighttime = 2; //시급,추가급여,주휴수당,야근시간 2시간
			int extra = 0;
			int daycount = commutedao.selectCount(empcode); //일한날짜
			int nighttime = commutes.getLeaveworktype(); //야근유무
			
			if(employee.getMemlevel() == 0) {
				hhpay = 30000;
				hhextra = (int) (hhpay * 1.5);
				holidaypay = (hhpay * 8) * 4;
				int pay = (hhpay * hhtime)  * daycount;
				salary.setPay(pay);
				if(nighttime == 1) {
					extra = ((hhextra * hhnighttime) * daycount);
				}else {
					extra = 0;
				}
				salary.setExtra(extra+holidaypay);
			}else if(employee.getMemlevel() == 1) {
				hhpay = 15500;
				hhextra = (int) (hhpay * 1.5);
				holidaypay = (hhpay * 8)  * 4;
				int pay = (hhpay * hhtime) * daycount;
				salary.setPay(pay);
				if(nighttime == 1) {
					extra = ((hhextra * hhnighttime) * daycount);
				}else {
					extra = 0;
				}
				salary.setExtra(extra+holidaypay);
			}else {
				hhpay = 12000;
				hhextra = (int) (hhpay * 1.5);
				holidaypay = (hhpay * 8) * 4;
				int pay = (hhpay * hhtime) * daycount;
				salary.setPay(pay);
				if(nighttime == 1) {
					extra = ((hhextra * hhnighttime) * daycount);
				}else {
					extra = 0;
				}
				salary.setExtra(extra+holidaypay);
			}
		}
		dao.updateSalaryRow(salary);
		
		return "redirect:employeeSalaryListForm";
	}
	
	@RequestMapping(value = "/employeeSalaryDelete", method = RequestMethod.GET)
	public String employeeSalaryDelete(Model model,@ModelAttribute Salary salary) {
		SalaryDAO dao = sqlSessoin.getMapper(SalaryDAO.class);
		dao.deleteSalaryRow(salary);
		
		return "redirect:employeeSalaryListForm";
	}
	
	@RequestMapping(value = "/employeeSalaryTaxForm", method = RequestMethod.GET)
	public String employeeSalaryTaxForm(Model model) {
		Calendar cal = Calendar.getInstance();
		int yyyy = cal.get(Calendar.YEAR);
		model.addAttribute("yyyy", yyyy+"");		
		return "employee/employee_salary_tax";
	}
	
	@RequestMapping(value = "/employeeSalaryTax", method = RequestMethod.POST)
	public String employeeSalaryTax(Model model,@RequestParam String yyyy,@RequestParam String mm) {
		SalaryDAO dao = sqlSessoin.getMapper(SalaryDAO.class);
		if(mm.equals(""))
			mm = "0";
		mm = String.format("%02d", Integer.parseInt(mm));
		
		HashMap rollkey = new HashMap();
		rollkey.putIfAbsent("yyyy", yyyy); 
		rollkey.putIfAbsent("mm", mm);
		dao.salaryrollDelete(rollkey);
		
		ArrayList<Salary> salarys = dao.selectyn();
		for(Salary salary:salarys) {
			salaryroll.setYyyy(yyyy);
			salaryroll.setMm(mm);
			salaryroll.setEmpcode(salary.getEmpcode());
			salaryroll.setName(salary.getName());
			salaryroll.setPartner(salary.getPartner());
			salaryroll.setDependent20(salary.getDependent20());
			salaryroll.setDependent60(salary.getDependent60());
			salaryroll.setDisabled(salary.getDisabled());
			salaryroll.setWomanpower(salary.getWomanpower());
			int pay12 = (salary.getPay() + salary.getExtra())*12;
			salaryroll.setPay12(pay12);
			int totalpay = salary.getPay()+salary.getExtra();
			salaryroll.setTotalpay(totalpay);
			
			dao.insertSalaryrollRow(salaryroll);
		}
		
		return "redirect:employeeSalaryTaxListForm";
	}
	
	@RequestMapping(value = "/employeeSalaryTaxListForm", method = RequestMethod.GET)
	public String employeeSalaryTaxListForm(Model model, String yyyy,  String mm, @ModelAttribute Salaryroll salaryroll) {
		SalaryDAO dao = sqlSessoin.getMapper(SalaryDAO.class);
		Calendar cal = Calendar.getInstance();
		int yy = cal.get(Calendar.YEAR);
		model.addAttribute("yyyy", yy+"");	
		
		HashMap rollkey = new HashMap();
		rollkey.putIfAbsent("yyyy", yy); //yyyy가 비어있으면 null
		rollkey.putIfAbsent("mm", mm);
		
		ArrayList<Salaryroll> salaryrollList = dao.SalaryRollList(rollkey);
		model.addAttribute("salaryrollList", salaryrollList);
		
		return "employee/employee_salary_tax_list_form";
	}
	
	//근태commute
	@RequestMapping(value = "/employeeCommuteInsertForm", method = RequestMethod.GET)
	public String employeeCommuteInsertForm(Model model) {
		EmployeeDAO dao = sqlSessoin.getMapper(EmployeeDAO.class);
		ArrayList<Employee> commuteemployee = dao.selectAll();
		model.addAttribute("commuteemployee",commuteemployee);
		return "commute/employee_commute_insert_form";
	}
	
	@RequestMapping(value = "/employeeCommuteInsert", method = RequestMethod.POST)
	public String employeeCommuteInsert(Model model,@ModelAttribute Commute commute) {
		CommuteDAO dao = sqlSessoin.getMapper(CommuteDAO.class);
		
		SimpleDateFormat yymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String date = yymmdd.format(new Date()); 
		commute.setCommutedate(date);
		commute.setYyyy(date.substring(0, 4));
		commute.setMm(date.substring(5,7));
		commute.setDd(date.substring(8,10));
		
		SimpleDateFormat hhmmss = new SimpleDateFormat("HH:mm:ss");
		date = hhmmss.format(new Date());
		commute.setAttendancetime(date);
		
		HashMap rollkey = new HashMap();
		rollkey.put("empcode",commute.getEmpcode());
		rollkey.put("commutedate",commute.getCommutedate());
		dao.commuteDelete(rollkey);
		dao.insertRow(commute);
		
		return "redirect:employeeCommuteListForm";
	}
	
	@RequestMapping(value = "/employeeCommuteListForm", method = RequestMethod.GET)
	public String employeeCommuteListForm(Model model) {
		CommuteDAO dao = sqlSessoin.getMapper(CommuteDAO.class);
		ArrayList<Commute> commutes = dao.selectAll();
		model.addAttribute("commutes", commutes);
		
		return "commute/employee_commute_list_form";
	}
	
	@RequestMapping(value = "/employeeCommuteDetail", method = RequestMethod.GET)
	public String employeeCommuteDetail(Model model, String empcode,@ModelAttribute Commute commute) {
		CommuteDAO dao = sqlSessoin.getMapper(CommuteDAO.class);
		HashMap commutesearch = new HashMap();
		commutesearch.put("empcode",commute.getEmpcode());
		commutesearch.put("commutedate",commute.getCommutedate());
		Commute commute1 = dao.selectOne(commutesearch);
		model.addAttribute("commute1",commute1);
		
		return "commute/employee_commute_update_form";
	}
	
	@RequestMapping(value = "/employeeCommuteUpdate", method = RequestMethod.POST)
	public String employeeCommuteUpdate(Model model,@ModelAttribute Commute commute) {
		CommuteDAO dao = sqlSessoin.getMapper(CommuteDAO.class);
		
		SimpleDateFormat yymmdd = new SimpleDateFormat("yyyy-MM-dd");
		String date = yymmdd.format(new Date()); 
		commute.setCommutedate(date);
		commute.setYyyy(date.substring(0, 4));
		commute.setMm(date.substring(5,7));
		commute.setDd(date.substring(8,10));
		
		SimpleDateFormat leaveworkhhmmss = new SimpleDateFormat("HH:mm:ss");
		date = leaveworkhhmmss.format(new Date()); 
		commute.setLeaveworktime(date);
		
		dao.updateRow(commute);
		
		return "redirect:employeeCommuteListForm";
	}
	
	@RequestMapping(value = "/employeeCommuteDelete", method = RequestMethod.GET)
	public String employeeCommuteDelete(Model model,@ModelAttribute Commute commute) {
		CommuteDAO dao = sqlSessoin.getMapper(CommuteDAO.class);
		dao.deleteRow(commute);
		
		return "redirect:employeeCommuteListForm";
	}
}
