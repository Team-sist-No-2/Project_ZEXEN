package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.RequestWrapper;

import com.sist.controller.RequestMapping;

public class GameModel {
	@RequestMapping("game/main.do")
	public String movie_real(HttpServletRequest request)
	{
		request.setAttribute("main_jsp", "../game/main.jsp"); 	//main.jsp에서 include의 경로
		return "../main/main.jsp";
	}
	
	//@RequestMapping("game/")
}
