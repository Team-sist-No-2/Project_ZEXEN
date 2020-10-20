package com.sist.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;
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
	
	//카테고리별 게임
	public static List<GameVO> gameListData(Map map)
	{
		SqlSession session=ssf.openSession();
		List<GameVO> list=session.selectList("gameListData",map);
		session.close();
		return list;
	}
	


	 
}
