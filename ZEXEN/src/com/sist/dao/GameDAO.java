package com.sist.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;
import com.sist.vo.GameVO;
import com.sist.vo.ReplyVO;

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
	
	//게임 좋아요 버튼
	public static void gameLikeUp(int game_no)
	{
		SqlSession session=ssf.openSession(true);
		session.update("gameLikeUp",game_no);
		session.close();
	}
	
	//게임 싫어요 버튼
	public static void gameHateUp(int game_no)
	{
		SqlSession session=ssf.openSession(true);
		session.update("gameHateUp",game_no);
		session.close();
	}
	
	//게임 댓글 입력
	public static void gameReplyInsert(ReplyVO rvo)
	{
		SqlSession session=ssf.openSession();
		session=ssf.openSession(true);
		session.insert("gameReplyInsert",rvo);
		session.close();
	}
	
	//게임 디테일 페이지에 댓글 리스트 출력
	public static List<ReplyVO> gameReplyListData(int game_no)
    {
		SqlSession session=ssf.openSession();
		List<ReplyVO> list=session.selectList("gameReplyListData",game_no);
		session.close();
		return list;
    }
	
	//게임 검색단어에 대한 리스트 출력
	public static List<GameVO> gameSearchData(Map map)
    {
		SqlSession session=ssf.openSession();
		List<GameVO> list=session.selectList("gameSearchData",map);
		session.close();
		return list;
    }

	//게임 검색단어 10개단위 총 페이지 출력
	public static int gameSearchTotalPage(Map map)
	{
	    SqlSession session=ssf.openSession();
	    int total=session.selectOne("gameSearchTotalPage",map);
	    session.close();
	    return total;
	}
}
