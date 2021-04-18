package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.ReplyDTO;

import controller.CommandAction;

public class BoardReplyUpdateService implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		int iid = Integer.parseInt(request.getParameter("iid"));
		int rid = Integer.parseInt(request.getParameter("rid"));
		String content = request.getParameter("content");

		BoardDAO dao = BoardDAO.getInstance();
		ReplyDTO dto = new ReplyDTO();
		dto.setContent(content);
		dto.setRid(rid);
		dao.replyUpdate(dto);

		return "boardView.do?iid=" + iid + "&pg=1";
	}
}
