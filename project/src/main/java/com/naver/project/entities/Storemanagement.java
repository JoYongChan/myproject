package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Storemanagement {
	private String storecode;
	private String ceocode;
	private String storepass;
	private String storename;
	private String busno;
	private String postno;
	private String newaddr;
	private String oldaddr;
	private String detailaddr;
	private String storephone;
}
