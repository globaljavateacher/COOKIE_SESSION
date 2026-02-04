package com.global.session.servlet;

import java.io.IOException;

import com.global.session.controller.LoginController;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("LoginServlet.doGet");
		req.getRequestDispatcher("/WEB-INF/views/login/login_form.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("LoginServlet.doPost");
		resp.sendRedirect(req.getContextPath() + LoginController.login(req).replace("redirect:", ""));
	}
}
