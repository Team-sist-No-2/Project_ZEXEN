package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sist.vo.ComputerVO;


public class ComputerDAO {
	private static SqlSessionFactory ssf;
	static {ssf=CreateSqlSessionFactory.getSsf();}
   
	//게임넣기
	public static void computerInsert(ComputerVO vo)
	{
		SqlSession session=ssf.openSession();
		session=ssf.openSession(true);
		session.insert("computerInsert",vo);
		session.close();
	}
}
