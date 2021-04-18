package com.commu.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commu.dao.CommuDAO;

import controller.CommandAction;

public class CommuReplyDeleteService implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		int iid = Integer.parseInt(request.getParameter("iid"));
		int rid = Integer.parseInt(request.getParameter("rid"));
		CommuDAO dao = CommuDAO.getInstance();
		dao.replyDelete(rid, iid);

		return "commuView.do?iid=" + iid + "&pg=1";
	}
}
