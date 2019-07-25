package com.proj.capp.service;

import java.util.List;

import com.proj.capp.damain.Contact;

public interface ContactService {

	public void save(Contact c);

	public void update(Contact c);

	public void delete(int contactId);

	public void delete(int[] contactIds);

	public Contact findById(int contactId);

	public List<Contact> findUserContact(int userId);

	public List<Contact> findUserContact(int userId, String txt);

}
