package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDAO;
import com.login.dao.RegisterDAO;
import com.login.dto.AddressDTO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class ReregisterService implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");

		LoginDTO dto = new LoginDTO();

		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setNickname(request.getParameter("nickname"));
		dto.setName(request.getParameter("name"));
		dto.setAge(Integer.parseInt(request.getParameter("age")));
		dto.setPhone(request.getParameter("phone"));
		dto.setAddrId(Integer.parseInt(request.getParameter("addrId")));

		AddressDTO addr_dto = new AddressDTO();
		addr_dto.setAddrId(Integer.parseInt(request.getParameter("addrId")));
		addr_dto.setRoadFullAddr(request.getParameter("roadFullAddr"));
		addr_dto.setRoadAddrPart1(request.getParameter("roadAddrPart1"));
		addr_dto.setRoadAddrPart2(request.getParameter("roadAddrPart2"));
		addr_dto.setAddrDetail(request.getParameter("addrDetail"));
		addr_dto.setLat(Double.parseDouble(request.getParameter("lat")));
		addr_dto.setLng(Double.parseDouble(request.getParameter("lng")));
		
		System.out.println("id : " + dto.getId());
		System.out.println("pw : " + dto.getPw());
		System.out.println("nickname : " + dto.getNickname());
		
		LoginDAO dao = new LoginDAO();

		dao.updateUser(dto);
		dao.updateAddress(addr_dto);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginComplete", dto);
		session.setAttribute("addressEntity", addr_dto);

		return "login/reRegisterOk.jsp";
	}

}
