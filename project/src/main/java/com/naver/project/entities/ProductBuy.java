package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ProductBuy {
	private int seq;
	private String procode;
	private String year;
	private String month;
	private String day;
	private int no;
	private int hang;
	private String vendcode;
	private int qty;
	private int totalprice;
	private String memo;
}
