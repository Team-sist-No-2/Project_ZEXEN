package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sist.vo.ComputerVO;
import com.sist.vo.GameVO;


public class ComputerDAO {
	private static SqlSessionFactory ssf;
	static 
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
   
	/*
	 * public static void computerInsert(ComputerVO vo) { SqlSession
	 * session=ssf.openSession(); session=ssf.openSession(true);
	 * session.insert("computerInsert",vo); session.close(); }
	 */
	
	public static List<ComputerVO> computerListData(Map map)
	{
		SqlSession session=ssf.openSession();
		List<ComputerVO> list=session.selectList("computerListData",map);
		session.close();
		return list;
	}
	
	public static int computerTotalPage(int cate_no)
	{
		SqlSession session=ssf.openSession();
		int total=session.selectOne("computerListData",cate_no);
		session.close();
		return total;
	}
}
