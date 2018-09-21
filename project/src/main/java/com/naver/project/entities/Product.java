package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Product {
	private String procode,code,proname,memo,photo,category,capacity;	
	private int price;
}
