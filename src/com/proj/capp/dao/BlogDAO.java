package com.proj.capp.dao;

import java.util.List;

import com.proj.capp.damain.Blog;

public interface BlogDAO {
	public void save(Blog bl);

	public List<Blog> findAll();
}
