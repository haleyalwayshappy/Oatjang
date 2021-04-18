package com.login.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.login.dto.AddressDTO;
import com.login.dto.LoginDTO;

public class RegisterDAO {
	private static SqlSessionFactory factory;

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

	public boolean RegisterUser(LoginDTO dto) {
		SqlSession session = factory.openSession();
		int n = 0;
		boolean isInserted = false;

		try {
			n = session.insert("mybatis.LoginMapper.RegisterUser", dto);
			if (n > 0) {
				isInserted = true;
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return isInserted;

	}

	public boolean RegisterUser(LoginDTO loginDto, AddressDTO addressDto) {
		SqlSession session = factory.openSession();
		int n = 0;
		int m = 0;
		boolean isInserted = false;

		try {
			n = session.insert("mybatis.LoginMapper.InsertAddress", addressDto);
			m = session.insert("mybatis.LoginMapper.RegisterUser", loginDto);
			if (n != 0 && m != 0) {
				isInserted = true;
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("address: " + n + " \t " + "user: " + m);
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return isInserted;
	}

	
	
	public boolean mypageUpdate(LoginDTO loginDto, AddressDTO addressDto) {
		SqlSession session = factory.openSession();
		int n = 0;
		int m = 0;
		boolean isInserted = false;
		
		try {
			n = session.update("mybatis.LoginMapper.UpdateAddress", addressDto);
			m = session.update("mybatis.LoginMapper.UpdateRegisterUser", loginDto);
			if (n != 0 && m != 0) {
				isInserted = true;
				session.commit();
			}
		} catch (Exception e) {
			System.out.println("address: " + n + " \t " + "user: " + m);
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return isInserted;
		
	}
}
