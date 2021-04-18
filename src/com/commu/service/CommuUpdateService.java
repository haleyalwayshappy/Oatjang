package com.commu.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commu.dao.CommuDAO;
import com.commu.dto.CommuDTO;

import controller.CommandAction;

public class CommuUpdateService implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		int pg = Integer.parseInt(request.getParameter("pg"));
		CommuDTO dto = new CommuDTO();
		dto.setIid(Integer.parseInt(request.getParameter("iid")));
		dto.setTitle(request.getParameter("title"));
		dto.setDescription(request.getParameter("description"));

		CommuDAO dao = CommuDAO.getInstance();
		dao.commuUpdate(dto);

		return "commuList.do?pg="+pg;
	}
}
