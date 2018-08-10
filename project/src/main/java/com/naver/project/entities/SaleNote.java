package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class SaleNote {
	private int seq;
	private String year;
	private String month;
	private String day;
	private int payprice;
}
