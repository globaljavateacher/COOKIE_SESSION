package com.global.session.service;

import jakarta.servlet.http.HttpServletRequest;

public class LoginService {
	
	public static boolean login(HttpServletRequest req) {
		String userId = req.getParameter("userId");
		String userPw = req.getParameter("userPw");
		if ( "hong".equals(userId) && "1234".equals(userPw) ) {
			req.getSession().setAttribute("LOGIN", true);
			req.getSession().setAttribute("userId", userId);
			return true;
		} else {
			return false;
		}
	}
	
	public static void logout(HttpServletRequest req) {
		req.getSession().removeAttribute("LOGIN");
		req.getSession().invalidate();
	}

}
