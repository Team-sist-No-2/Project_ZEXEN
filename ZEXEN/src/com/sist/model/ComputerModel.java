package com.sist.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.ComputerDAO;
import com.sist.dao.GameDAO;
import com.sist.vo.BasketVO;
import com.sist.vo.ComputerVO;
import com.sist.vo.ReplyVO;
import com.sist.vo.WishVO;



public class ComputerModel {
	@RequestMapping("computer/main.do")
	public String computer_main(HttpServletRequest request)
	{
		List<Integer> cate_cnt_list=new ArrayList<Integer>();
		for(int i=1;i<=5;i++)
		{
			cate_cnt_list.add(ComputerDAO.computerCategoryCount(i));
		}
		request.setAttribute("cate_cnt", cate_cnt_list);
		request.setAttribute("main_jsp","../computer/main.jsp"); 
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		// 쿠키 읽기
		Cookie[] cookies=request.getCookies();
		List<ComputerVO> cList=new ArrayList<ComputerVO>();
		if(cookies!=null)
		{
			for(int i=cookies.length-1;i>=0;i--)
			{
				if(cookies[i].getName().startsWith(id+"_cookie"))
				{
					String no=cookies[i].getValue();
					ComputerVO vo=ComputerDAO.computerDetailData(Integer.parseInt(no));
					cList.add(vo);
				}
			}
			request.setAttribute("cList", cList);
		}
		request.setAttribute("main_jsp", "../computer/main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("computer/list.do")
	public String computer_list(HttpServletRequest request)
	{
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		String cateno = request.getParameter("cate_no");
		if (cateno == null)
			cateno = "1";
		
		int curpage = Integer.parseInt(page);
		int rowSize = 12;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;

		Map map = new HashMap();
		map.put("cate_no", cateno);
		map.put("start", start);
		map.put("end", end);
		
		List<ComputerVO> list=ComputerDAO.computerListData(map);
		int totalpage=ComputerDAO.computerTotalPage(Integer.parseInt(cateno)); 
		
		int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;  
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; 
		
		if(endPage>totalpage)  
		   endPage=totalpage;
		 
    	request.setAttribute("list", list);
    	request.setAttribute("curpage", curpage);	
   		request.setAttribute("totalpage", totalpage);	
   		request.setAttribute("BLOCK", BLOCK);			
   		request.setAttribute("startPage", startPage);	
   		request.setAttribute("endPage", endPage);		

		
		return "../computer/list.jsp";
	}
	
	@RequestMapping("computer/detail_before.do")
	public String computer_detail_before(HttpServletRequest request,
			HttpServletResponse response) {
		// ../movie/detail_before.do?no=${vo.no }
		String com_no = request.getParameter("com_no");
		// no=1&aaa=1
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		//   shim123
		Cookie cookie=new Cookie(id+"_cookie"+com_no, com_no);
		// 기간 
		cookie.setMaxAge(60*60*24);
		cookie.setPath("/");
		//전송
		response.addCookie(cookie);
		
		//cookie=new Cookie(id+no, no);
		return "redirect:../computer/detail.do?com_no=" + com_no;// 재요청 
	}
	
	@RequestMapping("computer/detail.do")
	public String computer_detail(HttpServletRequest request) {
		
		String no=request.getParameter("com_no");
		if(no==null) no="1";
		int com_no=Integer.parseInt(no);
		
		//상세화면
		ComputerVO vo=ComputerDAO.computerDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../computer/detail.jsp");
		
		//댓글리스트
    	List<ReplyVO> list=ComputerDAO.computerReplyListData(com_no);
   	    request.setAttribute("rList", list);
   	    
   	    HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		if(id!=null)
		{
		WishVO wvo=new WishVO();
		wvo.setId(id);
		wvo.setCom_no(com_no);
		int wcount=ComputerDAO.computerWishCount(wvo);
   	    request.setAttribute("wcount", wcount);
   	    
   	    BasketVO bvo=new BasketVO();
		bvo.setId(id);
		bvo.setCom_no(com_no);
		int bcount=ComputerDAO.computerBasketCount(bvo);
	    request.setAttribute("bcount", bcount);
		}
		
		return "../main/main.jsp";
	}
	
    @RequestMapping("computer/search.do")
    public String computer_search(HttpServletRequest request)
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
           sort="com_no";
           break;
       case "2" :
       	sort="cost desc";
           break;
       case "3" :
       	sort="cost asc";
           break;
  		}
       if (page == null)
          page = "1";
       
       int curpage = Integer.parseInt(page);
       
       int rowSize = 10;
       int start = (curpage * rowSize) - (rowSize - 1);
       int end = curpage * rowSize;

       Map map = new HashMap();
       map.put("key", key);
       map.put("start", start);
       map.put("end", end);
       map.put("sort",sort);
       
       List<ComputerVO> list=ComputerDAO.computerSearchData(map);
       int totalpage=ComputerDAO.computerSearchTotalPage(map);
       
       int BLOCK = 10;
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
       
       return "../computer/list.jsp";
    }
    
	@RequestMapping("computer/wish_insert.do")
	public String computer_wish_insert(HttpServletRequest request)
	{
		String com_no=request.getParameter("com_no");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		WishVO vo=new WishVO();
		vo.setId(id);
		vo.setCom_no(Integer.parseInt(com_no));
		
		ComputerDAO.computerWishInsert(vo);
		
		
		return "redirect:../computer/detail.do?com_no="+com_no;
	}

	@RequestMapping("computer/wish_delete.do")
	public String computer_wish_delete(HttpServletRequest request)
	{
		String com_no = request.getParameter("com_no");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		WishVO vo=new WishVO();
		vo.setId(id);
		vo.setCom_no(Integer.parseInt(com_no));
		
		ComputerDAO.computerWishDelete(vo);

		return "redirect:../computer/detail.do?com_no="+com_no;
	}
	
	@RequestMapping("computer/basket_insert.do")
	public String computer_basket_insert(HttpServletRequest request)
	{
		String com_no=request.getParameter("com_no");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		BasketVO vo=new BasketVO();
		vo.setId(id);
		vo.setCom_no(Integer.parseInt(com_no));
		
		ComputerDAO.computerBasketInsert(vo);
		
		
		return "redirect:../computer/detail.do?com_no="+com_no;
	}

	@RequestMapping("computer/basket_delete.do")
	public String computer_basket_delete(HttpServletRequest request)
	{
		String com_no = request.getParameter("com_no");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		BasketVO vo=new BasketVO();
		vo.setId(id);
		vo.setCom_no(Integer.parseInt(com_no));
		
		ComputerDAO.computerBasketDelete(vo);

		return "redirect:../computer/detail.do?com_no="+com_no;
	}
	
	@RequestMapping("computer/like.do")
	public String computer_like(HttpServletRequest request) {
		String no=request.getParameter("com_no");
		int com_no=Integer.parseInt(no);
		
		ComputerVO vo=ComputerDAO.computerDetailData(com_no);
		ComputerDAO.computerLikeUp(com_no);
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../computer/detail.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("computer/hate.do")
	public String computer_hate(HttpServletRequest request) {
		String no=request.getParameter("com_no");
		int com_no=Integer.parseInt(no);
		
		ComputerVO vo=ComputerDAO.computerDetailData(com_no);
		ComputerDAO.computerHateUp(com_no);
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../computer/detail.jsp");
		return "../main/main.jsp";
	}
	

	@RequestMapping("computer/reply_insert.do")
    public String computer_reply_insert(HttpServletRequest request)
    {
 	   try
 	   {
 		   request.setCharacterEncoding("UTF-8");
 		   
 	   }catch(Exception ex) {}
 	   
 	   
 	   String com_no=request.getParameter("com_no");
 	   String msg=request.getParameter("msg");
 	   System.out.println("reply_insert실행");
 	  
 	   HttpSession session=request.getSession();
 	   String id=(String)session.getAttribute("id");
 	   
 	   System.out.println("reply_insert에서 받아온 id:"+id);
 	   // VO에 담아서 => DAO
 	   ReplyVO rvo=new ReplyVO();
 	   
 	   
 	   rvo.setCom_no(Integer.parseInt(com_no));
 	   rvo.setId(id);
 	   rvo.setMsg(msg);
 	   rvo.setCategory(2);
 	   // DAO연결 
 	   ComputerDAO.computerReplyInsert(rvo);
 	   return "redirect:../computer/detail.do?com_no="+com_no;
    }
}
