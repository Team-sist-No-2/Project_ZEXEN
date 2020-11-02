package com.sist.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.MemberVO;
import com.sist.vo.WishVO;


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

	public static MemberVO memberLogin(String id, String pwd) 
	{
		MemberVO vo = new MemberVO();
		SqlSession session = ssf.openSession();
		int count = session.selectOne("memberIdcheck", id);
		if (count == 0) {
			vo.setMsg("NOID");
		} else {
			MemberVO dVO = session.selectOne("memberLogin", id);
			if (pwd.equals(dVO.getPwd())) {
				vo.setMsg("OK");
				vo.setId(dVO.getId());
				vo.setName(dVO.getName());
				vo.setAdmin(dVO.getAdmin());
				vo.setPimg(dVO.getPimg());
			} else {
				vo.setMsg("NOPWD");
			}
		}

		return vo;
	}
	
	public static List<WishVO> wishListData(Map map) 
	{
		SqlSession session = ssf.openSession();
		List<WishVO> list = session.selectList("wishListData", map);
		session.close();
		return list;
	}

	public static void wishDelete(int wish_no) 
	{
		SqlSession session = ssf.openSession(true);
		session.delete("wishDelete", wish_no);
		session.close();
	}
	
	public static int wish_count(String id) 
	{
		SqlSession session = ssf.openSession(true);
		int wish_cnt=session.selectOne("wishCount",id);
		session.close();
		return wish_cnt;
	}
}
