package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Table {
	private int seq; //pk

	private String yyyy,mm,dd;
	private int tableno,no;
	
	private String proname;
	private int 
	price,qty,sum,orderchk,
	ordernum,complete;
	
	
	
}
