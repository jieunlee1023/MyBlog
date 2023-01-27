package com.example.myBlog.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.myBlog.entity.Board;

public interface BoardRepository extends JpaRepository<Board, Integer> {

	@Query(value = " SELECT * FROM board "
						+ " WHERE categoryId = ?1 ",
				nativeQuery = true)
	List<Board> findbyCategoryId(int categoryId);


}
