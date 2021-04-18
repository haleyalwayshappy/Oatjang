package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;

import controller.CommandAction;

public class BoardReplyDeleteService implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		int iid = Integer.parseInt(request.getParameter("iid"));
		int rid = Integer.parseInt(request.getParameter("rid"));
		BoardDAO dao = BoardDAO.getInstance();
		dao.replyDelete(rid, iid);

		return "boardView.do?iid=" + iid + "&pg=1";
	}
}
