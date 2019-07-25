package com.proj.capp.service;

import java.io.ByteArrayInputStream;
import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.support.SqlLobValue;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.stereotype.Service;
import com.proj.capp.damain.User;
import com.proj.capp.dao.BaseDAO;
import com.proj.capp.dao.UserDao;
import com.proj.capp.exception.UserBlockedException;
import com.proj.capp.rm.UserRowMapper;

@Service
public class UserServiceImpl extends BaseDAO implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	public void register(User u) {
		userDao.save(u);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public User login(String loginName, String password) throws UserBlockedException {
		String sql = "SELECT userId,name, phone, email, address, loginName, role, loginStatus FROM user WHERE loginName=:ln AND password=:pw";
		Map m = new HashMap();
		m.put("ln", loginName);
		m.put("pw", password);
		try {
			User u = getNamedParameterJdbcTemplate().queryForObject(sql, m, new UserRowMapper());
			if (u.getLoginStatus() == (UserService.LOGIN_STATUS_BLOCKED)) {
				throw new UserBlockedException("Your account has been blocked.Contact to Admin");
			} else {
				return u;
			}
		} catch (EmptyResultDataAccessException ex) {
			return null;
		}
	}

	@Override
	public List<User> getUserList() {
		return userDao.findByProperty("role", UserService.ROLE_USER);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void changeLoginStatus(int userId, int loginStatus) {
		String sql = "UPDATE user SET loginStatus=:lst WHERE userId=:uid";
		Map m = new HashMap();
		m.put("uid", userId);
		m.put("lst", loginStatus);
		getNamedParameterJdbcTemplate().update(sql, m);
	}

	@Override
	public void updateImage(Integer id, byte[] imageData) {
		MapSqlParameterSource in = new MapSqlParameterSource();
		in.addValue("id", id);
		in.addValue("picture",
				new SqlLobValue(new ByteArrayInputStream(imageData), imageData.length, new DefaultLobHandler()),
				Types.BLOB);

		String sql = "update user set picture = :picture where id = :id";
		getNamedParameterJdbcTemplate().update(sql, in);

		System.out.println("Updated Record with ID = " + id);
	}

}
