package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Vender {
	private String vendercode;
	private String vendername;
	private String phone;
	private String phone1;
	private String phone2;
	private String phone3;
	private String busno;
	private String busno1;
	private String busno2;
	private String busno3;
	private String ceoname;
	private String zipcode;
	private String oldaddr;
	private String newaddr;
	private String detailaddr;
}
