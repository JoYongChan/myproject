package com.naver.project.service;

import java.util.ArrayList;

import com.naver.project.entities.Guest;

public interface GuestDao {
		int insertRow(Guest guest);
		ArrayList<Guest> selectAll();
		Guest selectOne(String phone);
		int updateRow(Guest guest);
		int deleteRow(String phone);
	}

