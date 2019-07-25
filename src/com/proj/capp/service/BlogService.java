package com.proj.capp.service;

import java.util.List;

import com.proj.capp.damain.Blog;

public interface BlogService {
	public void save(Blog bl);

	public List<Blog> findAll();
}
