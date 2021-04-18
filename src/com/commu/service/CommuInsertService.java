package com.commu.service;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import com.commu.dao.CommuDAO;
import com.commu.dto.CommuDTO;

import controller.CommandAction;

public class CommuInsertService implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		String realFolder = request.getSession().getServletContext()
				.getRealPath("/images"); // 파일이 저장될 주소 => 나중에 서버를 따로 구동하면 서버에
											// 알아서 올라감
		String file = "";
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);

		CommuDTO dto = new CommuDTO();
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
					} else if (fileName.equals("description")) {
						dto.setDescription(item.getString("utf-8"));
					}
				}
			}

		} catch (FileUploadException e) {

			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		dto.setImages(file);

		CommuDAO dao = CommuDAO.getInstance();
		dao.commuInsert(dto);
		
		return "commuList.do?pg=1";
	}
}
