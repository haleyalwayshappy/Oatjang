package com.commu.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.commu.dao.CommuDAO;
import com.commu.dto.CommuReplyDTO;

import controller.CommandAction;

public class CommuReplyInsertService implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		int iid = Integer.parseInt(request.getParameter("iid"));
		int ref = Integer.parseInt(request.getParameter("ref"));
		int userid = Integer.parseInt(request.getParameter("userid"));
		String nickname = request.getParameter("nickname");
		String content = request.getParameter("comment");
		CommuReplyDTO dto = new CommuReplyDTO();
		dto.setIid(iid);
		dto.setRef(ref);
		dto.setNickname(nickname);
		dto.setContent(content);
		dto.setUserid(userid);
		CommuDAO dao = CommuDAO.getInstance();
		int reply = dao.getReplyCount(iid);
		if(ref==0) {
			dao.replyInsert(dto,reply);
		}else {
			dao.subReplyInsert(dto);
		}
		return "commu/commuView.jsp";
	}
}
