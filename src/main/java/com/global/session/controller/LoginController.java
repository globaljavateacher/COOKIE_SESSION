package com.global.session.controller;

import com.global.session.service.LoginService;

import jakarta.servlet.http.HttpServletRequest;

public class LoginController {
	
	public static String login(HttpServletRequest req) {
		boolean result = LoginService.login(req);
		if ( result ) {
			return "redirect:/";
		} else {
			return "redirect:/login?msg=ERR_001";
		}
	}
	
	public static String logout(HttpServletRequest req) {
		LoginService.logout(req);
		return "redirect:/";
	}

}
