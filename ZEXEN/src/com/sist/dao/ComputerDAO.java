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
	
	// 1. 데이터 삽입
	public static void computerInsert(ComputerVO vo) 
	{
		SqlSession
		session=ssf.openSession(); 
		session=ssf.openSession(true);
		session.insert("computerInsert",vo); 
		session.close(); 
	}
	
	// 2. 리스트 출력
	public static List<ComputerVO> computerListData(Map map)
	{
		SqlSession session=ssf.openSession();
		List<ComputerVO> list=session.selectList("computerListData",map);
		session.close();
		return list;
	}
	
	public static Integer computerCategoryCount(int cate_no)
	{
		SqlSession session=ssf.openSession();
		int cate_cnt=session.selectOne("computerCategoryCount",cate_no);
		session.close();
		return cate_cnt;
	}
	
	public static ComputerVO computerDetailData(int com_no)
	{
		SqlSession session=ssf.openSession();
		ComputerVO vo=session.selectOne("computerDetailData",com_no);
		session.close();
		return vo;
	}
	
    public static int computerTotalPage(int cate_no)
    {
    	SqlSession session=ssf.openSession();
	    int total=session.selectOne("computerTotalPage", cate_no);
	    session.close();
	    return total;
    }
	
}
