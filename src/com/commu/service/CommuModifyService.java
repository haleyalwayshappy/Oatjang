package com.commu.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commu.dao.CommuDAO;
import com.commu.dto.CommuDTO;

import controller.CommandAction;

public class CommuModifyService implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int iid = Integer.parseInt(request.getParameter("iid"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		CommuDAO dao = CommuDAO.getInstance();
		CommuDTO dto = dao.getCommu(iid);
		
		request.setAttribute("dto", dto);
		request.setAttribute("iid", iid);
		request.setAttribute("pg", pg);
		
		return "commu/commuModify.jsp";
	}
}
