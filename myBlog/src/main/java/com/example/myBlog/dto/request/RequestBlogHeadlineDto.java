package com.example.myBlog.dto.request;

import org.springframework.web.multipart.MultipartFile;

import com.example.myBlog.entity.BlogHeadLine;

import lombok.Data;

@Data
public class RequestBlogHeadlineDto {

	private MultipartFile file;
	private String uuid; 
	private String blogName;
	private String youtubeURL;
	private String instagramURL;

	// 기능 만들기
	public BlogHeadLine toEntitiy(String imageUrl) {
		return BlogHeadLine.builder()
				.blogName(blogName)
				.youtubeURL(youtubeURL)
				.instagramURL(instagramURL)
				.image(imageUrl)
				.build();
	}

}
