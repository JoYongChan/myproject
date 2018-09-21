package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Salary {
	private String empcode;
	private int partner;
	private int dependent20;
	private int dependent60;
	private int disabled;
	private int womanpower;
	private int pay;
	private int extra;
	private String yn;
	private String name;
	private String gender;
	private int age;
	private String hiredate;
	private int memlevel;
}
