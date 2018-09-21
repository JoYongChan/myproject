package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Salaryroll {
	private String yyyy;
	private String mm;
	private String empcode;
	private String name;
	private int partner;
	private int dependent20;
	private int dependent60;
	private int disabled;
	private int womanpower;
	private int pay12;
	private int totalpay;
}
