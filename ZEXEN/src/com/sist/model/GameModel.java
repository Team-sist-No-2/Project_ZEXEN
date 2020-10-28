package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.RequestWrapper;
import com.sist.controller.RequestMapping;
import com.sist.dao.GameDAO;
import com.sist.vo.GameVO;

public class GameModel {

	
	@RequestMapping("game/main.do")
	public String game_main(HttpServletRequest request)
	{	
//		String page=request.getParameter("page");
//		if(page==null)
//			page="1";
//		
//		int curpage=Integer.parseInt(page);
//		int rowSize=8;
//		int start=(rowSize*curpage)-(rowSize-1);
//		int end=rowSize*curpage;
//		
//		Map map=new HashMap();
//		map.put("start", start);
//		map.put("end", end);
//		
//		List<GameVO> list=GameDAO.gameTotalData(map);
//		int totalpage=GameDAO.gameTotalPage2();		 // SELECT CEIL(COUNT(*)/8.0) FROM game_tb
//		
//		int BLOCK=10;
//        int startPage=((curpage-1)/BLOCK*BLOCK)+1;   //  1, 11, 21
//        int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; // 10, 20, 30
//
//		
//		if(endPage>totalpage)   // ex) totalpage=34 page 라면 endPage=34
//			endPage=totalpage;
//		
//		
//		request.setAttribute("list", list);					//
//		request.setAttribute("curpage", curpage);			//
//		request.setAttribute("totalpage", totalpage);		//
//		request.setAttribute("BLOCK", BLOCK);				//
//		request.setAttribute("startPage", startPage);		//
//		request.setAttribute("endPage", endPage);			//
		
		
		List<Integer> cate_cnt_list=new ArrayList<Integer>();
		
		for(int i=1;i<=11;i++)
		{
			cate_cnt_list.add(GameDAO.gameCategoryCount(i));
		}
		
		request.setAttribute("cate_cnt", cate_cnt_list);
		
		request.setAttribute("main_jsp", "../game/main.jsp"); 	//main.jsp에서 include의 경로
		
		return "../main/main.jsp";
	}
	
    @RequestMapping("game/list.do")
	public String game_list(HttpServletRequest request)
	{
		//===========데이터 베이스에서 자료 가져오기===========
  		//받을 데이터 2개 : 페이지, 카테고리 번호
		String page=request.getParameter("page");
		String category=request.getParameter("cate");
		if(page==null)
			page="1";
		
		int curpage=Integer.parseInt(page);
		int rowSize=8;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashMap();
		map.put("category", category);
		map.put("start", start);
		map.put("end", end);
		
		
		//리스트
		List<GameVO> list=GameDAO.gameListData(map);
//		int totalpage=GameDAO.gameTotalPage(Integer.parseInt(category)); //SELECT CEIL(COUNT(*)/8.0) FROM game_tb (카테고리에 관한)
//		
//		int BLOCK=10;
//        int startPage=((curpage-1)/BLOCK*BLOCK)+1;   //  1, 11, 21
//        int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; // 10, 20, 30
//        
//    	if(endPage>totalpage)   // ex) totalpage=34 page 라면 endPage=34
//			endPage=totalpage;
		
		
		// ===========jsp에 필요한 데이터를 보내기 시작=========== 
    	request.setAttribute("list", list);
//		request.setAttribute("curpage", curpage);
//		request.setAttribute("totalpage", totalpage);
//		request.setAttribute("BLOCK", BLOCK);
//		request.setAttribute("startPage", startPage);
//		request.setAttribute("endPage", endPage);
		
		return "../game/list.jsp";
	}
    
    @RequestMapping("game/page.do")
   	public String game_page(HttpServletRequest request)
   	{
   		//===========데이터 베이스에서 자료 가져오기===========
     		//받을 데이터 2개 : 페이지, 카테고리 번호
   		String page=request.getParameter("page");
   		String category=request.getParameter("cate");
   		if(page==null)
   			page="1";
   		if(category==null)
   			category="1";
   		
   		int curpage=Integer.parseInt(page);
//   		int rowSize=8;
//   		int start=(rowSize*curpage)-(rowSize-1);
//   		int end=rowSize*curpage;
   		
   		Map map=new HashMap();
   		map.put("category", category);
//   		map.put("start", start);
//   		map.put("end", end);
   		
   		
   		//리스트
//   		List<GameVO> list=GameDAO.gameListData(map);
   		int totalpage=GameDAO.gameTotalPage(Integer.parseInt(category)); //SELECT CEIL(COUNT(*)/8.0) FROM game_tb (카테고리에 관한)
   		
   		int BLOCK=10;
           int startPage=((curpage-1)/BLOCK*BLOCK)+1;   //  1, 11, 21
           int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; // 10, 20, 30
           
       	if(endPage>totalpage)   // ex) totalpage=34 page 라면 endPage=34
   			endPage=totalpage;
   		
   		
   		// ===========jsp에 필요한 데이터를 보내기 시작=========== 
//       	request.setAttribute("list", list);
   		request.setAttribute("curpage", curpage);		//현재 페이지 -> 1
   		request.setAttribute("totalpage", totalpage);	//카테고리에 대한 토탈 페이지
   		request.setAttribute("BLOCK", BLOCK);			//블럭은 10
   		request.setAttribute("startPage", startPage);	//현재페이지 대한 스타트 페이지
   		request.setAttribute("endPage", endPage);		//현재페이지 대한 엔드 페이지
   		
   		return "../game/page.jsp";
   	}

    @RequestMapping("game/detail.do")
    public String game_detail(HttpServletRequest request)
    {
    	String no=request.getParameter("game_no");
    	int game_no=Integer.parseInt(no);
    	
    	GameVO vo=GameDAO.gameDetailData(game_no);
    	
    	System.out.println("GameDAO.gameDetailData(game_no); 실행완료"+game_no+"번 게시물");
    	
    	request.setAttribute("vo", vo);
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
    
    @RequestMapping("game/replyIn.do")
    public String game_Reply_Insert(HttpServletRequest request)
    {
    	System.out.println("game/replyIn.do DAO 정상실행");
    	String no=request.getParameter("game_no");
    	String comm=request.getParameter("textarea");
    	int game_no=Integer.parseInt(no);

    	System.out.println("리플 받아온 게임번호:"+game_no+"리플 받아온 내용:"+comm);
    	
//    	GameVO vo=GameDAO.gameDetailData(game_no);
//    	GameDAO.gameHateUp(game_no);
    	
//    	request.setAttribute("vo", vo);
    	request.setAttribute("main_jsp", "../game/detail.jsp"); 	//main.jsp에서 include의 경로
		
		return "../main/main.jsp";
    }
}
