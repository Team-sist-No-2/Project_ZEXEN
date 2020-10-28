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
	
	//카테고리별 총페이지
	public static int gameTotalPage(int category)
	{
		SqlSession session=ssf.openSession();
		int total=session.selectOne("gameTotalPage",category);
		session.close();
		return total;
	}

	//카테고리별 개수(라디오 버튼 옆에 출력용도)
	public static Integer gameCategoryCount(int category)
	{
		SqlSession session=ssf.openSession();
		int cate_cnt=session.selectOne("gameCategoryCount",category);
		session.close();
		return cate_cnt;
	}

	//디테일 페이지 내용 출력
	public static GameVO gameDetailData(int game_no)
	{
		SqlSession session=ssf.openSession();
		GameVO vo=session.selectOne("gameDetailData",game_no);
		session.close();
		return vo;
	}
	
	public static void gameLikeUp(int game_no)
	{
		SqlSession session=ssf.openSession(true);
		session.update("gameLikeUp",game_no);
		session.close();
	}
	
	public static void gameHateUp(int game_no)
	{
		SqlSession session=ssf.openSession(true);
		session.update("gameHateUp",game_no);
		session.close();
	}
	
}
