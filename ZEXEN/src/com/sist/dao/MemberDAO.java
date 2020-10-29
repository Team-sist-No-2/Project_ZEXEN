package com.sist.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.MemberVO;


public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {ssf=CreateSqlSessionFactory.getSsf();}
   
	public static void memberInsert(MemberVO vo)
	  {
	     SqlSession session=ssf.openSession(true);
	     session.insert("memberInsert", vo);
	     session.close();
	  }

	
}
