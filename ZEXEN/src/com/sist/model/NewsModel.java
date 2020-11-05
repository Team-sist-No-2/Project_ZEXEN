package com.sist.model;

import java.net.URL;
import java.net.URLEncoder;
import java.util.*;

import com.sist.dao.BoardDAO;
import com.sist.dao.NewsDAO;
import com.sist.vo.NewsVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.WishVO;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import com.sist.controller.RequestMapping;

public class NewsModel {

	@RequestMapping("news/main.do")
	public String news(HttpServletRequest request) {

		String page = request.getParameter("page");
		if (page == null)
			page = "1";

		int curpage = Integer.parseInt(page);
		int rowSize = 3;
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
		
////		
		//===================================== 쿠키
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		Cookie[] cookies=request.getCookies();
		List<NewsVO> oList=new ArrayList<NewsVO>();
		if(cookies!=null) {
			for(int i=cookies.length-1;i>0;i--) {
				if(cookies[i].getName().startsWith(id))
				{
					cookies[i].setPath("/");
					String no=cookies[i].getValue();
					
					NewsVO vo=NewsDAO.newsDetailData(Integer.parseInt(no));
					oList.add(vo);
				}
			}
		}
		request.setAttribute("oList", oList);
		//===================================== 쿠키
		
		return "../main/main.jsp";
	}
	
	//======================================
	@RequestMapping("news/detail_before.do")
	public String news_detail_before(HttpServletRequest request, 
			HttpServletResponse response)
	{
		String news_no=request.getParameter("news_no");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		Cookie cookie=new Cookie(id+"_cookie"+news_no, news_no);
		cookie.setMaxAge(60*60*24);
		cookie.setPath("/");
		response.addCookie(cookie);
		return "redirect:../news/detail.do?news_no="+news_no;
	}
	//======================================
	
	
	
	@RequestMapping("news/list.do")
	public String list(HttpServletRequest request) {
		
		String page = request.getParameter("page");
		if (page == null)
			page = "1";

		int curpage = Integer.parseInt(page);
		int rowSize = 3;
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
		
	
		return "../news/list.jsp";
	}
	
	 

	@RequestMapping("news/detail.do")
		public String news_detail(HttpServletRequest request) {
			String no=request.getParameter("news_no");
			
			
			int news_no=Integer.parseInt(no);
			NewsDAO.hitIncrement(news_no);
			
			NewsVO vo=NewsDAO.newsDetailData(news_no);
			List<ReplyVO> list=NewsDAO.newsReplyListData(news_no);
			request.setAttribute("vo", vo);
			request.setAttribute("nList", list);
			
			//================찜====================
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
			if(id!=null) {
				WishVO jvo=new WishVO();
				jvo.setId(id);
				jvo.setNews_no(news_no);
				int jcount=NewsDAO.newsWishCount(jvo);
				request.setAttribute("jcount", jcount);
			}
			//================찜====================
			
			
			request.setAttribute("main_jsp", "../news/detail.jsp");
			return "../main/main.jsp";
	}
	
	
	@RequestMapping("news/wish_insert.do")
	public String news_wish_insert(HttpServletRequest request) {
		String news_no=request.getParameter("news_no");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		WishVO vo=new WishVO();
		vo.setId(id);
		vo.setNews_no(Integer.parseInt(news_no));
		NewsDAO.newsWishInsert(vo);
		return "redirect:../news/detail.do?news_no="+news_no;
	}
	
	@RequestMapping("news/wish_delete.do")
	public String news_wish_delete(HttpServletRequest request) {
		String news_no=request.getParameter("news_no");
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		WishVO vo=new WishVO();
		vo.setId(id);
		vo.setNews_no(Integer.parseInt(news_no));
		NewsDAO.newsWishDelete(vo);
		return "redirect:../news/detail.do?news_no="+news_no;
	}
	
	
	
	@RequestMapping("news/like.do")
	public String news_like(HttpServletRequest request) {
		String no=request.getParameter("news_no");
		int news_no=Integer.parseInt(no);
		
		NewsVO vo=NewsDAO.newsDetailData(news_no);
		NewsDAO.like(news_no);
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "..news/detail.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("news/hate.do")
	public String news_hate(HttpServletRequest request) {
		String no=request.getParameter("news_no");
		int news_no=Integer.parseInt(no);
		
		NewsVO vo=NewsDAO.newsDetailData(news_no);
		NewsDAO.hate(news_no);
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../news/detail.jsp");
		return "../main/main.jsp";
	}
	

	@RequestMapping("news/reply_insert.do")
	public String news_reply_insert(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		String news_no=request.getParameter("news_no");
		String msg=request.getParameter("msg");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		ReplyVO nvo=new ReplyVO();
		
		nvo.setNews_no(Integer.parseInt(news_no));
		nvo.setId(id);
		nvo.setMsg(msg);
		nvo.setCategory(3);
		
		NewsDAO.newsReplyInsert(nvo);
		return "redirect:../news/detail.do?news_no="+news_no;
	}
	

	@RequestMapping("news/search.do")
    public String news_search(HttpServletRequest request)
    {
       String key=request.getParameter("key");
       String page = request.getParameter("page");
       if(page==null)
  			page="1";
       String sort=request.getParameter("sort");
       if(sort==null)
  			sort="1";
  		
  		System.out.println(sort);
  	
  		switch(sort){
       case "1": 
           sort="news_no";
           break;
       case "2":
       	sort="like_cnt DESC";
           break;
  		}
       if (page == null)
          page = "1";
       
       int curpage = Integer.parseInt(page);
       
       int rowSize = 3;
       int start = (curpage * rowSize) - (rowSize - 1);
       int end = curpage * rowSize;

       Map map = new HashMap();
       map.put("key", key);
       map.put("start", start);
       map.put("end", end);
       map.put("sort",sort);
       
       List<NewsVO> list=NewsDAO.newsSearchData(map);
       int totalpage=NewsDAO.newsSearchTotalPage(map);
       
       int BLOCK = 5;
       int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
       int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;

       if(endPage>totalpage)
          endPage = totalpage;


       request.setAttribute("list", list);
       request.setAttribute("curpage", curpage);
       request.setAttribute("totalpage", totalpage);
       request.setAttribute("BLOCK", BLOCK);
       request.setAttribute("startPage", startPage);
       request.setAttribute("endPage", endPage);
       
       return "../news/list.jsp";
    }
   
	
	
}