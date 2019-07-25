package com.proj.capp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.capp.damain.Blog;
import com.proj.capp.dao.BaseDAO;
import com.proj.capp.dao.BlogDAO;

@Service
public class BlogServiceImpl extends BaseDAO implements BlogService {
	@Autowired
	private BlogDAO blogDAO;

	@Override
	public void save(Blog bl) {
		blogDAO.save(bl);

	}

	@Override
	public List<Blog> findAll() {
		 return blogDAO.findAll();
	}

}
