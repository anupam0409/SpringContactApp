package com.proj.capp.command;

import org.hibernate.validator.constraints.NotEmpty;

public class LoginCommand {
	@NotEmpty
	private String loginName;
	@NotEmpty
	private String password;
	
	
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
