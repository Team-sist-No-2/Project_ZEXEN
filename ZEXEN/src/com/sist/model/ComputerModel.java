package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;
import com.sist.dao.ComputerDAO;
import com.sist.vo.ComputerVO;

public class ComputerModel {
	@RequestMapping("computer/main.do")
	public String computer_list(HttpServletRequest request)
	   {
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   String cateno=request.getParameter("cate_no");

		   int curpage=Integer.parseInt(page);
		   int rowSize=12;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   
		   Map map=new HashMap();
		   map.put("cate_no", 1);
		   map.put("start", start);
		   map.put("end", end);

		   List<ComputerVO> list=ComputerDAO.computerListData(map);
		   //int totalpage=ComputerDAO.computerTotalPage(Integer.parseInt(cateno));
		   
		   request.setAttribute("list", list);
		   request.setAttribute("curpage", curpage);
		   //request.setAttribute("totalpage", totalpage);
		   request.setAttribute("main_jsp", "../computer/main.jsp");
		   return "../main/main.jsp";
	   }
}
