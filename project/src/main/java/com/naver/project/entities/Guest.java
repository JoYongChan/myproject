package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Guest {
	private String phone;
	private String name;   
	private String birthday; 
	private String gender;    
	private String postno;  
	private String addr1;    
	private String addr2;     
	private String addr3;    
	private String inputdate; 
	private String password;  
	private String point;    

}
