package com.example.myBlog.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.myBlog.dto.response.ResponseDto;
import com.example.myBlog.service.CategoryService;

@RestController
@RequestMapping("/api/category")
public class CategoryApiController {

	@Autowired
	private CategoryService categoryService;
	
	@DeleteMapping("/delete/{categoryId}")
	public ResponseDto<?> categoryDelete(@PathVariable int categoryId){
		categoryService.deleteByCategoryId(categoryId);
		return new ResponseDto<>(HttpStatus.OK, "삭제완료");
	}
}
