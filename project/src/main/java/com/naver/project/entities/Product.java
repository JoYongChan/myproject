package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Product {
	private String procode;
	private String proname;
	private String capacity;
}
