package com.example.myBlog.service;

import java.awt.Image;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.myBlog.dto.request.RequestBlogHeadlineDto;
import com.example.myBlog.entity.BlogHeadLine;
import com.example.myBlog.repository.BlogHeadLineRepository;

@Service
public class MainService {

	@Autowired
	private BlogHeadLineRepository blogHeadLineRepository;

	public void blogHeadLineSave(RequestBlogHeadlineDto blogHeadlineDto) {
		// UUID 사용법
		UUID uuid = UUID.randomUUID();

		String imageFileName = uuid + "_" + blogHeadlineDto.getFile().getOriginalFilename();

		Path imageFilePath = Paths.get("C:\\MyBlog\\images\\blog-headLine\\" + imageFileName);

		// 파일 만들기 하는 방법
		try {
			Files.write(imageFilePath, blogHeadlineDto.getFile().getBytes());
			// DB 저장 로직 추가
			BlogHeadLine blogHeadLine = blogHeadlineDto.toEntitiy(imageFileName);
			blogHeadLineRepository.save(blogHeadLine);

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public void findByDto() {
		List<BlogHeadLine> headlineEntity = blogHeadLineRepository.findAll();
	}

}
