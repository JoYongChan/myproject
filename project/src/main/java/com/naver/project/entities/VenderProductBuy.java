package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class VenderProductBuy {
	private int seq;
	private String venderproductcode;
	private String vendername;
	private String proname;
	private String capacity;
	private String year;
	private String month;
	private String day;
	private int no;
	private int hang;
	private int qty;
	private int totalprice;
	private String memo;
}
