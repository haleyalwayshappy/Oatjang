package com.board.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;

import controller.CommandAction;

public class BoardDeleteService implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String realFolder= request.getSession().getServletContext().getRealPath("/images");
		int pg = Integer.parseInt(request.getParameter("pg"));
		int iid = Integer.parseInt(request.getParameter("iid"));

		BoardDAO dao = BoardDAO.getInstance();
		String imgNames = dao.deleteBoard(iid);
		String[] images = imgNames.split(",");
		File file = null;
		for(String ob:images) {
			file = new File(realFolder+"/"+ob);
			if(file.exists()) {
				file.delete();
			}
		}
		return "boardList.do?pg="+pg;
	}
}
