package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.LoginDAO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class FindPwService implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String phone = request.getParameter("phone");
		
		LoginDAO dao = new LoginDAO();
		
		LoginDTO entity = dao.findPassword(id, phone);
		
		if(entity != null) {
			request.setAttribute("entity", entity);
			
			return "/login/findPw2.jsp";
		}else {
			return "/login/loginFail.jsp";
		}
		

	}
}

