package com.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;

import controller.CommandAction;

public class BoardUpdateService implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		int pg = Integer.parseInt(request.getParameter("pg"));
		BoardDTO dto = new BoardDTO();
		dto.setIid(Integer.parseInt(request.getParameter("iid")));
		dto.setTitle(request.getParameter("title"));
		System.out.println("price:"+request.getParameter("price"));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));
		String category = request.getParameter("category");
		int a;
		if(category.equals("상의")) {
			a=0;
		}else if(category.equals("하의")){
			a=1;
		}else if(category.equals("아우터")){
			a=2;
		}else if(category.equals("원피스")){
			a=3;
		}else if(category.equals("신발")){
			a=4;
		}else {
			a=5;
		}
		dto.setCategory(a);
		dto.setDescription(request.getParameter("description"));

		BoardDAO dao = BoardDAO.getInstance();
		dao.boardUpdate(dto);

		return "boardList.do?pg="+pg;
	}
}
