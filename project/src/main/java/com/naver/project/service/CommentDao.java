package com.naver.project.service;

import java.util.ArrayList;

import com.naver.project.entities.Comment;

public interface CommentDao {
	int insertRow(Comment comment);
	ArrayList<Comment> selectOne(int b_code);
	void commentDelete(int c_code);
	Comment selectUpdate(int c_code);
}
