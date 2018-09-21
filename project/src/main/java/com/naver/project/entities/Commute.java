package com.naver.project.entities;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class Commute {
	private String empcode;
	private String commutedate;
	private String attendancetime;
	private String leaveworktime;
	private int attendancetype; //0:정상출근 1:지각 2:조퇴 3:결근
	private int leaveworktype;  //0:정시퇴근 1:야근
	private int statetype;		  //0:외근 1:휴가 2:출장
	private String memo;		//특이사항 기록 (입원,경조사 등)
	private String yyyy;
	private String mm;
	private String dd;
	private String athh;
	private String lehh;
	
}
