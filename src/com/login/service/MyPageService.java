package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.dao.LoginDAO;
import com.login.dto.AddressDTO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class MyPageService implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		HttpSession session = request.getSession();
		LoginDTO dto = (LoginDTO) session.getAttribute("loginComplete");

		LoginDAO dao = new LoginDAO();
		AddressDTO addr_dto = dao.getAddressInfo(dto.getAddrId());

		System.out.println(addr_dto);
		if (addr_dto != null) {
			request.setAttribute("addressEntity", addr_dto);
			request.setAttribute("loginUserEntity", dto);

			return "/login/myPage.jsp";
		} else {
			// TODO: 마이페이지로 아이디를 가져올수 없다는메시지를 보낸다.
			System.out.println(
					"ERROR: cannot cast address information by address Id");

			return "/index.jsp";
		}

	}

}
