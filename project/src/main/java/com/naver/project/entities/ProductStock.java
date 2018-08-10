package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ProductStock {
	private String procode;
	private String proname; //procode 이용해서 땡겨옴
	private String capacity; //procode 이용해서 땡겨옴
	private String year;
	private String month;
	private String day;
	private String date; //date = year+month+day
	private int preddstock;
	private int changestock;
	private int curstock;
}
