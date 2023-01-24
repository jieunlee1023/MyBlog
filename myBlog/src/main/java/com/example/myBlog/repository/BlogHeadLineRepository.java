package com.example.myBlog.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.myBlog.entity.BlogHeadLine;

public interface BlogHeadLineRepository extends JpaRepository<BlogHeadLine, Integer>{
	
	@Query(value = " SELECT * "
  						 + " FROM blogheadline "
						 + " ORDER BY id "
						 + " DESC LIMIT 1 ", 
			nativeQuery = true)
	BlogHeadLine findByLastId();

}
