package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sist.vo.BasketVO;
import com.sist.vo.ComputerVO;
import com.sist.vo.GameVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.WishVO;

public class ComputerDAO {
	
	private static SqlSessionFactory ssf;
	static 
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	// 1. ������ ����
	public static void computerInsert(ComputerVO vo) 
	{
		SqlSession
		session=ssf.openSession(); 
		session=ssf.openSession(true);
		session.insert("computerInsert",vo); 
		session.close(); 
	}
	
	// 2. ����Ʈ ���
	public static List<ComputerVO> computerListData(Map map)
	{
		SqlSession session=ssf.openSession();
		List<ComputerVO> list=session.selectList("computerListData",map);
		session.close();
		return list;
	}
	
	// 3. ��ǻ�� ī�װ��� ����
	public static Integer computerCategoryCount(int cate_no)
	{
		SqlSession session=ssf.openSession();
		int cate_cnt=session.selectOne("computerCategoryCount",cate_no);
		session.close();
		return cate_cnt;
	}
	
	// 4. ��ǻ�� �� ������
	public static ComputerVO computerDetailData(int com_no)
	{
		SqlSession session=ssf.openSession();
		ComputerVO vo=session.selectOne("computerDetailData",com_no);
		session.close();
		return vo;
	}
	
	//컴퓨터 좋아요 버튼
		public static void computerLikeUp(int com_no)
		{
			SqlSession session=ssf.openSession(true);
			session.update("computerLikeUp",com_no);
			session.close();
		}
		
		//컴퓨터 싫어요 버튼
		public static void computerHateUp(int com_no)
		{
			SqlSession session=ssf.openSession(true);
			session.update("computerHateUp",com_no);
			session.close();
		}
		
		//컴퓨터 댓글 입력
		public static void computerReplyInsert(ReplyVO rvo)
		{
			SqlSession session=ssf.openSession();
			session=ssf.openSession(true);
			session.insert("computerReplyInsert",rvo);
			session.close();
		}
		
		//컴퓨터 디테일 페이지에 댓글 리스트 출력
		public static List<ReplyVO> computerReplyListData(int com_no)
	    {
			SqlSession session=ssf.openSession();
			List<ReplyVO> list=session.selectList("computerReplyListData",com_no);
			session.close();
			return list;
	    }
		
	// 5. ��ü ������
    public static int computerTotalPage(int cate_no)
    {
    	SqlSession session=ssf.openSession();
	    int total=session.selectOne("computerTotalPage", cate_no);
	    session.close();
	    return total;
    }
    
    // 6. ��ǻ�� �˻�
	public static List<ComputerVO> computerSearchData(Map map)
    {
		SqlSession session=ssf.openSession();
		List<ComputerVO> list=session.selectList("computerSearchData",map);
		session.close();
		return list;
    }

	// 7. �˻��� ������ �� ����
	public static int computerSearchTotalPage(Map map)
	{
	    SqlSession session=ssf.openSession();
	    int total=session.selectOne("computerSearchTotalPage",map);
	    session.close();
	    return total;
	}
	
	//찜추가
		public static void computerWishInsert(WishVO vo)
		{
			SqlSession session = ssf.openSession(true);
			session.insert("computerWishInsert",vo);
			session.close();
		}
		
		//찜했는지 안했는지
		public static int computerWishCount(WishVO vo) 
		{
			SqlSession session = ssf.openSession();
			int count = session.selectOne("computerWishCount", vo);
			session.close();
			return count;
		}
		
		//컴퓨터 디테일에서 찜삭제
		public static void computerWishDelete(WishVO vo) 
		{
			SqlSession session = ssf.openSession(true);
			session.delete("computerWishDelete", vo);
			session.close();
		}
		
		
		//장바구니추가
		public static void computerBasketInsert(BasketVO vo)
		{
			SqlSession session = ssf.openSession(true);
			session.insert("computerBasketInsert",vo);
			session.close();
		}
		
		//장바구니 추가했는지 안했는지
		public static int computerBasketCount(BasketVO vo) 
		{
			SqlSession session = ssf.openSession();
			int count = session.selectOne("computerBasketCount", vo);
			session.close();
			return count;
		}
			
		//컴퓨터 디테일에서 장바구니삭제
		public static void computerBasketDelete(BasketVO vo) 
		{
			SqlSession session = ssf.openSession(true);
			session.delete("computerBasketDelete", vo);
			session.close();
		}
	
}
