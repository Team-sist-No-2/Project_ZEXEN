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
	public String computer_main(HttpServletRequest request) {
		// 두개의 데이터를 받는다 (페이지,카테고리번호)
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		String cate_no = request.getParameter("cate_no");
		// Map
		// 현재 페이지
		int curpage = Integer.parseInt(page);
		int rowSize = 50;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;

		// Map에 저장
		Map map = new HashMap();
		map.put("cate_no", 1);
		map.put("start", start);
		map.put("end", end); 
		// 데이터베이스 연결
		List<ComputerVO> list = ComputerDAO.computerListData(map);
		// 총페이지
		//int totalpage = ComputerDAO.computerTotalPage(Integer.parseInt(cate_no));

		// JSP에서 필요한 데이터를 보내기 시작
		// request에 값을 채운다
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		//request.setAttribute("totalpage", totalpage);
		// include 파일 지정
		request.setAttribute("main_jsp", "../computer/main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("computer/total.do")
	public String computer_total(HttpServletRequest request) {
		// 데이터 읽어서 => jsp 전송(데이터베이스)
		// 페이지
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		Map map = new HashMap();
		int rowSize = 12;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;
		map.put("start", start);
		map.put("end", end);
		List<ComputerVO> list = ComputerDAO.computerTotalData(map);
		int totalpage = ComputerDAO.computerTotalPage2();

		int BLOCK = 5;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;

		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;

		if (endPage > totalpage)
			endPage = totalpage;

		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("main_jsp", "../computer/total.jsp");
		
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
					String no=cookies[i].getValue();
					ComputerVO vo=ComputerDAO.computerDetailData(Integer.parseInt(no));
					cList.add(vo);
				}
			}
		}
		request.setAttribute("cList", cList);
		return "../main/main.jsp";
	}
}
