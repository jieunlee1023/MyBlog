package com.example.myBlog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.myBlog.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

}
