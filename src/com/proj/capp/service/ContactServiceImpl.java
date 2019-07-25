package com.proj.capp.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.capp.damain.Contact;
import com.proj.capp.dao.BaseDAO;
import com.proj.capp.dao.ContactDAO;
import com.proj.capp.rm.ContactRowMapper;

@Service
public class ContactServiceImpl extends BaseDAO implements ContactService {
	@Autowired
	private ContactDAO contactDAO;

	@Override
	public void save(Contact c) {
		contactDAO.save(c);
	}

	@Override
	public void update(Contact c) {
		contactDAO.update(c);
	}

	@Override
	public void delete(int contactId) {
		contactDAO.delete(contactId);
	}

	@Override
	public void delete(int[] contactIds) {
		//String ids = toCommaSeparatedString(contactIds);
		//String sql = "DELETE FROM contact WHERE contactId IN(" + ids + ")";
		//getJdbcTemplate().update(sql);
	}

	@Override
	public List<Contact> findUserContact(int userId) {

		return contactDAO.findByProperty("userId", userId);
	}

	@Override
	public List<Contact> findUserContact(int userId, String txt) {
		String sql = "SELECT contactId, userId, name, phone, email, address, remark FROM contact WHERE userId=? AND (name LIKE '%"
				+ txt + "%' OR address LIKE '%" + txt + "%' OR phone LIKE '%" + txt + "%' OR email LIKE '%" + txt
				+ "%' OR remark LIKE '%" + txt + "%')";
		return getJdbcTemplate().query(sql, new ContactRowMapper(), userId);
	}

	@Override
	public Contact findById(int contactId) {
		return contactDAO.findById(contactId);
	}
	
	
}
