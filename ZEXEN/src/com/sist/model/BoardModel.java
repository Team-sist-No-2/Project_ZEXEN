package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;
import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;

//게시판 메인(리스트)
public class BoardModel {
	@RequestMapping("board/main.do")
	public String board_main(HttpServletRequest request) {
		// TODO Auto-generated method stub
		System.out.println("board 호출");
		// 게시물 목록을 가지고 온다 => request에 값을 담아서 JSP로 전송
		String page=request.getParameter("page"); // 사용자가 요청한 페이지를 받는다 
		if(page==null) // 게시판을 실행할때 => 첫페이지 
			page="1"; //default 
		int curpage=Integer.parseInt(page);
		// 현재 페이지 ==> list목록을 가지고 온다
		Map map=new HashMap();
		// WHERE num BETWEEN #{start} AND #{end}
		// start(시작위치,끝위치) => MyBatis에서 처리  
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1); // rownum은 시작이 1부터 
		int end=rowSize*curpage;
		/*
		 *   1page ==> 1 AND 10
		 *   2page ==> 11 AND 20
		 */
		map.put("start", start);
		map.put("end", end);
		
		List<BoardVO> list=BoardDAO.boardListData(map);
		//전체게시글 추가 int 매퍼추가
		System.out.println(list.size());
		
		System.out.println("boardTotalPage 호출");
		int totalpage=BoardDAO.boardTotalPage();
		System.out.println("boardTotalPage 종료");
		/*
		 *   JSP로 전송해야될 데이터는 3개 (현재페이지,총페이지 , list목록)
		 */
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		// 여기서 전송된 것이 아니라 ==> Controller에서 request를 받아서 전송 
		/*
		 *    사용자 요청   ====> Controller  ===> Model ===== BoardDAO 
		 *    Model ==== Controller ===> JSP
		 */
		request.setAttribute("main_jsp", "../board/main.jsp");
		System.out.println("main 전송");
		return "../main/main.jsp";// 어떤 JSP로 request를 보낼것인지 
	}

@RequestMapping("board/detail.do")
public String board_detail(HttpServletRequest request) {
	System.out.println("board-detail 호출");
	String board_no=request.getParameter("board_no"); // 사용자가 요청한 페이지를 받는다 
	
	BoardVO vo =BoardDAO.boardDetailData(Integer.parseInt(board_no));
	
	request.setAttribute("vo", vo);
	request.setAttribute("main_jsp", "../board/detail.jsp");
	return "../main/main.jsp";// 어떤 JSP로 request를 보낼것인지 
	}
}
/*
//게시판 상세보기 
public class board_detail implements Model{

	@RequestMapping("board/main.do")
	public String handlerRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		// detail.do?no=1
		// request.setParameter("no",1); ==>  ==> request.getParameter("no") ==> 1
		// 사용자가 보낸 값을 request에 묶어서 넘겨주는 역할 (톰캣)
		// service(HttpServletRequest request) => request가 매개변수 ==> 화면이 변경될때마다 request가 초기화
		// 1. 사용자 보내준 게시물번호를 받는다 
		String no=request.getParameter("no");
		// 2. BoardDAO를 통해서 게시물 한개를 읽어 온다 (BoardVO) ==> SQL문장 실행 => board-mapper.xml
		BoardVO vo=BoardDAO.boardDetailData(Integer.parseInt(no));
		// 3. 읽어온 BoardVO값을 jsp로 전송 
		
		request.setAttribute("vo", vo);
		return "board/detail.jsp";
	}

}
*/


