package com.proj.capp.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.proj.capp.command.LoginCommand;
import com.proj.capp.command.UserCommand;
import com.proj.capp.damain.User;
import com.proj.capp.exception.UserBlockedException;
import com.proj.capp.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping(value = { "/", "/index" })
	public String index(Model m) {
		m.addAttribute("command", new LoginCommand());
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String handleLogin(@ModelAttribute("command") LoginCommand cmd, Model m, HttpSession session) {
		try {
			User loggedInUser = userService.login(cmd.getLoginName(), cmd.getPassword());
			if (loggedInUser == null) {
				m.addAttribute("err", "Login failed!!Enter Proper credentials");
				return "index";
			} else {
				if (loggedInUser.getRole() == UserService.ROLE_ADMIN) {
					addUserInSession(loggedInUser, session);
					System.out.println(cmd.getLoginName());
					session.setAttribute("loginName", cmd.getLoginName());
					return "redirect:admin_dashboard";
				} else if (loggedInUser.getRole() == UserService.ROLE_USER) {
					addUserInSession(loggedInUser, session);
					session.setAttribute("loginName", cmd.getLoginName());
					return "redirect:user_dashboard";
				} else {
					m.addAttribute("err", "Invalid User Role");
					return "index";
				}
			}
		} catch (UserBlockedException e) {
			m.addAttribute("err", e.getMessage());
			return "index";
		}
	}

	@RequestMapping(value = { "/logout" })
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:index?act=lo";
	}

	@RequestMapping(value = { "/user_dashboard" })
	public String userDashboard() {
		return "user_dashboard";
	}

	@RequestMapping(value = { "/admin_dashboard" })
	public String adminDashboard() {
		return "admin_dashboard";
	}

	@RequestMapping(value = { "/about" })
	public String aboutUs(Model m) {
		return "about";
	}

	@RequestMapping(value = { "/admin_users" })
	public String getUserList(Model m) {
		m.addAttribute("userList", userService.getUserList());
		return "users";
	}

	@RequestMapping(value = { "/reg_form" })
	public String registrationForm(Model m) {
		UserCommand cmd = new UserCommand();
		m.addAttribute("command", cmd);
		return "reg_form";
	}

	@RequestMapping(value = "/register")
	public String registerUser(@ModelAttribute("command") UserCommand cmd, Model m) {
		try {
			User user = cmd.getUser();
			user.setRole(UserService.ROLE_USER);
			user.setLoginStatus(UserService.LOGIN_STATUS_ACTIVE);
			userService.register(user);
			return "redirect:index?act=reg";
		} catch (DuplicateKeyException e) {
			e.printStackTrace();
			m.addAttribute("err", "Username is already registered. Please select another username.");
			return "reg_form";
		}
	}

	@RequestMapping(value = { "/service" })
	public String ourServices(Model m) {
		return "service";
	}

	private void addUserInSession(User u, HttpSession session) {
		session.setAttribute("user", u);
		session.setAttribute("userId", u.getUserId());
		session.setAttribute("role", u.getRole());
	}

	@RequestMapping(value = "/admin_change_status")
	@ResponseBody
	public String changeLoginStatus(@RequestParam int userId, @RequestParam int loginStatus) {
		try {
			userService.changeLoginStatus(userId, loginStatus);
			return "SUCCESS: Status Changed";
		} catch (Exception e) {
			e.printStackTrace();
			return "ERROR: Unable to Change Status";
		}
	}
	@RequestMapping(value = { "/changepass" })
	public String changePassForm(Model m) {
		User user = new User();
		m.addAttribute("command", user);
		return "change_pass_form";
	}
}
