package com.sist.model;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.ComputerDAO;
import com.sist.dao.GameDAO;
import com.sist.dao.MainDAO;
import com.sist.dao.MemberDAO;
import com.sist.vo.ComputerVO;
import com.sist.vo.MainVO;
import com.sist.vo.WishVO;

public class MainModel {
	
	   @RequestMapping("main/main.do")
	   public String main_page(HttpServletRequest request)
	   {
		   
		  List<MainVO> list = MainDAO.gameBanner();
		  System.out.println(list.size());
		  Collections.shuffle(list);
		  request.setAttribute("glist", list);
		  
		  Map map = new HashMap();
		  map.put("cate_no", 1);
		  map.put("start", 1);
		  map.put("end", 10);
		  
		  List<ComputerVO> clist = ComputerDAO.computerListData(map);
		  System.out.println(clist.size());
		  Collections.shuffle(clist);
		  request.setAttribute("clist", clist);
		  
		  request.setAttribute("main_jsp", "../main/home.jsp"); 	//main.jsp�뿉�꽌 include�쓽 寃쎈줈
		  request.setAttribute("main_jsp", "../main/home.jsp"); 	//main.jsp에서 include의 경로
	      return "../main/main.jsp";
	   }
	   
	}
	

