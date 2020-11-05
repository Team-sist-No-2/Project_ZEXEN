package com.sist.dao;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.controller.RequestMapping;
import com.sist.vo.NewsVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.WishVO;
public class NewsDAO {
	
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	/*
	 <select id="newsData" resultType="NewsVO" parameterType="hashmap">

	 SELECT news_no,subject,content,poster,regdate,hit,like_cnt,hate_cnt,member_id,num
	 FROM (SELECT news_no,subject,content,poster,regdate,hit,like_cnt,hate_cnt,member_id,rownum as num
	 FROM (SELECT news_no,subject,content,poster,regdate,hit,like_cnt,hate_cnt,member_id
	 FROM news))
	 WHERE num BETWEEN #{start} AND #{end}
	</select>
	
	<select id="newsTotalPage" resultType="int">
	SELECT CEIL(count(*)/10.0) FROM news
	</select>
	 */
	
	public static List<NewsVO> newsData(Map map){
		SqlSession session=ssf.openSession();
		List<NewsVO> list=session.selectList("newsData",map);
		session.close();
		return list;
	}
	
	public static int newsTotalPage() {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("newsTotalPage");
		session.close();
		return total;
	}
	
	//==========================================================
	/*
	 * <select id="newsDetailData" resultType="NewsVO" parameterType="int">
		SELECT * FROM news
		WHERE news_no=#{news_no}
		</select>

	 */
	
	public static NewsVO newsDetailData(int news_no) {
		SqlSession session=ssf.openSession();
		
//		session.update("hitIncrement",news_no);
//		session.commit();
		NewsVO vo=session.selectOne("newsDetailData",news_no);
		
		
//		try {
//			session.update("hitIncrement", news_no);
//			session.commit();
//		}catch(Exception ex) {
//			ex.printStackTrace();
//		}finally {
//			if(session!=null)
//				
//		}
		session.close();
		return vo;
	}
	
//	public static NewsVO newsDetailData(int news_no) {
//		SqlSession session=ssf.openSession();
//		NewsVO vo=session.selectOne("newsDetailData",news_no);
//		try {
//			
//			session.update("hitIncrement", news_no);
//			session.commit();
//			
//		}catch(Exception ex) {
//			ex.printStackTrace();
//			}finally {
//				if(session!=null)
//					session.close();
//		}
//		
//		return vo;
//	}
	
	
	
	/*
	 *  <update id="hitIncrement" parameterType="int">
		UPDATE news SET
		hit=hit+1
		WHERE no=#{no}
		</update>
	 */
	
	public static void hitIncrement(int news_no) {
		SqlSession session=ssf.openSession(true);
		session.update("com.sist.mapper.news-mapper.hitIncrement",news_no);
		session.commit();
		session.close();
	}
	
	/*
	 * <update id="like" parameterType="HashMap">
		UPDATE news
		SET like_cnt=like_cnt+1
		WHERE news_no=#{news_no} 
		</update>
	 */
	public static void like(int news_no) {
		SqlSession session=ssf.openSession(true);
		session.update("like",news_no);
		session.close();
	}
	
	
	public static void hate(int news_no) {
		SqlSession session=ssf.openSession(true);
		session.update("hate",news_no);
		session.close();
	}
	
//	
	
	
	
	
	
	/*
	 * <insert id="newsReplyInsert" parameterType="ReplyVO">
		INSERT INTO reply_tb(reply_no,category,news_no,msg,id) VALUES (
		(SELECT NVL(reply_no)+1,1) FROM reply_tb),
		#{category},
		#{news_no},
		#{msg},
		${id}
		)
	</insert>
	
	<select id="newsReplyListData" resultType="ReplyVO">
		SELECT reply_no,category,news_no,msg,id,regdate
		FROM reply_tb
		WHERE news_no=#{news_no}
		ORDER BY regdate desc
	</select>
	 */
	
	public static void newsReplyInsert(ReplyVO nvo) {
		SqlSession session=ssf.openSession();
		session=ssf.openSession(true);
		session.insert("newsReplyInsert",nvo);
		session.close();
	}
	
	public static List<ReplyVO> newsReplyListData(int news_no){
		SqlSession session=ssf.openSession();
		List<ReplyVO> list=session.selectList("newsReplyListData",news_no);
		session.close();
		return list;
	}

	
	/*
	 * <select id="newsHitCount" resultType="NewsVO" parameterType="hashmap">
		SELECT poster,subject,content,num 
		FROM(SELECT poster,subject,content,rownum as num
		FROM(SELECT poster,subject,content
		FROM news ORDER BY hit)) 
		WHERE num BETWEEN 1 AND 4;
		</select>
	 */
	
	public static List<NewsVO> newsSearchData(Map map){
		SqlSession session=ssf.openSession();
		List<NewsVO> list=session.selectList("newsSearchData",map);
		session.close();
		return list;
	}
	
	public static int newsSearchTotalPage(Map map) {
		SqlSession session=ssf.openSession();
		int total=session.selectOne("newsSearchTotalPage",map);
		session.close();
		return total;
	}
	
	public static void newsWishInsert(WishVO vo) {
		SqlSession session=ssf.openSession(true);
		session.insert("newsWishInsert",vo);
		session.close();
	}
	
	public static int newsWishCount(WishVO vo) {
		SqlSession session=ssf.openSession();
		int count =session.selectOne("newsWishCount",vo);
		session.close();
		return count;
	}
	
	public static void newsWishDelete(WishVO vo) {
		SqlSession session =ssf.openSession(true);
		session.delete("newsWishDelete",vo);
		session.close();
	}
	
	
	
	
}