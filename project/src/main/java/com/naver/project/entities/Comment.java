package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Comment {
	private int c_code;
	private int b_code;
	private String content;
	private String writer;
	private String reg_date;
}
