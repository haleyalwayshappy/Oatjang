package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.LoginDAO;
import com.login.dto.AddressDTO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class MypageUpdateService implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");

		System.out.println("----------------------------");
		String pwd = request.getParameter("pwd");
		System.out.println("----------------------------");
		System.out.println("My Page Update 여부 확인");
		System.out.println("mypwd:" + pwd);
		System.out.println("----------------------------");

		LoginDTO dto = new LoginDTO();

		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setNickname(request.getParameter("nickname"));
		dto.setName(request.getParameter("name"));
		dto.setAge(Integer.parseInt(request.getParameter("age")));
		dto.setPhone(request.getParameter("phone"));
		dto.setAddrId(Integer.parseInt(request.getParameter("addr")));
		
		System.out.println(dto);

		// 패스워드 일치
		if (request.getParameter("pwd") != ""
				&& request.getParameter("pwd").equals(dto.getPw())) {

			LoginDAO dao = new LoginDAO();
			AddressDTO addr_dto = dao.getAddressInfo(dto.getAddrId());
			// 주소 정보를 가져온다.
			if (addr_dto != null) {
				request.setAttribute("addressEntity", addr_dto);

				return "login/mypageReregister.jsp";
			} else {
				// TODO: alert 창을 이용하여, 주소를 가져올수 없음을 알림.
				System.out.println(
						"ERROR: cannot cast address information by address Id");

				return "/index.jsp";
			}

		} else {
			// TODO: alert 창을 이용하여, 비밀번호가 틀림을 알린다.

			return "login/passConfFail.jsp";
		}

	}

}
