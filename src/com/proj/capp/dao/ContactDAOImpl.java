package com.proj.capp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.proj.capp.damain.Contact;
import com.proj.capp.rm.ContactRowMapper;

@Repository
public class ContactDAOImpl extends BaseDAO implements ContactDAO {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void save(Contact c) {
		String sql = "INSERT INTO contact(userId, name, phone, email, address, remark) VALUES(:userId, :name, :phone, :email, :address, :remark)";
		Map m = new HashMap();
		m.put("userId", c.getUserId());
		m.put("name", c.getName());
		m.put("phone", c.getPhone());
		m.put("email", c.getEmail());
		m.put("address", c.getAddress());
		m.put("remark", c.getRemark());

		KeyHolder kh = new GeneratedKeyHolder();
		SqlParameterSource ps = new MapSqlParameterSource(m);
		getNamedParameterJdbcTemplate().update(sql, ps, kh);
		c.setUserId(kh.getKey().intValue());
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void update(Contact c) {
		String sql = "UPDATE contact SET name=:name, phone=:phone, email=:email, address=:address, remark=:remark WHERE contactId=:contactId";
		Map m = new HashMap();
		m.put("contactId", c.getContactId());
		m.put("name", c.getName());
		m.put("phone", c.getPhone());
		m.put("email", c.getEmail());
		m.put("address", c.getAddress());
		m.put("remark", c.getRemark());

		getNamedParameterJdbcTemplate().update(sql, m);
	}

	@Override
	public void delete(Contact c) {
		this.delete(c.getContactId());

	}

	@Override
	public void delete(int contactId) {
		String sql = "DELETE FROM contact WHERE contactId=?";
		getJdbcTemplate().update(sql, contactId);
	}

	@Override
	public Contact findById(int contactId) {
		String sql = "SELECT contactId, userId, name, phone, email, address, remark FROM contact WHERE contactId=?";
		Contact c = getJdbcTemplate().queryForObject(sql, new ContactRowMapper(), contactId);
		return c;
	}

	@Override
	public List<Contact> findAll() {
		String sql = "SELECT contactId, userId, name, phone, email, address, remark FROM contact";
		// List<Contact> contacts= getJdbcTemplate().queryForObject(sql, new
		// ContactRowMapper());
		return getJdbcTemplate().query(sql, new ContactRowMapper());

	}

	@Override
	public List<Contact> findByProperty(String propName, Object propValue) {
		String sql = "SELECT contactId, userId, name, phone, email, address, remark FROM contact WHERE " + propName
				+ "=?";

		return getJdbcTemplate().query(sql, new ContactRowMapper(), propValue);
	}

}
