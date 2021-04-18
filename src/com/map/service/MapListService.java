package com.map.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dto.BoardDTO;
import com.map.dao.MapDAO;

import controller.CommandAction;

public class MapListService implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		MapDAO mapDao = MapDAO.getInstance();

		List<BoardDTO> items = mapDao.getList();

		request.setAttribute("itemList", items);

		// TODO: 이부분은 확인으로 넣은 부분이기 때문에, 나중에 지운다.
		if (items.size() > 0) {
			System.out.println(
					items.get(0).getLat() + ", " + items.get(0).getLng());
		} else {
			System.out.println("아직은 BoardDTO에 물건이 등록되지 않았습니다. ");
		}

		return "map/map.jsp";
	}

}