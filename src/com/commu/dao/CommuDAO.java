package com.commu.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.board.dto.BoardDTO;
import com.board.dto.ReplyDTO;
import com.commu.dto.CommuDTO;
import com.commu.dto.CommuReplyDTO;


public class CommuDAO {
	private static SqlSessionFactory factory;
	private static CommuDAO instance;
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
	public static CommuDAO getInstance() {
		if (instance == null) {
			synchronized (CommuDAO.class) {
				instance = new CommuDAO();
			}
		}
		return instance;
	}
	public void commuInsert(CommuDTO dto) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.insert("mybatis.CommuMapper.commuInsert", dto);

			if (n > 0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	public List<CommuDTO> getCommuList(Map<String, Integer> map) {
		SqlSession session = factory.openSession();
		List<CommuDTO> list = session
				.selectList("mybatis.CommuMapper.getCommuList", map);
		session.close();
		
		return list;
	}
	public CommuDTO getCommu(int iid) {
		SqlSession session = factory.openSession();
		CommuDTO dto = session.selectOne("mybatis.CommuMapper.getCommu", iid);
		session.close();
		return dto;
	}
	public void commuUpdate(CommuDTO dto) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.update("mybatis.CommuMapper.commuUpdate", dto);
			if (n > 0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	public String deleteBoard(int iid) {
		SqlSession session = factory.openSession();
		CommuDTO dto = session.selectOne("mybatis.CommuMapper.getCommu", iid);
		String imgNames = dto.getImages();
		session.close();

		session = factory.openSession();
		int n = 0;
		try {
			n = session.update("mybatis.CommuMapper.commuDelete", iid);
			if (n > 0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return imgNames;
	}
	public void upHit(int iid) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.update("mybatis.CommuMapper.updateHit", iid);
			if (n > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		
	}
	public List<CommuReplyDTO> getReplyList(int iid) {
		SqlSession session = factory.openSession();
		List<CommuReplyDTO> list = session
				.selectList("mybatis.CommuMapper.getReplyList", iid);
		session.close();
		return list;
	}
	public void replyInsert(CommuReplyDTO dto, int reply) {
		SqlSession session = factory.openSession();
		if (reply != 0) {
			int step = session.selectOne("mybatis.CommuMapper.getReplyStep",dto);
			session.close();
			dto.setStep(step + 1);
			session = factory.openSession();
		} else {
			dto.setStep(1);
		}
		// 댓글 입력
		int n;
		try {
			n = session.insert("mybatis.CommuMapper.replyInsert", dto);
			if (n > 0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		// reply update
		session = factory.openSession();
		n = 0;
		try {
			n = session.update("mybatis.CommuMapper.commuUpdateReply",
					dto.getIid());
			if (n > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}
	public void subReplyInsert(CommuReplyDTO dto) {
		// 부모 댓글의 가장 큰 step 가져오기
		SqlSession session = factory.openSession();
		int step = session.selectOne("mybatis.CommuMapper.getSubReplyStep",
				dto.getRef());
		session.close();
		dto.setStep(step + 1);
		// 댓글 step update
		int n = 0;
		session = factory.openSession();
		try {
			n = session.update("mybatis.CommuMapper.replyUpdateStep",
					dto);
			if (n > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		// 대댓글 추가
		session = factory.openSession();
		n = 0;
		try {
			n = session.insert("mybatis.CommuMapper.subReplyInsert", dto);
			if (n > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		// reply update
		session = factory.openSession();
		n = 0;
		try {
			n = session.update("mybatis.CommuMapper.commuUpdateReply",
					dto.getIid());
			if (n > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}
	public void replyUpdate(CommuReplyDTO dto) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.update("mybatis.CommuMapper.replyUpdate", dto);
			if (n > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}
	public void replyDelete(int rid, int iid) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.update("mybatis.CommuMapper.replyDelete", rid);
			if (n > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}

		session = factory.openSession();
		n = 0;
		try {
			n = session.update("mybatis.CommuMapper.commuUpdateReply", iid);
			if (n > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}
	public int getTotalArticle() {
		SqlSession session = factory.openSession();
		int n = session.selectOne("mybatis.CommuMapper.getTotalArticle");
		session.close();
		return n;
	}
	public List<CommuDTO> getBoardSearchByTitleAndCategoryAndDescription(Map<String, Object> map) {
		SqlSession session = factory.openSession();
		List<CommuDTO> list = session
				.selectList("mybatis.CommuMapper.getCommuSearchList", map);
		session.close();

		return list;
	}
	public int getBoardSearchList(Map<String, Object> map) {
		SqlSession session = factory.openSession();
		int n = session.selectOne("mybatis.CommuMapper.getCommuSearchListCount", map);
		session.close();

		return n;
	}
	public String getNickname(int userid) {
		SqlSession session = factory.openSession();
		String nickname = session.selectOne("mybatis.BoardMapper.getNickname", userid);
		session.close();

		return nickname;
	}
	public int getReplyCount(int iid) {
		SqlSession session = factory.openSession();
		int n = session.selectOne("mybatis.CommuMapper.getReplyCount", iid);
		session.close();

		return n;
	}
}
