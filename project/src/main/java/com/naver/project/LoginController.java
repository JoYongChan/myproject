package com.naver.project;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm(Model model) {
		return "login/login";
	}

	@RequestMapping(value = "/storeAdmin", method = RequestMethod.GET)
	public String storeAdmin(Model model) {
		return "register/store_insert_form";
	}

	@RequestMapping(value = "/tableAccount", method = RequestMethod.GET)
	public String tableAccount(Model model) {
		return "register/table_insert_form";
	}

}
