package com.naver.project.service;

import java.util.ArrayList;

import com.naver.project.entities.Employee;

public interface EmployeeDAO {
	int selectEmpConfirm(String empcode);
	int insertRow(Employee employee);
	ArrayList<Employee> selectAll();
	Employee selectOne(String empcode);
	int updateRow(Employee employee);
	int deleteRow(Employee employee);
	
	
}
