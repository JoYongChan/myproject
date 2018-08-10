package com.naver.project;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EmployeeController {
	@RequestMapping(value = "/employeeInsertForm", method = RequestMethod.GET)
	public String employeeInsertForm(Model model) {
		return "employee/employee_insert_form";
	}
}
