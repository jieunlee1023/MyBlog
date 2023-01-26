package com.example.myBlog.dto.request;

import java.util.List;

import lombok.Data;

@Data
public class CategoryDto {

	private int id;
	private List<String> categoryName;
}
