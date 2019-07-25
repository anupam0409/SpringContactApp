package com.proj.capp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proj.capp.damain.Contact;
import com.proj.capp.service.ContactService;

@Controller
public class ContactController {
	@Autowired
	private ContactService contactService;

	@RequestMapping(value = { "/user_contact_form" })
	public String contactForm(Model m) {
		Contact contact = new Contact();
		m.addAttribute("command", contact);
		return "contact_form";
	}

	@RequestMapping(value = { "/uedit_contact" })
	public String prepareEditForm(Model m, HttpSession session, @RequestParam("cid") int contactId) {
		session.setAttribute("acontactId", contactId);
		Contact c = contactService.findById(contactId);
		m.addAttribute("command", c);
		return "contact_form";
	}

	@RequestMapping(value = { "/usave_contact" })
	public String saveOrUpdateContact(@ModelAttribute("command") Contact c, Model m, HttpSession session) {
		Integer contactId = (Integer) session.getAttribute("acontactId");
		if (contactId == null) {
			try {
				Integer userId = (Integer) session.getAttribute("userId");
				c.setUserId(userId);
				contactService.save(c);
				return "redirect:clist?act=sv";
			} catch (Exception e) {
				e.printStackTrace();
				m.addAttribute("err", "Failed to save Contact");
				return "contact_form";
			}
		} else {
			try {
				c.setContactId(contactId);
				contactService.update(c);
				session.removeAttribute("acontactId");
				return "redirect:clist?act=ed";
			} catch (Exception e) {
				e.printStackTrace();
				m.addAttribute("err", "Failed to Upadte Contact");
				return "contact_form";
			}
		}
	}

	@RequestMapping(value = { "/clist" })
	public String contactList(Model m, HttpSession session) {
		try {
			int userId = (int) session.getAttribute("userId");
			m.addAttribute("contactList", contactService.findUserContact(userId));
			return "clist";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			m.addAttribute("err","Please Login Again");
			return "index";
		}
	}

	@RequestMapping(value = { "/contact_search" })
	public String contactSearch(Model m, HttpSession session, @RequestParam("freeText") String freeText) {
		int userId = (int) session.getAttribute("userId");
		m.addAttribute("contactList", contactService.findUserContact(userId, freeText));
		return "clist";
	}

	@RequestMapping(value = { "/udel_contact" })
	public String deleteContact(@RequestParam("cid") int contactId) {
		contactService.delete(contactId);
		return "redirect:clist?act=del";
	}

	@RequestMapping(value = { "/ubulk_del" })
	public String bulkDeleteContact(@RequestParam("cid") int[] contactIds) {
		contactService.delete(contactIds);
		return "redirect:clist?act=del";
	}
}
