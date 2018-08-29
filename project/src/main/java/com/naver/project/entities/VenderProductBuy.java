package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class VenderProductBuy {
	private int buyid;
	private String venderproductcode;
	private String vendercode;
	private String vendername;
	private String procode;
	private String proname;
	private String capacity;
	private String year;
	private String month;
	private String day;
	private int stock;
	private int price;
	private int no;
	private int hang;
	private int qty;
	private int preqty;
	private int totalprice;
	private String memo;
}
