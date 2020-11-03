package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;
import com.sist.controller.RequestMapping;
import com.sist.dao.ComputerDAO;
import com.sist.dao.GameDAO;
import com.sist.dao.MemberDAO;
import com.sist.dao.NewsDAO;
import com.sist.vo.BasketVO;
import com.sist.vo.ComputerVO;
import com.sist.vo.GameVO;
import com.sist.vo.MemberVO;
import com.sist.vo.NewsVO;
import com.sist.vo.WishVO;

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
	
	@RequestMapping("member/wish.do") // 찜목록
	public String wish(HttpServletRequest request) 
	{
		String cate=request.getParameter("cate");
		if(cate==null)
		{
			cate="1";
		}
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		Map map = new HashMap();
		map.put("id", id);
		
		map.put("cate", 1);
		List<WishVO> wList = MemberDAO.wishListData(map);
		List<GameVO> gList = new ArrayList<GameVO>();
		for (WishVO vo : wList) 
		{
			GameVO gvo = GameDAO.gameDetailData(vo.getGame_no());
			gvo.setGwish_no(vo.getWish_no());
			
			map.put("game_no",gvo.getGame_no());
			int gcnt=MemberDAO.gameWishToBasket(map);
			gvo.setGbasket_cnt(gcnt);
			gList.add(gvo);
		}
		request.setAttribute("gList", gList);
		
		map.put("cate", 2);
		wList = MemberDAO.wishListData(map);
		List<ComputerVO> cList = new ArrayList<ComputerVO>();
		for (WishVO vo : wList) 
		{
			ComputerVO cvo=ComputerDAO.computerDetailData(vo.getCom_no());
			cvo.setCwish_no(vo.getWish_no());
			
			map.put("com_no",cvo.getCom_no());
			int ccnt=MemberDAO.computerWishToBasket(map);
			cvo.setCbasket_cnt(ccnt);
			cList.add(cvo);
		}
		request.setAttribute("cList", cList);
		
		map.put("cate", 3);
		wList = MemberDAO.wishListData(map);
		List<NewsVO> nList = new ArrayList<NewsVO>();
		for (WishVO vo : wList) 
		{
			NewsVO nvo=NewsDAO.newsDetailData(vo.getNews_no());
			nvo.setNwish_no(vo.getWish_no());
			nList.add(nvo);
		}
		request.setAttribute("nList", nList);

		
		request.setAttribute("cate", cate); //선택되어서 보여질 페이지 조건
		request.setAttribute("main_jsp", "../member/wishlist.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/wish_delete.do")
	public String wish_delete(HttpServletRequest request)
	{
		String wish_no=request.getParameter("wish_no");
		String cate=request.getParameter("cate"); //카테고리 화면유지용
		if(cate==null)
			cate="1";
		
		MemberDAO.wishDelete(Integer.parseInt(wish_no));
		
		request.setAttribute("cate", cate);
		return("redirect:../member/wish.do?cate="+cate);
	}
	
	@RequestMapping("member/wish_alldelete.do")
	public String wish_alldelete(HttpServletRequest request)
	{
		String cate=request.getParameter("cate"); //카테고리 화면유지용
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		Map map=new HashMap();
		map.put("id", id);
		map.put("cate",cate);
		
		MemberDAO.wishAllDelete(map);
		
		request.setAttribute("cate", cate);
		return("redirect:../member/wish.do?cate="+cate);
	}
	
	@RequestMapping("member/basket.do") // 장바구니
	public String basket_list(HttpServletRequest request) 
	{
		String cate = request.getParameter("cate");
		if (cate == null)
			cate = "1";
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		Map map = new HashMap();
		map.put("cate", cate);
		map.put("id", id);

		List<BasketVO> bList = MemberDAO.basketListData(map);
		
		

		if (cate == "1") 
		{
			List<GameVO> gList = new ArrayList<GameVO>();
			for (BasketVO vo : bList) 
			{
				GameVO gvo = GameDAO.gameDetailData(vo.getGame_no());
				gvo.setGwish_no(vo.getBasket_no());
				gList.add(gvo);
			}
			request.setAttribute("gList", gList);
		}
		
		else
		{
			List<ComputerVO> cList = new ArrayList<ComputerVO>();
		}
		
		request.setAttribute("main_jsp", "../member/basket.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/basket_insert.do")
	public String basket_insert(HttpServletRequest request)
	{
		String cate=request.getParameter("cate");
		if(cate==null)
		{
			cate="1";
		}
		String game_no=request.getParameter("game_no");
		String com_no=request.getParameter("com_no");
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		BasketVO vo=new BasketVO();
		vo.setId(id);
		
		if(game_no!=null)
		{
		vo.setGame_no(Integer.parseInt(game_no));
		GameDAO.gameBasketInsert(vo);
		}
		
		else
		{
		vo.setCom_no(Integer.parseInt(com_no));
//		ComputerDAO.computerBasketInsert(vo);
		}
		
		return("redirect:../member/wish.do?cate="+cate);
	}
	
	@RequestMapping("member/basket_delete.do")
	public String basket_delete(HttpServletRequest request)
	{
		String basket_no=request.getParameter("basket_no");
		String cate=request.getParameter("cate"); //카테고리 화면유지용
		if(cate==null)
			cate="1";
		
		MemberDAO.basketDelete(Integer.parseInt(basket_no));
		
		request.setAttribute("cate", cate);
		return("redirect:../member/basket.do");
	}
	
	
	

	
}
