package com.login.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.RegisterDAO;
import com.login.dto.AddressDTO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class RegisterService implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("send_id");
		String pw = request.getParameter("send_pw");
		String nickname = request.getParameter("nickname");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("send_age"));
		String phone = request.getParameter("phone");
		// String addr = request.getParameter("addr1") + ", "
		// + request.getParameter("addr2");

		String roadFullAddr = request.getParameter("roadFullAddr");
		String roadAddrPart1 = request.getParameter("roadAddrPart1");
		String roadAddrPart2 = request.getParameter("roadAddrPart2");
		String addrDetail = request.getParameter("addrDetail");
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lng = Double.parseDouble(request.getParameter("lng"));

		LoginDTO loginDto = new LoginDTO();
		loginDto.setId(id);
		loginDto.setPw(pw);
		loginDto.setNickname(nickname);
		loginDto.setName(name);
		loginDto.setAge(age);
		loginDto.setPhone(phone);

		AddressDTO addressDto = new AddressDTO();
		addressDto.setRoadFullAddr(roadFullAddr);
		addressDto.setRoadAddrPart1(roadAddrPart1);
		addressDto.setRoadAddrPart2(roadAddrPart2);
		addressDto.setAddrDetail(addrDetail);
		addressDto.setLat(lat);
		addressDto.setLng(lng);

		System.out.println(loginDto);
		System.out.println("-----------------------------------------------");
		System.out.println(addressDto);

		RegisterDAO dao = new RegisterDAO();

		if (dao.RegisterUser(loginDto, addressDto)) {
			// TODO: 회원가입이 완료 되었습니다.
			return "index.jsp";
		} else {
			// TODO: 회원가입 오류, (이미 있는 회원 아이디 등...)
			return "login/login.jsp";
		}
	}
}
