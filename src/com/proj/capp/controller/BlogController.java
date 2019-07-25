package com.proj.capp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.proj.capp.damain.Blog;
import com.proj.capp.service.BlogService;

@Controller
public class BlogController {
	@Autowired
	private BlogService blogService;

	@RequestMapping(value = { "/savelog" })
	public String saveLog(@ModelAttribute("command") Blog log) {
		blogService.save(log);
		return "redirect:service?act=svb";
	}
	@RequestMapping(value = { "/bloglist" })
	public String getBlogList(Model m) {
		m.addAttribute("blogList", blogService.findAll());
		return "service";
	}
	@RequestMapping(value = { "/map" })
	public String map() {
		return "map";
	}

}
