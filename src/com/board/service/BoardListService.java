package com.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;
import com.board.dto.BoardPaging;

import controller.CommandAction;

public class BoardListService implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));

		int pageSize = 9; // 페이지당 게시글 3개 원하면 바꾸면됨
		int endNum = pg * pageSize;
		int startNum = endNum - (pageSize - 1);

		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO> list = dao.getBoardList(map);

		BoardPaging paging = new BoardPaging(pg, 5, pageSize); // 페이지를 3페이지씩 보여줌
		paging.makePagingHTML();

		for (BoardDTO ob : list) {
			String nickname = dao.getNickname(ob.getUserid());
			ob.setNickname(nickname);
		}

		request.setAttribute("list", list);
		request.setAttribute("pg", pg);
		request.setAttribute("paging", paging);

		return "board/boardList.jsp";
	}
}
