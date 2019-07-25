package com.proj.capp.rm;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.proj.capp.damain.User;

public class UserRowMapper implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int i) throws SQLException {

		User u = new User();
		u.setUserId(rs.getInt("userId"));
		u.setName(rs.getString("name"));
		u.setEmail(rs.getString("email"));
		u.setPhone(rs.getString("phone"));
		u.setAddress(rs.getString("address"));
		u.setLoginName(rs.getString("loginName"));
		u.setRole(rs.getInt("role"));
		u.setLoginStatus(rs.getInt("loginStatus"));
		//u.setDob(rs.getDate("dob"));
		//u.setPicture(rs.getBytes("image"));
		return u;
	}

}
