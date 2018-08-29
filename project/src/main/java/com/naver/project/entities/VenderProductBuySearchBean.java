package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class VenderProductBuySearchBean {
	private String searchvenderproductcode;
	private String searchyear;
	private String searchmonth;
	private String searchday;
}
