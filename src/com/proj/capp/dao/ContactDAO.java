package com.proj.capp.dao;

import java.util.List;

import com.proj.capp.damain.Contact;

public interface ContactDAO {
	public void save(Contact c);

	public void update(Contact c);

	public void delete(Contact c);

	public void delete(int contactId);

	public Contact findById(int contactId);

	public List<Contact> findAll();

	public List<Contact> findByProperty(String propName, Object propValue);
}
