package com.example.myBlog.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.myBlog.dto.request.CategoryDto;
import com.example.myBlog.entity.Category;
import com.example.myBlog.repository.CategoryRepository;

@Service
public class CategoryService {

	@Autowired
	private CategoryRepository categoryRepository;

	@Transactional
	public void save(CategoryDto categoryDto) {

		categoryDto.getCategoryName().forEach(t -> {
			System.out.println(t);

			List<Category> categories = categoryRepository.findAll();

			if (categories.size() != 0) {
				Category categoryEntity = categoryRepository.findbyCategoryName(t);
				if (categoryEntity == null) {
					Category category = new Category(categories.size()+1, t, null, null);
					categoryRepository.save(category);
				} else {
					System.out.println("이미 있는 목록");
					여기랑 - 할 때 삭제 해야함~!
				}

			} else {
				Category category = new Category(1, t, null, null);
				categoryRepository.save(category);
			}

		});

	}

}
