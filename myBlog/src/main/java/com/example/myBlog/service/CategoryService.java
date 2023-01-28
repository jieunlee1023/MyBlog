package com.example.myBlog.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.myBlog.dto.request.CategoryDto;
import com.example.myBlog.entity.Category;
import com.example.myBlog.repository.ICategoryRepository;

@Service
public class CategoryService {

	@Autowired
	private ICategoryRepository categoryRepository;

	@Transactional
	public void save(CategoryDto categoryDto) {

		List<Category> categories = categoryRepository.findAll();
		if (categories.size() == 0) {
			// 제일 처음 비어있을 때
			for (int i = 0; i < categoryDto.getCategoryName().size(); i++) {
				if (categoryDto.getCategoryName().get(i).isBlank() == false) {
					Category category = new Category(i + 1, categoryDto.getCategoryName().get(i), null, null);
					categoryRepository.save(category);
				}
			}

		} else {
			// 카테고리 안비어있음
			System.out.println(categoryDto);
			for (int i = 0; i < categoryDto.getCategoryName().size(); i++) {
				Optional<Category> categoryEntity = categoryRepository.findbyIdAndName(i + 1,
						categoryDto.getCategoryName().get(i));
				if (categoryDto.getCategoryName().get(i).isBlank() == false) {
					if (categoryEntity.isEmpty() == true) {
						Category category = new Category(i + 1, categoryDto.getCategoryName().get(i), null, null);
						categoryRepository.save(category);
					} else {
						categoryEntity.get().setCategoryName(categoryDto.getCategoryName().get(i));
						categoryRepository.save(categoryEntity.get());
					}

				}

			}

		}
	}
	@Transactional
	public void deleteByCategoryId(int categoryId) {
		categoryRepository.deleteById(categoryId);
	}

}
