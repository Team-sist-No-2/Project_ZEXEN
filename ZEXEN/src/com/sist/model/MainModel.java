package com.sist.model;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.GameDAO;
import com.sist.dao.MainDAO;
import com.sist.dao.MemberDAO;
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
		  
		  request.setAttribute("main_jsp", "../main/home.jsp"); 	//main.jsp에서 include의 경로
	      return "../main/main.jsp";
	   }
	}
	

