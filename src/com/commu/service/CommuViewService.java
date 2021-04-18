package com.commu.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commu.dao.CommuDAO;
import com.commu.dto.CommuDTO;
import com.commu.dto.CommuReplyDTO;

import controller.CommandAction;

public class CommuViewService implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int iid = Integer.parseInt(request.getParameter("iid"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		CommuDAO dao = CommuDAO.getInstance();
		dao.upHit(iid);
		CommuDTO dto = dao.getCommu(iid);
		String nickname = dao.getNickname(dto.getUserid());
		
		request.setAttribute("dto", dto);
		request.setAttribute("nickname", nickname);
		request.setAttribute("pg", pg);
		return "commu/commuView.jsp";
	}
}
