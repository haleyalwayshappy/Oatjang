package com.board.service;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import com.board.dao.BoardDAO;
import com.board.dto.BoardDTO;
import com.login.dto.AddressDTO;
import com.login.dto.LoginDTO;

import controller.CommandAction;

public class BoardInsertService implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		String realFolder = request.getSession().getServletContext()
				.getRealPath("/images"); // 파일이 저장될 주소 => 나중에 서버를 따로 구동하면 서버에
											// 알아서 올라감
		String file = "";
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);

		BoardDTO dto = new BoardDTO();
		AddressDTO addr_dto = new AddressDTO();
		try {
			List items = upload
					.parseRequest(new ServletRequestContext(request));

			Iterator iterator = items.iterator();
			while (iterator.hasNext()) {
				FileItem item = (FileItem) iterator.next();
				if (!item.isFormField()) {
					String fileName = item.getName();
					File path = new File(realFolder);
					System.out.println(realFolder);
					if (!path.exists()) {
						path.mkdirs();
					}

					if (fileName != "") { // 파일을 upload할 이름으로 ,를 통해 구분해서 db상에
											// 저장하고 upload
						File uploadfile = new File(path + "/" + fileName);
						int n = 0;
						int place = fileName.indexOf('.');
						while (uploadfile.exists()) { // 파일이 존재하면 가장뒤에 1부터 넣어보면서
														// 없는 이름으로 저장한다.
							n++;
							uploadfile = new File(
									path + "/" + fileName.substring(0, place)
											+ n + fileName.substring(place));
						}
						file += uploadfile.getName() + ",";
						item.write(uploadfile);
					}
				} else {
					String fileName = item.getFieldName();
					if (fileName.equals("userid")) {
						dto.setUserid(
								Integer.parseInt(item.getString("utf-8")));
					} else if (fileName.equals("title")) {
						dto.setTitle(item.getString("utf-8"));
						System.out.println("title: " + item.getString());
					} else if (fileName.equals("price")) {
						dto.setPrice(Integer.parseInt(item.getString("utf-8")));
					} else if (fileName.equals("description")) {
						dto.setDescription(item.getString("utf-8"));
					} else if (fileName.equals("category")) {
						String category = item.getString("utf-8");
						int a;
						if (category.equals("상의")) {
							a = 0;
						} else if (category.equals("하의")) {
							a = 1;
						} else if (category.equals("아우터")) {
							a = 2;
						} else if (category.equals("원피스")) {
							a = 3;
						} else if (category.equals("신발")) {
							a = 4;
						} else {
							a = 5;
						}
						dto.setCategory(a);
					} else if (fileName.equals("roadFullAddr")) {
						addr_dto.setRoadFullAddr(item.getString("utf-8"));
					} else if (fileName.equals("roadAddrPart1")) {
						addr_dto.setRoadAddrPart1(item.getString("utf-8"));
					} else if (fileName.equals("roadAddrPart2")) {
						addr_dto.setRoadAddrPart2(item.getString("utf-8"));
					} else if (fileName.equals("addrDetail")) {
						addr_dto.setAddrDetail(item.getString("utf-8"));
					} else if (fileName.equals("lat")) {
						addr_dto.setLat(Double.parseDouble(item.getString()));
					} else if (fileName.equals("lng")) {
						addr_dto.setLng(Double.parseDouble(item.getString()));
					}
				}
			}

		} catch (FileUploadException e) {

			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		dto.setSuccess(0);
		dto.setImages(file);

		BoardDAO dao = BoardDAO.getInstance();
		dao.boardInsert(dto, addr_dto);

		HttpSession session = request.getSession();
		LoginDTO entity = (LoginDTO) session.getAttribute("loginComplete");
		System.out.println("loginComplete : " + entity);

		return "boardList.do?pg=1";
	}
}
