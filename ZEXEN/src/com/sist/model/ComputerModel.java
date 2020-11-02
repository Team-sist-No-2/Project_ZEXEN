package com.sist.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.ComputerDAO;
import com.sist.vo.ComputerVO;

public class ComputerModel {
	@RequestMapping("computer/main.do")
	public String computer_main(HttpServletRequest request)
	{
		List<Integer> cate_cnt_list=new ArrayList<Integer>();
		for(int i=1;i<=11;i++)
		{
			cate_cnt_list.add(ComputerDAO.computerCategoryCount(i));
		}
		request.setAttribute("cate_cnt", cate_cnt_list);
		
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		if(id!=null)
		{
			Cookie[] cookies=request.getCookies();
			System.out.println("���옣�맂 荑좏궎 媛쒖닔:"+cookies.length);
		
			List<ComputerVO> cList=new ArrayList<ComputerVO>();
		
			if(id!=null)
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
			}
			request.setAttribute("cList", cList);
		}
		
		request.setAttribute("main_jsp", "../computer/main.jsp"); 	//main.jsp�뿉�꽌 include�쓽 寃쎈줈
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
		map.put("cateno", cateno);
		map.put("start", start);
		map.put("end", end);
		
		List<ComputerVO> list = ComputerDAO.computerListData(map);
			
		request.setAttribute("list", list);
			
		return "../computer/list.jsp";
	}
}
