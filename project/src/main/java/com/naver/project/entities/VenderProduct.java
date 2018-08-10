package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class VenderProduct {
	private String venderproductcode;
	private String vendercode;
	private String vendername; // vendercode를 이용해서 vender에서 가져올 것
	private String procode;
	private String proname; // procode를 이용해서 product에서 가져올 것
	private String capacity; // procode를 이용해서 product에서 가져올 것
	private int price;
	private String memo;
}
