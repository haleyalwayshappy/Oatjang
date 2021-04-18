package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.LoginDAO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class FindIdService implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));

		LoginDAO dao = new LoginDAO();

		System.out.println(name + ", " + age);
		LoginDTO entity = dao.findId(name, age);

		if (entity != null) {
			request.setAttribute("entity", entity);
			return "/login/findId2.jsp";
		} else {

		}
		return "/login/loginFail.jsp";
	}

}
