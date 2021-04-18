package com.commu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commu.dao.CommuDAO;
import com.commu.dto.CommuDTO;
import com.commu.dto.CommuSearchPaging;

import controller.CommandAction;

public class CommuSearchService implements CommandAction{

	

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		String searchentity="";
		System.out.println("서치 :" +searchentity);
		int pg = Integer.parseInt(request.getParameter("pg"));
		System.out.println("pg :" +pg);
		
//		int pg = 1;
		
		int pageSize = 5; // 페이지당 게시글 3개 원하면 바꾸면됨 
		int endNum = pg * pageSize;  //
		int startNum = endNum - (pageSize - 1);

		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		System.out.println("startNum :" +startNum);
		System.out.println("endNum :" +endNum);
		
		if(request.getParameter("searchentity") != "") {
			searchentity = request.getParameter("searchentity");
			searchentity = searchentity.toUpperCase();
		}
		//------------------------------------------------------------------
		
		try {
//			private int iid; // 게시글 번호
//			private int userid; // 작성자 번호
//			private String title; // 게시글 제목
//			private int price; // 판매상품 가격
//			private String images; // 이미지들 이름 -> 주소는 같으므로 이름만 있어도 가능
//			private String description; // 판매상품 상세설명
//			private int category; // 판매상품 카테고리
//			private int success; // 판매상황
//			private String bid; // 입찰자 -> 경매용
//		    private int hit;	// 조회수
//		    private String logtime;	// 등록일
			map.put("title","%"+searchentity+"%");
			map.put("category","%"+searchentity+"%");
			map.put("description","%"+searchentity+"%");
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(map.get("title"));
		System.out.println(map.get("category"));
		System.out.println(map.get("description"));
		
		//------------------------------------------------------------------
		CommuDAO dao = CommuDAO.getInstance();
		List<CommuDTO> list = dao.getBoardSearchByTitleAndCategoryAndDescription(map);
		int temp = dao.getBoardSearchList(map); //검색한 글 갯수 가져오기
		
		System.out.println("temp : " +temp);
		System.out.println("pageSize : " +pageSize);
		CommuSearchPaging paging = new CommuSearchPaging(pg,5,pageSize,temp,searchentity); // (1,3,pageSize)
		paging.makePagingHTML();  
		
			System.out.println("list :" +list);
			
			request.setAttribute("list", list);
			request.setAttribute("pg", pg); //1
			request.setAttribute("paging", paging);
			
			//검색을 하면 1페이지에 있는 것만 검색됨
			return "commu/commuSearchList.jsp";
//			return "board/boardList.jsp";
//		return "boardList.do?pg=1";
			
	}

}
