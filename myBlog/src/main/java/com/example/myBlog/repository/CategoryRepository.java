package com.example.myBlog.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.myBlog.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

	
	@Query( value = " SELECT * FROM category "
						 + " WHERE categoryName = ?1 ", 
				nativeQuery = true)
	Category findbyCategoryName(String t);
	
	
	@Query( value = " SELECT * FROM category "
  						 + " WHERE id = ?1 "
						 + " AND categoryName = ?2 " ,
			nativeQuery = true)
	Optional<Category> findbyIdAndName(int i, String string);

}
