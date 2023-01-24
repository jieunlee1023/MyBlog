package com.example.myBlog.dto.request;

import org.springframework.web.multipart.MultipartFile;

import com.example.myBlog.entity.Board;
import com.example.myBlog.entity.Category;

import lombok.Data;

@Data
public class RequestBoardDto {

	private MultipartFile file;
	private String uuid; 
	private String title;
	private String content;
	private Category category;

	// 기능 만들기
	public Board toEntitiy(String boarImg) {
		return Board.builder()
				.title(title)
				.content(content)
				.boardImg(boarImg)
				.category(category)
				.build();
	}

}
