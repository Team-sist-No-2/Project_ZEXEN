package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.GameDAO;
import com.sist.dao.MemberDAO;
import com.sist.vo.WishVO;

public class MainModel {
	
	   @RequestMapping("main/main.do")
	   public String main_page(HttpServletRequest request)
	   {
		  request.setAttribute("main_jsp", "../main/home.jsp"); 	//main.jsp에서 include의 경로
		   
	      return "../main/main.jsp";
	   }
	}
	

