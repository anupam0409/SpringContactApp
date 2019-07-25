package com.proj.capp.service;

import java.util.List;

import com.proj.capp.damain.User;
import com.proj.capp.exception.UserBlockedException;

public interface UserService {
	public static final Integer LOGIN_STATUS_ACTIVE = 1;
	public static final Integer LOGIN_STATUS_BLOCKED = 2;

	public static final Integer ROLE_ADMIN = 1;
	public static final Integer ROLE_USER = 2;

	public void register(User u);

	public User login(String loginName, String password) throws UserBlockedException;

	public List<User> getUserList();

	public void changeLoginStatus(int userId, int loginStatus);
	
	public void updateImage(Integer id, byte[] imageData);

	

}
