package com.sist.model;

import java.util.*;

import com.sist.dao.NewsDAO;
import com.sist.vo.NewsVO;
import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;

public class NewsModel {

	@RequestMapping("news/main.do")
	public String news(HttpServletRequest request) {

		String page = request.getParameter("page");
		if (page == null)
			page = "1";

		int curpage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;

		Map map = new HashMap();

		map.put("start", start);
		map.put("end", end);
		List<NewsVO> List = NewsDAO.newsData(map);
		
		int totalpage = NewsDAO.newsTotalPage();
		
		//====================================
		int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		//====================================
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("List", List);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("main_jsp", "../news/main.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("news/list.do")
	public String list(HttpServletRequest request) {
		
		String page = request.getParameter("page");
		if (page == null)
			page = "1";

		int curpage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;

		Map map = new HashMap();

		map.put("start", start);
		map.put("end", end);
		List<NewsVO> List = NewsDAO.newsData(map);
		
		int totalpage = NewsDAO.newsTotalPage();
		
		//====================================
		int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		//====================================
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("List", List);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		

//		String page = request.getParameter("page");
//		if (page == null)
//			page = "1";
//
//		int curpage = Integer.parseInt(page);
//		int rowSize = 10;
//		int start = (rowSize * curpage) - (rowSize - 1);
//		int end = rowSize * curpage;
//
//		Map map = new HashMap();
//
//		map.put("start", start);
//		map.put("end", end);
//		List<NewsVO> List = NewsDAO.newsData(map);
//		
//		request.setAttribute("List", List);

		return "../news/list.jsp";
	}
	
	 

	@RequestMapping("news/detail.do")
		public String news_detail(HttpServletRequest request) {
			String no=request.getParameter("news_no");
			int news_no=Integer.parseInt(no);
			
			NewsVO vo=NewsDAO.newsDetailData(news_no);
			
			request.setAttribute("vo", vo);
			request.setAttribute("main_jsp", "../news/detail.jsp");
		
		return "../main/main.jsp";
	}
	
	@RequestMapping("news/like.do")
	public String news_like(HttpServletRequest request) {
		String no=request.getParameter("news_no");
		NewsDAO.like(Integer.parseInt(no));
		return "redirect:../news/list.do?no="+no;
	}
	
	@RequestMapping("news/hit.do")
	public String news_hit(HttpServletRequest request) {
		String no=request.getParameter("news_no");
		NewsDAO.hitIncrement(Integer.parseInt(no));
		return "redirect:../news/list.do?no="+no;
	}
	
	
	
}