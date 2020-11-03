package com.sist.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.ComputerDAO;
import com.sist.vo.ComputerVO;



public class ComputerModel {
	@RequestMapping("computer/main.do")
	public String computer_main(HttpServletRequest request)
	{
		List<Integer> cate_cnt_list=new ArrayList<Integer>();
		for(int i=1;i<=5;i++)
		{
			cate_cnt_list.add(ComputerDAO.computerCategoryCount(i));
		}
		request.setAttribute("cate_cnt", cate_cnt_list);
		request.setAttribute("main_jsp","../computer/main.jsp"); 
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		// 쿠키 읽기
		Cookie[] cookies=request.getCookies();
		List<ComputerVO> cList=new ArrayList<ComputerVO>();
		if(cookies!=null)
		{
			for(int i=cookies.length-1;i>=0;i--)
			{
				if(cookies[i].getName().startsWith(id))
				{
					cookies[i].setPath("/");
					String no=cookies[i].getValue();
					ComputerVO vo=ComputerDAO.computerDetailData(Integer.parseInt(no));
					cList.add(vo);
				}
			}
		}
		request.setAttribute("cList", cList);
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
		map.put("cate_no", cateno);
		map.put("start", start);
		map.put("end", end);
		
		List<ComputerVO> list = ComputerDAO.computerListData(map);
			
		request.setAttribute("list", list);
			
		return "../computer/list.jsp";
	}
	
	@RequestMapping("computer/detail_before.do")
	public String computer_detail_before(HttpServletRequest request,
			HttpServletResponse response) {
		// ../movie/detail_before.do?no=${vo.no }
		String com_no = request.getParameter("com_no");
		// no=1&aaa=1
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		//   shim123
		Cookie cookie=new Cookie(id+"_cookie"+com_no, com_no);
		// 기간 
		cookie.setMaxAge(60*60*24);
		cookie.setPath("/");
		//전송
		response.addCookie(cookie);
		
		//cookie=new Cookie(id+no, no);
		return "redirect:../computer/detail.do?com_no=" + com_no;// 재요청 
	}
	
	@RequestMapping("computer/detail.do")
	public String computer_detail(HttpServletRequest request) {
		
		String no=request.getParameter("com_no");
		if(no == null) no = "1";
		// DB연동
		ComputerVO vo=ComputerDAO.computerDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../computer/detail.jsp");
		
		return "../main/main.jsp";
	}
}
