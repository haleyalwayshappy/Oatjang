package com.commu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commu.dao.CommuDAO;
import com.commu.dto.CommuDTO;
import com.commu.dto.CommuPaging;

import controller.CommandAction;

public class CommuListService implements CommandAction {
   @Override
   public String requestPro(HttpServletRequest request,
         HttpServletResponse response) throws Throwable {
      int pg = Integer.parseInt(request.getParameter("pg"));

      int pageSize = 10; // 페이지당 게시글 3개 원하면 바꾸면됨
      int endNum = pg * pageSize;
      int startNum = endNum - (pageSize - 1);

      Map<String, Integer> map = new HashMap<>();
      map.put("startNum", startNum);
      map.put("endNum", endNum);

      CommuDAO dao = CommuDAO.getInstance();
      List<CommuDTO> list = dao.getCommuList(map);

      CommuPaging paging = new CommuPaging(pg, 5, pageSize); // 페이지를 3페이지씩 보여줌
      paging.makePagingHTML();

      for (CommuDTO ob : list) {
         String nickname = dao.getNickname(ob.getUserid());
         ob.setNickname(nickname);
      }

      request.setAttribute("list", list);
      request.setAttribute("pg", pg);
      request.setAttribute("paging", paging);

      return "commu/commuList.jsp";
   }
}
