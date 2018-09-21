package com.naver.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.naver.project.entities.Salary;
import com.naver.project.entities.Salaryroll;

public interface SalaryDAO {
	int insertSalaryRow(Salary salary);
	ArrayList<Salary> selectSalaryAll();
	ArrayList<Salary> selectyn();
	Salary selectOne(String empcode);
	int updateSalaryRow(Salary salary);
	int deleteSalaryRow(Salary salary);
	void salaryDelete(Salary salary);
	
	int insertSalaryrollRow(Salaryroll salaryroll);
	void salaryrollDelete(HashMap rollkey);
	ArrayList<Salaryroll> SalaryRollList(HashMap rollkey);
}
