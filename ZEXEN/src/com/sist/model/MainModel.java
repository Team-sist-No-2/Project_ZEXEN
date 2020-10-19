package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import com.sist.controller.RequestMapping;

public class MainModel {
	
	   @RequestMapping("main/main.do")
	   public String main_page(HttpServletRequest request)
	   {
		   request.setAttribute("main_jsp", "../main/home.jsp"); 	//main.jsp에서 include의 경로
	      return "../main/main.jsp";
	   }
	   
	   @RequestMapping("main/test.do")
	   public String test_page(HttpServletRequest request)
	   {
		   request.setAttribute("msg", "request전송"); 	//main.jsp에서 include의 경로
	      //return "../main/test.jsp";
		   return "redirect:../main/test.jsp";
	   }
	}
	

