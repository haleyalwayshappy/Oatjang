package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;

import controller.CommandAction;

public class BoardModifyService implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int iid = Integer.parseInt(request.getParameter("iid"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = dao.getBoard(iid);
		
		request.setAttribute("dto", dto);
		request.setAttribute("iid", iid);
		request.setAttribute("pg", pg);
		
		return "board/boardModify.jsp";
	}
}
