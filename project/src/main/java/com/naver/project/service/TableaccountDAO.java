package com.naver.project.service;

import java.util.ArrayList;

import com.naver.project.entities.Tableaccount;

public interface TableaccountDAO {
	int insertRow(Tableaccount tableaccount);
	int selecttableConfirm(String tablecode);
	ArrayList<Tableaccount> selectAll();
	Tableaccount selectOne(String tablecode);
	int updateRow(Tableaccount tableaccount);
	int deleteRow(String tablecode);
	Tableaccount tableLogin(Tableaccount tableaccount);
}
