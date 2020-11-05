package com.sist.dao;
import java.util.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import com.sist.vo.BoardVO;
import com.sist.vo.ReplyVO;

import java.io.*;

public class BoardDAO {
   // 파싱(XML) => SqlSessionFactory
	private static SqlSessionFactory ssf;
	// 구동하기전에 자동으로 파싱을 한다 => 초기화블럭 (static => static{} , instance => {})
	static
	{
		/*
		// 오류 처리  => Mybatis (컴파일 오류(X) => 에러가 발생시에 찾기 어렵다)
		try
		{
			// IO => 파일경로 , 파일명이 틀릴경우에 처리(컴파일예외=>반드시 예외처리를 한다)
			// 파일 읽기
			Reader reader=Resources.getResourceAsReader("Config.xml");
			// MyBatis,Spring => classpath(자동으로 인식하는 경로 : src) 
			// XML 파싱 
			ssf=new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		*/
		ssf=CreateSqlSessionFactory.getSsf();
	}
	/*
	 *   <select id="boardListData" resultType="BoardVO" parameterType="hashmap">
		   SELECT no,subject,name,regdate,hit,num
		   FROM (SELECT no,subject,name,regdate,hit,rownum as num
		   FROM (SELECT no,subject,name,regdate,hit 
		   FROM freeboard ORDER BY no DESC))
		   WHERE num BETWEEN #{start} AND #{end}
		  </select>
		  <select id="boardTotalPage" resultType="int">
		   SELECT CEIL(COUNT(*)/10.0) FROM freeboard
		  </select>
	 */
	

	
	
	//            resultType                parameterType
	public static List<BoardVO> boardListData(Map map)
	{
		System.out.println("boardList 호출 DAO");
		List<BoardVO> list=new ArrayList<BoardVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();// Connection얻기
			list=session.selectList("boardListData",map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
			session.close();//Connection반환
		}
		System.out.println("boardList종료");
		return list;// null 
	}
	//게시글작성
	public static void boardInsert(BoardVO vo) {
		SqlSession session=ssf.openSession(true);
		session.insert("boardInsert",vo);
		session.close();
	}	
	
	//총페이지
	public static int boardTotalPage()
	{
		int total=0;
		SqlSession session=ssf.openSession();
		total=session.selectOne("boardTotalPage");
		session.close();
		return total;
	}
	/*
	 *   <update id="hitIncrement" parameterType="int">
		     UPDATE freeboard SET
		     hit=hit+1
		     WHERE no=#{no}
		   </update>
		   <select id="boardDetailData" resultType="BoardVO" parameterType="int">
		     <!-- public BoardVO boardDetailData(int no) -->
		     SELECT no,name,subject,content,regdate,hit
		     FROM freeboard
		     WHERE no=#{no}
		   </select>
	 */
	/*
	 *   CURD 
	 *     <select>
	 *       SQL => 1개만 사용 (select문장)
	 *     </select>
	 *     <insert>
	 *       1개 (insert)
	 *     </insert>
	 *     <update>
	 *     </update>
	 *     <delete>
	 *     </delete>
	 *     
	 *     단 => 구현한 메소드는 여러개를 동시에 읽어서 처리 
	 */
	public static BoardVO boardDetailData(int board_no)
	{
		SqlSession session=ssf.openSession();
		// 조회수 증가
		session.update("boardHitIncrement", board_no);
		session.commit();// 정상적으로 저장 
		// 데이터 읽기
		BoardVO vo=session.selectOne("boardDetailData", board_no);
		// 반환
		session.close();
		return vo;
	}
	
	public static List<BoardVO> boardCateListData(Map map)
	{
		System.out.println("boardCateListData 호출 DAO");
		List<BoardVO> list=new ArrayList<BoardVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();// Connection얻기
			list=session.selectList("boardCateListData",map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
			session.close();//Connection반환
		}
		System.out.println("boardCateListData종료");
		return list;// null 
	}
	
	public static int boardCateTotalPage(int board_cate_no)
	{
		SqlSession session=ssf.openSession();
		int total=session.selectOne("boardCateTotalPage",board_cate_no);
		session.close();
		return total;
	}
	//게시글 댓글 입력
	public static void replyInsert(ReplyVO rvo)
	   {
		   SqlSession session=ssf.openSession(true);// commit(X)
		   // commit() ==> DML
		   session.insert("replyInsert",rvo);
		   session.close();
	   }
	//게시글 댓글 리스트 출력
	public static List<ReplyVO> replyListData(int board_no)
	   {
		   SqlSession session=ssf.openSession();
		   List<ReplyVO> list=session.selectList("replyListData",board_no);
		   session.close();
		   return list;
	   }
	//리스트에 게시글 댓글 총 갯수 출력
	 public static int replyCount(int board_no)
	   {
		   SqlSession session=ssf.openSession();
		   int count=session.selectOne("boardreplyCount", board_no);
		   session.close();
		   return count;
	   }
	//게시글 총 갯수
	 public static int boardCount()
	   {
		   SqlSession session=ssf.openSession();
		   int boardCount=session.selectOne("boardCount");
		   session.close();
		   return boardCount;
	   }
	 public static int boardCountCate(int cate)
	   {
		   SqlSession session=ssf.openSession();
		   int boardCount=session.selectOne("boardCountCate", cate);
		   session.close();
		   return boardCount;
	   }

}






