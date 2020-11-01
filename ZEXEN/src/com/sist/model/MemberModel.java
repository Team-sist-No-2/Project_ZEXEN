package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;
import com.sist.controller.RequestMapping;
import com.sist.dao.GameDAO;
import com.sist.dao.MemberDAO;
import com.sist.vo.GameVO;
import com.sist.vo.MemberVO;

public class MemberModel {

	
	@RequestMapping("member/login.do")
	public String member_login(HttpServletRequest request)
	{	
		request.setAttribute("main_jsp", "../member/login.jsp"); 	//main.jsp에서 include의 경로
		
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/login_ok.do")
	public String member_login_ok(HttpServletRequest request)
	{	
	 	   String id=request.getParameter("id");
	 	   String pwd=request.getParameter("pwd");
	 	   MemberVO vo=MemberDAO.memberLogin(id, pwd);
	 	   
	 	   if(vo.getMsg().equals("OK"))
	 	   {
	 		   HttpSession session=request.getSession();
	 		   session.setAttribute("id", vo.getId());
	 		   session.setAttribute("name", vo.getName());
	 		   session.setAttribute("admin", vo.getAdmin());
	 	   }
	 	   System.out.println(vo.getMsg());
	 	   
	 	   request.setAttribute("msg", vo.getMsg());
	 	   return "../member/login.jsp";
	}
	
	@RequestMapping("member/logout.do")
    public String member_logout(HttpServletRequest request)
    {
 	   HttpSession session=request.getSession();
 	   session.invalidate();
 	   return "redirect:../main/main.do";
    }
	
	@RequestMapping("member/join.do")
	public String member_join(HttpServletRequest request)
	{	
		String pimg=request.getParameter("pimg");
		
		request.setAttribute("pimg", pimg);
		System.out.println(pimg);
		request.setAttribute("main_jsp", "../member/join.jsp"); 	//main.jsp에서 include의 경로
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/join_ok.do")
	public String member_join_ok(HttpServletRequest request)
	    {
	    	System.out.println("member/join_ok.do 실행");
	    	try 
	    	{
	    		//한글변환
	    		request.setCharacterEncoding("UTF-8");
	    	}
	    	catch (Exception e) {}
	    	String id=request.getParameter("id");
	    	String pwd=request.getParameter("pwd");
	    	String name=request.getParameter("name");
	    	String email=request.getParameter("email");
	    	String tel1=request.getParameter("tel1");
	    	String tel2=request.getParameter("tel2");
	    	String tel3=request.getParameter("tel3");
	    	String sex=request.getParameter("sex");
	    	String birthday=request.getParameter("birthday");
	    	String post=request.getParameter("post");
	    	String addr1=request.getParameter("addr1");
	    	String addr2=request.getParameter("addr2");
	    	String pimg=request.getParameter("pimg"); 
	    	
	    	MemberVO vo=new MemberVO();
	        vo.setId(id);
	        System.out.println(vo.getId());
	        vo.setPwd(pwd);
	        System.out.println(vo.getPwd());
	        vo.setName(name);
	        System.out.println(vo.getName());
	        vo.setEmail(email);
	        System.out.println(vo.getEmail());
	        vo.setTel(tel1+tel2+tel3);
	        System.out.println(vo.getTel());
	        vo.setBirthday(birthday);   
	        System.out.println(vo.getBirthday());
	        vo.setPost(post);
	        System.out.println(vo.getPost());
	        vo.setAddr1(addr1);
	        System.out.println(vo.getAddr1());
	        vo.setAddr2(addr2);
	        System.out.println(vo.getAddr2());
	        vo.setSex(sex);
	        System.out.println(vo.getSex());
	        vo.setPimg(pimg);
	        System.out.println(vo.getPimg());
	        

	    	//Insert문장 실행
	    	MemberDAO.memberInsert(vo);
	    	
	    	System.out.println("멤버인서트 dao실행 완료");
	    	
	    	return "redirect:../member/login.do"; 
	    }
	
	@RequestMapping("member/mypage.do")
    public String member_mypage(HttpServletRequest request)
    {
		request.setAttribute("main_jsp", "../member/mypage.jsp"); 	//main.jsp에서 include의 경로
		return "../main/main.jsp";
    }
	
//	@RequestMapping("member/wish.do")
//	public String news_list(HttpServletRequest request) 
//	{
//	    String wish_no=request.getParameter("wish_no");
//	    HttpSession session=request.getSession();
//	    String id=(String)session.getAttribute("id");
//	    WishVO vo=new WishVO();
//	    vo.setId(id);
//	    vo.setNews_no(Integer.parseInt(wish_no));
//	    MemberDAO.wishInsert(vo);
//	    return "../;
//	}

	
	
}
