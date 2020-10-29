package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.NewsVO;
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
		
		NewsVO vo=session.selectOne("newsDetailData",news_no);
		session.close();
		return vo;
	}
	
	/*
	 *  <update id="hitIncrement" parameterType="int">
		UPDATE news SET
		hit=hit+1
		WHERE no=#{no}
		</update>
	 */
	
	public static void hitIncrement(int hit) {
		SqlSession session=ssf.openSession(true);
		session.update("hitIncrement",hit);
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
}