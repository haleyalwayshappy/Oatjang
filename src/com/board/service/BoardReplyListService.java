package com.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;
import com.board.dto.ReplyDTO;

import controller.CommandAction;

public class BoardReplyListService implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int iid = Integer.parseInt(request.getParameter("iid"));
		int userid = Integer.parseInt(request.getParameter("userid"));
		BoardDAO dao = BoardDAO.getInstance();

		List<ReplyDTO> list = dao.getReplyList(iid);
		request.setAttribute("list", list);
		request.setAttribute("userid",userid);

		return "board/commentList.jsp";
	}
}
