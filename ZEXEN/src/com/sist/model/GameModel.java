package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;
import com.sist.controller.RequestMapping;
import com.sist.dao.BoardDAO;
import com.sist.dao.GameDAO;
import com.sist.vo.GameVO;
import com.sist.vo.ReplyVO;

public class GameModel {

	
	@RequestMapping("game/main.do")
	public String game_main(HttpServletRequest request)
	{	
		List<Integer> cate_cnt_list=new ArrayList<Integer>();
		for(int i=1;i<=11;i++)
		{
			cate_cnt_list.add(GameDAO.gameCategoryCount(i));
		}
		request.setAttribute("cate_cnt", cate_cnt_list);
		
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		if(id!=null)
		{
		// 쿠키 읽기
		Cookie[] cookies=request.getCookies();
		System.out.println("저장된 쿠키 개수:"+cookies.length);
		
		List<GameVO> cList=new ArrayList<GameVO>();
		
		
			if(id!=null)
			{
				for(int i=cookies.length-1;i>=0;i--)
				{
					if(cookies[i].getName().startsWith(id))
					{
						String no=cookies[i].getValue();
						GameVO vo=GameDAO.gameDetailData(Integer.parseInt(no));
						cList.add(vo);
					}
				}
			}
			request.setAttribute("cList", cList);
		}
		
		request.setAttribute("main_jsp", "../game/main.jsp"); 	//main.jsp에서 include의 경로
		return "../main/main.jsp";
	}
	
	@RequestMapping("game/list.do")
	public String game_list(HttpServletRequest request)
	{
		String page=request.getParameter("page");
   		String category=request.getParameter("cate");
   		String sort=request.getParameter("sort");
	   		if(page==null)
	   			page="1";
	   		if(category==null)
	   			category="1";
	   		if(sort==null)
	   			sort="1";
	   		
	   		System.out.println(sort);
	   	
	   		switch(sort){
	        case "1": 
	            sort="game_no";
	            break;
	        case "2":
	        	sort="like_cnt DESC";
	            break;
	        case "3" :
	        	sort="price desc";
	            break;
	        case "4" :
	        	sort="price";
	            break;
	    }
	   	
	   		
		
		int curpage=Integer.parseInt(page);
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashMap();
		map.put("category", category);
		map.put("start", start);
		map.put("end", end);
		map.put("sort",sort);
		
		
		//리스트
		List<GameVO> list=GameDAO.gameListData(map);
		int totalpage=GameDAO.gameTotalPage(Integer.parseInt(category)); 
		
		int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;   //  1, 11, 21
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; // 10, 20, 30
		
		if(endPage>totalpage)   // ex) totalpage=34 page 라면 endPage=34
		   endPage=totalpage;
		
		
		// ===========jsp에 필요한 데이터를 보내기 시작=========== 
    	request.setAttribute("list", list);
    	request.setAttribute("curpage", curpage);		//현재 페이지 -> 1
   		request.setAttribute("totalpage", totalpage);	//카테고리에 대한 토탈 페이지
   		request.setAttribute("BLOCK", BLOCK);			//블럭은 10
   		request.setAttribute("startPage", startPage);	//현재페이지 대한 스타트 페이지
   		request.setAttribute("endPage", endPage);		//현재페이지 대한 엔드 페이지

		
		return "../game/list.jsp";
}
    @RequestMapping("game/detail_before.do")
    public String game_detail_before(HttpServletRequest request,HttpServletResponse response)
    {
    	String game_no=request.getParameter("game_no");
    	HttpSession session=request.getSession();
    	String id=(String)session.getAttribute("id");
    	Cookie cookie=new Cookie(id+game_no, game_no);
    	System.out.println("detail_before 실행하여 얻은 쿠키:"+cookie.getName()+"게임번호:"+cookie.getValue());
    	response.addCookie(cookie);
    	
    	return "redirect:../game/detail.do?game_no="+game_no;
    }
    
    @RequestMapping("game/detail.do")
    public String game_detail(HttpServletRequest request)
    {
    	String no=request.getParameter("game_no");
    	int game_no=Integer.parseInt(no);
    	
    	GameVO vo=GameDAO.gameDetailData(game_no);
    	request.setAttribute("vo", vo);
    	
    	List<ReplyVO> list=GameDAO.gameReplyListData(game_no);
    	
    	
    	
   	    request.setAttribute("rList", list);
    	
    	request.setAttribute("main_jsp", "../game/detail.jsp"); 	//main.jsp에서 include의 경로
		return "../main/main.jsp";
    }
    
    
    
    @RequestMapping("game/like.do")
    public String game_LikeUp(HttpServletRequest request)
    {
    	System.out.println("game/like.do DAO 정상실행");
    	String no=request.getParameter("game_no");
    	int game_no=Integer.parseInt(no);

    	System.out.println("like.do실행완료하였습니다");
    	
    	GameVO vo=GameDAO.gameDetailData(game_no);
    	GameDAO.gameLikeUp(game_no);
    	
    	request.setAttribute("vo", vo);
    	request.setAttribute("main_jsp", "../game/detail.jsp"); 	//main.jsp에서 include의 경로
		
		return "../main/main.jsp";
    }
    
    @RequestMapping("game/hate.do")
    public String game_HateUp(HttpServletRequest request)
    {
    	System.out.println("game/hate.do DAO 정상실행");
    	String no=request.getParameter("game_no");
    	int game_no=Integer.parseInt(no);

    	System.out.println("hate.do실행완료하였습니다");
    	
    	GameVO vo=GameDAO.gameDetailData(game_no);
    	GameDAO.gameHateUp(game_no);
    	
    	request.setAttribute("vo", vo);
    	request.setAttribute("main_jsp", "../game/detail.jsp"); 	//main.jsp에서 include의 경로
		
		return "../main/main.jsp";
    }
    
    @RequestMapping("game/reply_insert.do")
    public String game_reply_insert(HttpServletRequest request)
    {
 	   try
 	   {
 		   request.setCharacterEncoding("UTF-8");
 		   
 	   }catch(Exception ex) {}
 	   
 	   
 	   String game_no=request.getParameter("game_no");
 	   String msg=request.getParameter("msg");
 	   System.out.println("reply_insert실행");
 	  
 	   HttpSession session=request.getSession();
 	   String id=(String)session.getAttribute("id");
 	   
 	   System.out.println("reply_insert에서 받아온 id:"+id);
 	   // VO에 담아서 => DAO
 	   ReplyVO rvo=new ReplyVO();
 	   
 	   
 	   rvo.setGame_no(Integer.parseInt(game_no));
 	   rvo.setId(id);
 	   rvo.setMsg(msg);
 	   rvo.setCategory(1);
 	   // DAO연결 
 	   GameDAO.gameReplyInsert(rvo);
 	   return "redirect:../game/detail.do?game_no="+game_no;
    }
}
