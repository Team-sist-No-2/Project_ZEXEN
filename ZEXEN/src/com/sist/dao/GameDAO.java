package com.sist.dao;

import java.io.Reader;
import com.sist.vo.GameVO;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class GameDAO {
	private static SqlSessionFactory ssf;
	static {ssf=CreateSqlSessionFactory.getSsf();}
   
	//게임넣기
	public static void gameInsert(GameVO vo)
	{
		SqlSession session=ssf.openSession();
		session=ssf.openSession(true);
		session.insert("gameInsert",vo);
		session.close();
	}
	
	

	 
}
