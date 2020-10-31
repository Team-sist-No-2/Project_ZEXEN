package com.sist.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.MemberVO;


public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {ssf=CreateSqlSessionFactory.getSsf();}
   
	public static void memberInsert(MemberVO vo)
	  {
	     SqlSession session=ssf.openSession();
	     session.insert("memberInsert", vo);
	     session.commit();
	     session.close();
	  }

	public static MemberVO memberLogin(String id,String pwd)
	  {
		  MemberVO vo=new MemberVO();
		  SqlSession session=ssf.openSession();
		  int count=session.selectOne("memberIdcheck", id);
		  if(count==0)
		  {
			  vo.setMsg("NOID");
		  }
		  else
		  {
			  MemberVO dVO=session.selectOne("memberLogin", id);
			  if(pwd.equals(dVO.getPwd()))
			  {
				  vo.setMsg("OK");
				  vo.setId(dVO.getId());
				  vo.setName(dVO.getName());
				  vo.setAdmin(dVO.getAdmin());
			  }
			  else
			  {
				  vo.setMsg("NOPWD");
			  }
		  }
		  
		  return vo;
	  }
	
}
