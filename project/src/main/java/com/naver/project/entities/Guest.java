package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Guest {
	private String phone;
	private String phone1;
	private String phone2;
	private String phone3;
	private String name;   
	private String birthday; 
	private String yyyy; 
	private String mm; 
	private String dd; 
	private String gender;    
	private String postno;  
	private String addr1;    
	private String addr2;     
	private String addr3;    
	private String inputdate; 
	private String password;  
	private String point;    

}
