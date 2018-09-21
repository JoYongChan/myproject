package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Tableaccount {
	private String tablecode;
	private String tablepass;
	private String storecode;
}
