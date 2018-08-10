package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Sale {
	private int seq;
	private String year;
	private String month;
	private String day;
	private int no;
	private int hang;
	private int tableno;
	private String saleprocode;
	private int qty;
	private int price;
	private String memo;
}
