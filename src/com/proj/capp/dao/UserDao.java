package com.proj.capp.dao;

import java.util.List;

import com.proj.capp.damain.User;

public interface UserDao {
	public void save(User u);

	public void update(User u);

	public void delete(User u);

	public void delete(int userId);

	public User findById(int userId);

	public List<User> findAll();

	public List<User> findByProperty(String propName, Object propValue);

}
