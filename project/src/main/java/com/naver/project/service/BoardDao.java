package com.naver.project.service;

import java.util.ArrayList;

import com.naver.project.entities.Board;
import com.naver.project.entities.BoardPaging;

public interface BoardDao {
	int insertRow(Board board);
	int selectRowCount(String find);
	ArrayList<Board> pageList(BoardPaging boardpaging);
	ArrayList<Board> selectAll();
	Board selectOne(int b_seq);
	void updateHit(int b_seq);
	int insertReplyRow(Board board);
	void deleteRowref(int b_ref);
	void deleteRowseq(int b_seq);
	void updateRow(Board board);
	
}
