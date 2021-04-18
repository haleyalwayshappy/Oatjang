package com.commu.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commu.dao.CommuDAO;
import com.commu.dto.CommuReplyDTO;

import controller.CommandAction;

public class CommuReplyListService implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int iid = Integer.parseInt(request.getParameter("iid"));
		int userid = Integer.parseInt(request.getParameter("userid"));
		CommuDAO dao = CommuDAO.getInstance();

		List<CommuReplyDTO> list = dao.getReplyList(iid);
		request.setAttribute("list", list);
		request.setAttribute("userid",userid);

		return "commu/commentList.jsp";
	}
}
