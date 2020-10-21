package com.sist.model;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.RequestWrapper;
import com.sist.controller.RequestMapping;
import com.sist.dao.GameDAO;
import com.sist.vo.GameVO;

public class GameModel {

	
	@RequestMapping("game/main.do")
	public String game_list(HttpServletRequest request)
	{
		//===========데이터 베이스에서 자료 가져오기===========
  		//받을 데이터 2개 : 페이지, 카테고리 번호
		String page=request.getParameter("page");
		String cateno=request.getParameter("cate");
		if(page==null)
			page="1";
		
		int curpage=Integer.parseInt(page);
		int rowSize=12;
		int start=(rowSize*curpage)-(rowSize-1);
		int end=rowSize*curpage;
		
		Map map=new HashMap();
		map.put("category", 1);
		map.put("start", start);
		map.put("end", end);
		
		
		//리스트
		List<GameVO> list=GameDAO.gameListData(map);
		
		//총페이지
		//int totalpage=GameDAO.movieTotalPage(Integer.parseInt(cateno));
		
		
		// ===========jsp에 필요한 데이터를 보내기 시작=========== 
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		//request.setAttribute("totalpage", totalpage);
		
		
		request.setAttribute("main_jsp", "../game/main.jsp"); 	//main.jsp에서 include의 경로
		System.out.println("game/main.do 실행");
		return "../main/main.jsp";
	}
}
