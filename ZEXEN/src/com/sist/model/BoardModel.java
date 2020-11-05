package com.sist.model;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

import com.sist.controller.RequestMapping;
import com.sist.dao.BoardDAO;
import com.sist.dao.GameDAO;
import com.sist.vo.BoardVO;
import com.sist.vo.ReplyVO;

//게시판 메인(리스트)
public class BoardModel {
	@RequestMapping("board/main.do")
	public String board_main(HttpServletRequest request) {
		
		request.setAttribute("main_jsp", "../board/main.jsp");
		return "../main/main.jsp";// 어떤 JSP로 request를 보낼것인지 
	}

	
	@RequestMapping("board/list.do")
	public String board_list(HttpServletRequest request) {
		System.out.println("토탈보드리스트 출력");
		String page=request.getParameter("page"); // 사용자가 요청한 페이지를 받는다 
		if(page==null) // 게시판을 실행할때 => 첫페이지 
			page="1"; //default 
		
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1); // rownum은 시작이 1부터 
		int end=rowSize*curpage;

		map.put("start", start);
		map.put("end", end);
		
		List<BoardVO> list=BoardDAO.boardListData(map);
		System.out.println("게시판 가져온 게시물 개수"+list.size());
		System.out.println("boardTotalPage 호출");
		
		//댓글 총갯수 카운트
		for(BoardVO vo:list)
		   {
			   int rc=BoardDAO.replyCount(vo.getBoard_no());
			   vo.setReplyCount(rc);
		   }
		
		//총페이지 읽기
		int totalpage=BoardDAO.boardTotalPage();
		System.out.println("boardTotalPage 종료");
		
		int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;   //  1, 11, 21
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; // 10, 20, 30
		
		if(endPage>totalpage)   // ex) totalpage=34 page 라면 endPage=34
		   endPage=totalpage;
		//JSP로 전송해야될 데이터는 3개 (현재페이지,총페이지 , list목록)
		//board/main.jsp => List전송
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("BLOCK", BLOCK);			//블럭은 10
   		request.setAttribute("startPage", startPage);	//현재페이지 대한 스타트 페이지
   		request.setAttribute("endPage", endPage);		//현재페이지 대한 엔드 페이지
   		
   	   Date date=new Date();
 	   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
 	   String today=sdf.format(date);
 	   
 	   request.setAttribute("today", today);
		//include
   		
		return "../board/list.jsp";// 어떤 JSP로 request를 보낼것인지 
	}
	
	@RequestMapping("board/catelist.do")
	public String board_Cate_list(HttpServletRequest request) {
		System.out.println("보드리스트 출력");
		String page=request.getParameter("page"); // 사용자가 요청한 페이지를 받는다 
		if(page==null) // 게시판을 실행할때 => 첫페이지 
			page="1"; //default 
		String board_cate_no=request.getParameter("cate_no"); // 사용자가 요청한 페이지를 받는다 
		if(board_cate_no==null) // 게시판을 실행할때 => 첫페이지 
			board_cate_no="1"; //default 
		
		System.out.println("선택한 카테고리번호는: "+board_cate_no);
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=10;
		int start=(rowSize*curpage)-(rowSize-1); // rownum은 시작이 1부터 
		int end=rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		map.put("board_cate_no",board_cate_no);
		
		System.out.println("카테맵출력: "+map.get("board_cate_no"));
		
		List<BoardVO> list=BoardDAO.boardCateListData(map);
		
		System.out.println("게시판 가져온 개시물 개수"+list.size());
		System.out.println("boardTotalPage 호출");
		
		//댓글 총갯수 카운트
		for(BoardVO vo:list)
		   {
			   int rc=BoardDAO.replyCount(vo.getBoard_no());
			   vo.setReplyCount(rc);
		   }
		
		//총페이지 읽기
		int totalpage=BoardDAO.boardCateTotalPage(Integer.parseInt(board_cate_no));
		System.out.println("boardTotalPage 종료");
		
		int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;   //  1, 11, 21
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK; // 10, 20, 30
		
		if(endPage>totalpage)   // ex) totalpage=34 page 라면 endPage=34
		   endPage=totalpage;
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("BLOCK", BLOCK);			//블럭은 10
   		request.setAttribute("startPage", startPage);	//현재페이지 대한 스타트 페이지
   		request.setAttribute("endPage", endPage);		//현재페이지 대한 엔드 페이지
   		
    	   Date date=new Date();
     	   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
     	   String today=sdf.format(date);
     	   
     	   request.setAttribute("today", today);
     	   
		//include
		return "../board/list.jsp";// 어떤 JSP로 request를 보낼것인지 
	}
	
//
	@RequestMapping("board/count.do")
	public String boardCount(HttpServletRequest request) {
		String cate=request.getParameter("cate");
		if(cate==null) {
			cate="0";
		}
			
		if(cate.equals("0")){
			int count=BoardDAO.boardCount();
			request.setAttribute("count", count);
		}
		else{
			System.out.println("else");
			int count=BoardDAO.boardCountCate(Integer.parseInt(cate));
			request.setAttribute("count", count);
		}
		
		
		return "../board/count.jsp";
	}
	
	

//글쓰기
@RequestMapping("board/insert.do")
public String board_insert(HttpServletRequest request) {

	System.out.println("board-insert 호출");
	request.setAttribute("main_jsp", "../board/insert.jsp");
	return "../main/main.jsp";// 어떤 JSP로 request를 보낼것인지 
	}

//게시글 작성 완료
@RequestMapping("board/insert_ok.do")
public String board_insert_ok(HttpServletRequest request) {
	System.out.println("insert_ok 호출");
	try {
		request.setCharacterEncoding("UTF-8");
	} catch (UnsupportedEncodingException e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	
	String member_id=request.getParameter("member_id");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String board_cate_no=request.getParameter("selectcno");

	BoardVO vo=new BoardVO();
	vo.setMember_id(member_id);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setBoard_cate_no(Integer.parseInt(board_cate_no));
	
	BoardDAO.boardInsert(vo);
	System.out.println("insert_ok vo 호출");
	return "redirect:../board/main.do";
}

//상세게시글
@RequestMapping("board/detail.do")
public String board_detail(HttpServletRequest request) {
	System.out.println("board-detail 호출");
	String board_no=request.getParameter("board_no"); // 사용자가 요청한 페이지를 받는다 
	//DB 연동
	BoardVO vo =BoardDAO.boardDetailData(Integer.parseInt(board_no));
	//데이터 전송
	request.setAttribute("vo", vo);
	//화면
	request.setAttribute("main_jsp", "../board/detail.jsp");
	
	List<ReplyVO> list=BoardDAO.replyListData(Integer.parseInt(board_no));
	request.setAttribute("rList", list);
	
	//댓글 총갯수 카운트
	for(ReplyVO rvo:list)
	   {
		   int rc=BoardDAO.replyCount(vo.getBoard_no());
		   vo.setReplyCount(rc);
	   }
	return "../main/main.jsp";// 어떤 JSP로 request를 보낼것인지 
	}

// 게시물에 댓글 
@RequestMapping("board/reply_insert.do")
public String reply_insert(HttpServletRequest request)
{
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
		   
	   }catch(Exception ex) {}
	   String board_no=request.getParameter("board_no");
	   String msg=request.getParameter("msg");
	   System.out.println("reply_insert 실행");
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   
	   System.out.println("reply_insert에서 받아온 id:"+id);
	   
	   // VO에 담아서 => DAO
	   ReplyVO rvo=new ReplyVO();
	   rvo.setBoard_no(Integer.parseInt(board_no));
	   rvo.setId(id);
	   rvo.setMsg(msg);
	   rvo.setCategory(4);
	   // DAO연결 
	   BoardDAO.replyInsert(rvo);
	    System.out.println("dao저장"+msg);
	   return "redirect:../board/detail.do?board_no="+board_no;
}



} 




