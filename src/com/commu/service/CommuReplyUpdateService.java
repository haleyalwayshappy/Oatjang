package com.commu.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commu.dao.CommuDAO;
import com.commu.dto.CommuReplyDTO;

import controller.CommandAction;

public class CommuReplyUpdateService implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		int iid = Integer.parseInt(request.getParameter("iid"));
		int rid = Integer.parseInt(request.getParameter("rid"));
		String content = request.getParameter("content");

		System.out.println("CONTENT==> " + content);

		CommuDAO dao = CommuDAO.getInstance();
		CommuReplyDTO dto = new CommuReplyDTO();
		dto.setContent(content);
		dto.setRid(rid);
		dao.replyUpdate(dto);

		return "commuView.do?iid=" + iid + "&pg=1";
	}
}
