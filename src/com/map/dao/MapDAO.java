package com.map.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.board.dto.BoardDTO;

public class MapDAO {
	private static SqlSessionFactory factory;
	private static MapDAO instance;
	static {
		try {
			String resource = "mybatis/mybatis-config.xml";
			System.out.println(resource);
			Reader reader = Resources.getResourceAsReader(resource);
			System.out.println(reader);
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
		}
	}
	public static MapDAO getInstance() {
		if (instance == null) {
			synchronized (MapDAO.class) {
				instance = new MapDAO();
			}
		}
		return instance;
	}
	public List<BoardDTO> getList() {
		SqlSession session = factory.openSession();
		List<BoardDTO> list = session
				.selectList("mybatis.BoardMapper.getAllBoardList");
		session.close();
		return list;
	}
}