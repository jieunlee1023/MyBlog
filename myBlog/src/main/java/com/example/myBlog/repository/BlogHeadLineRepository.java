package com.example.myBlog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.myBlog.entity.BlogHeadLine;

public interface BlogHeadLineRepository extends JpaRepository<BlogHeadLine, Integer>{

}
