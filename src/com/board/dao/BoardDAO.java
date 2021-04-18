package com.board.dao;

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

import com.login.dto.AddressDTO;
import com.login.dto.LoginDTO;


public class BoardDAO {
	private static SqlSessionFactory factory;
	private static BoardDAO instance;
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
	public void boardInsert(BoardDTO dto, AddressDTO addr_dto) {
		SqlSession session = factory.openSession();
		int n = 0;
		int m = 0;
		try {
			m = session.insert("mybatis.LoginMapper.InsertAddress", addr_dto);
			n = session.insert("mybatis.BoardMapper.boardInsert", dto);

			if (n > 0 && m > 0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public static BoardDAO getInstance() {
		if (instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}
	public int getTotalArticle() {
		SqlSession session = factory.openSession();
		int n = session.selectOne("mybatis.BoardMapper.getTotalArticle");
		session.close();
		return n;
	}
	public int getTotalArticle2() {//검색 총 글수
		SqlSession session = factory.openSession();
		int n = session.selectOne("mybatis.BoardMapper.getTotalArticle2");
		session.close();
		return n;
	}
	public List<BoardDTO> getBoardList(Map<String, Integer> map) {
		SqlSession session = factory.openSession();
		List<BoardDTO> list = session
				.selectList("mybatis.BoardMapper.getBoardList", map);
		session.close();
		return list;
	}
	public String deleteBoard(int iid) {
		SqlSession session = factory.openSession();
		BoardDTO dto = session.selectOne("mybatis.BoardMapper.getBoard", iid);
		String imgNames = dto.getImages();
		session.close();

		session = factory.openSession();
		int n = 0;
		try {
			n = session.update("mybatis.BoardMapper.boardDelete", iid);
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
	public BoardDTO getBoard(int iid) {
		SqlSession session = factory.openSession();
		BoardDTO dto = session.selectOne("mybatis.BoardMapper.getBoard", iid);
		session.close();
		return dto;
	}

	public List<BoardDTO> getBoardSearchByTitleAndCategoryAndDescription(
			Map<String, Object> map) {
		 System.out.println("dao: "+map.get("startNum"));
		 System.out.println("dao: "+map.get("endNum"));
		SqlSession session = factory.openSession();
		System.out.println(map.get("title"));
		List<BoardDTO> list = session
				.selectList("mybatis.BoardMapper.getBoardSearchList", map);
		session.close();
		System.out.println("LIST갯수 : "+list.size());
		return list;
	}

	public void boardUpdate(BoardDTO dto) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.update("mybatis.BoardMapper.boardUpdate", dto);
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
	public List<ReplyDTO> getReplyList(int iid) {
		SqlSession session = factory.openSession();
		List<ReplyDTO> list = session
				.selectList("mybatis.BoardMapper.getReplyList", iid);
		session.close();
		return list;
	}

	public ReplyDTO getReply(int rid) {
		SqlSession session = factory.openSession();
		ReplyDTO dto = session.selectOne("mybatis.BoardMapper.getReply", rid);
		session.close();
		return dto;
	}

	public void replyInsert(ReplyDTO dto, int reply) {
		// 댓글이 있는지 확인하고 있으면 전체 댓글중 step이 가장 큰걸 가져오고 아니면 1
		SqlSession session = factory.openSession();
		if (reply != 0) {
			int step = session.selectOne("mybatis.BoardMapper.getReplyStep",dto);
			session.close();
			dto.setStep(step + 1);
			session = factory.openSession();
		} else {
			dto.setStep(1);
		}
		// 댓글 입력
		int n;
		try {
			n = session.insert("mybatis.BoardMapper.replyInsert", dto);
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
			n = session.update("mybatis.BoardMapper.boardUpdateReply",
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
	public void subReplyInsert(ReplyDTO dto) {
		// 부모 댓글의 가장 큰 step 가져오기
		SqlSession session = factory.openSession();
		int step = session.selectOne("mybatis.BoardMapper.getSubReplyStep",
				dto.getRef());
		session.close();
		dto.setStep(step + 1);
		// 댓글 step update
		int n = 0;
		session = factory.openSession();
		try {
			n = session.update("mybatis.BoardMapper.replyUpdateStep",
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
			n = session.insert("mybatis.BoardMapper.subReplyInsert", dto);
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
			n = session.update("mybatis.BoardMapper.boardUpdateReply",
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
	public void replyUpdate(ReplyDTO dto) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.update("mybatis.BoardMapper.replyUpdate", dto);
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
			n = session.update("mybatis.BoardMapper.replyDelete", rid);
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
			n = session.update("mybatis.BoardMapper.boardUpdateReply", iid);
			if (n > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public int getBoardSearchList(Map<String, Object> map) {
		SqlSession session = factory.openSession();
		int n = session.selectOne("mybatis.BoardMapper.getboardSearchList", map);
		session.close();
		System.out.println("n :"+n);
		return n;
		
	}


	public void upHit(int iid) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.update("mybatis.BoardMapper.updateHit", iid);
			if (n > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public String getNickname(int userid) {
		SqlSession session = factory.openSession();
		String nickname = session.selectOne("mybatis.BoardMapper.getNickname", userid);
		session.close();

		return nickname;
	}

	public void boardComplete(int iid) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.update("mybatis.BoardMapper.boardComplete", iid);
			if (n > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public int getReplyCount(int iid) {
		SqlSession session = factory.openSession();
		int n = session.selectOne("mybatis.BoardMapper.getReplyCount", iid);
		session.close();

		return n;
	}

}
