package com.sist.dao;

import java.util.List;
import java.util.Map;
	
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.GameVO;
import com.sist.vo.MainVO;


public class MainDAO {
		private static SqlSessionFactory ssf;
		static {ssf=CreateSqlSessionFactory.getSsf();}

		public static List<MainVO> gameBanner()
		{
			SqlSession session=ssf.openSession();
			List<MainVO> list=session.selectList("gameBanner");
			session.close();
			return list;
		}
		
		public static List<GameVO> ggameBanner()
		{
			SqlSession session=ssf.openSession();
			List<GameVO> list=session.selectList("gameBannerData");
			session.close();
			return list;
		}
		
	}
	
