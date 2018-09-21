package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Employee {
	private String empcode;
	private String name;
	private int age;
	private String gender;
	private String postno;
	private String newaddr;
	private String oldaddr;
	private String detailaddr;
	private String phone;
	private String beforephoto;
	private String photo;
	private String birthday;
	private String hiredate;
	private int memlevel;
	private String storename;
	
}
