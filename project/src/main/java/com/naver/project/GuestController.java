package com.naver.project;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.naver.project.entities.Guest;
import com.naver.project.service.GuestDao;

@Controller

public class GuestController {
	@Autowired
	private SqlSession sqlSession;
	@RequestMapping(value = "/guestInsertForm", method = RequestMethod.GET)
	public String guestInsertForm(Model model) {
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		String date = sm.format(new Date());
		String curyyyy = date.substring(0,4);
		String curmm = date.substring(5,7);
		String curdd = date.substring(8,10);
		model.addAttribute("curyyyy", curyyyy);
		model.addAttribute("curmm", curmm);
		model.addAttribute("curdd", curdd);
		return "register/guest_insert_form";
	}
	@RequestMapping(value = "/guestListForm", method = RequestMethod.GET)
	public String guestListForm(Model model) {
		GuestDao guestdao = sqlSession.getMapper(GuestDao.class);
		ArrayList<Guest> gusets = guestdao.selectAll();
		model.addAttribute("gusets", gusets);
		return "register/guest_list_form";
	}
	
	@RequestMapping(value = "/guestInsert", method = RequestMethod.POST)
	public String guestInsert(@ModelAttribute Guest guest ) {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		guest.setInputdate(format.format(date));
		System.out.println("---------inputdate:"+guest.getInputdate());
		GuestDao guestdao = sqlSession.getMapper(GuestDao.class);
		guest.setBirthday(guest.getYyyy()+guest.getMm()+guest.getDd());
		guest.setPhone(guest.getPhone1()+guest.getPhone2()+guest.getPhone3());
		guestdao.insertRow(guest);

		return "home";
	}
	@RequestMapping(value = "/gusetUpdateForm", method = RequestMethod.GET)
	public String gusetUpdateForm(Model model, @RequestParam String phone,@ModelAttribute Guest guest) {
		GuestDao guestdao = sqlSession.getMapper(GuestDao.class);
		String birdate = guest.getBirthday();
		String biryyyy = birdate.substring(0,4);
		String birmm = birdate.substring(4,5);
		String birdd = birdate.substring(5);
		model.addAttribute("biryyyy", biryyyy);
		model.addAttribute("birmm", birmm);
		model.addAttribute("birdd", birdd);
		String phonenum = guest.getPhone();
		String phone1 = phonenum.substring(0,3);
		String phone2 = phonenum.substring(3,7);
		String phone3 = phonenum.substring(7,11);
		model.addAttribute("phone1", phone1);
		model.addAttribute("phone2", phone2);
		model.addAttribute("phone3", phone3);
		Guest guests = guestdao.selectOne(phone);
		model.addAttribute("guests", guests);
		return "register/guest_update_form";
	}
	@RequestMapping(value = "/gusetUpdate", method = RequestMethod.POST)
	public String gusetUpdate(@ModelAttribute Guest guest) {
		GuestDao guestdao = sqlSession.getMapper(GuestDao.class);
			guest.setBirthday(guest.getYyyy()+guest.getMm()+guest.getDd());
			guest.setPhone(guest.getPhone1()+guest.getPhone2()+guest.getPhone3());
			guestdao.updateRow(guest);
		
		return "home";
	}
	@RequestMapping(value = "/guestDelete", method = RequestMethod.GET)
	public String guestDelete(Model model, @RequestParam String phone,@ModelAttribute Guest guest) {
		GuestDao guestdao = sqlSession.getMapper(GuestDao.class);
//		guest.setBirthday(guest.getYyyy()+guest.getMm()+guest.getDd());
		guest.setPhone(guest.getPhone1()+guest.getPhone2()+guest.getPhone3());
		System.out.println(phone);
		guestdao.deleteRow(phone);
		
		return "home";
	}

}
