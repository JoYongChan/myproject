package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class SaleProduct {
	private String saleprocode;
	private String saleproname;
	private int saleproprice;
	private String saleprocapacity;
	private String memo;
}
