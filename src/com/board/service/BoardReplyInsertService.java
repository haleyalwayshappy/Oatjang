package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.ReplyDTO;

import controller.CommandAction;

public class BoardReplyInsertService implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		int iid = Integer.parseInt(request.getParameter("iid"));
		int ref = Integer.parseInt(request.getParameter("ref"));
		int userid = Integer.parseInt(request.getParameter("userid"));
		String nickname = request.getParameter("nickname");
		String content = request.getParameter("comment");
		ReplyDTO dto = new ReplyDTO();
		dto.setIid(iid);
		dto.setRef(ref);
		dto.setNickname(nickname);
		dto.setContent(content);
		dto.setUserid(userid);
		BoardDAO dao = BoardDAO.getInstance();
		int reply = dao.getReplyCount(iid);
		if (ref == 0) {
			dao.replyInsert(dto, reply);
		} else {
			dao.subReplyInsert(dto);
		}
		return "board/boardView.jsp";
	}
}
