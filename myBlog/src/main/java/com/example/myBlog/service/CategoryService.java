package com.example.myBlog.service;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.myBlog.entity.Category;
import com.example.myBlog.repository.CategoryRepository;

@Service
public class CategoryService {

	@Autowired
	private CategoryRepository categoryRepository;

	public void save(Category category) {

		String categoryAllName = category.getCategoryName();
		StringTokenizer stringTokenizer = new StringTokenizer(categoryAllName, ",");

		int tokenSize = stringTokenizer.countTokens();

		categoryRepository.deleteAll();

		for (int i = 1; i <= tokenSize; i++) {
			String categoryName = stringTokenizer.nextToken();
			category.setCategoryName(categoryName);
			category.setId(i);
			categoryRepository.save(category);
		}



	}

}
