package com.sist.data;

import org.jsoup.*;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.sist.dao.ComputerDAO;
import com.sist.vo.ComputerVO;

public class ComputerManager {
	   public void comAllData()
	   {   
	      ComputerDAO dao=new ComputerDAO();
	      try
	      {   
	         int k=1;
	         int[] cate= {0, 3078,3875,3622,5112,1573};
	         for(int a=1;a<=5;a++)
	         {
		         Document doc=Jsoup.connect("http://shop.danawa.com/shopmain/?controller=goods&methods=index&categorySeq="+cate[a]).get();
		         // 1 인기 : http://shop.danawa.com/shopmain/?controller=goods&methods=index&categorySeq=3078
		         // 2 RPG : http://shop.danawa.com/shopmain/?controller=goods&methods=index&categorySeq=3875
		         // 3 전략 : http://shop.danawa.com/shopmain/?controller=goods&methods=index&categorySeq=3622
		         // 4 액션 : http://shop.danawa.com/shopmain/?controller=goods&methods=index&categorySeq=5112
		         // 5 스포츠 : http://shop.danawa.com/shopmain/?controller=goods&methods=index&categorySeq=1573
		         Elements link=doc.select("div.pc_title a");
		         
		         System.out.println(link.size());
		         
		         
		         for(int j=1;j<link.size();j++)
		         {
		            try
		            {
		               ComputerVO vo=new ComputerVO();
		               
		               String url=link.get(j).attr("href");
		               System.out.println(url);
		               Document doc2=Jsoup.connect(url).get();
		               
		                  Element product=doc2.selectFirst("p.prod_name"); 			//이름
		                  Element spec=doc2.selectFirst("li.spec_item");			//스펙
		                  Element image=doc2.selectFirst("div.prod_img img");		//이미지
		                  Element cost=doc2.selectFirst("span.prod_price");			//가격
		                  Element gift=doc2.selectFirst("dd.prod_info_text strong");//사은품
		             
		                  int pirce = Integer.parseInt(cost.text().replace(",", ""));//가격 숫자만 
		                  
		                  
		                  System.out.println("번호:"+k++);
		                  System.out.println("cateno:1");
		                  System.out.println("제품명:"+product.text());
		                  System.out.println("스펙:"+spec.text());
		                  System.out.println("이미지:"+image.attr("src"));
		                  System.out.println("사은품:"+gift.text());
		                  System.out.println("수량:"+0);
		                  System.out.println("가격:"+pirce);
		                  System.out.println("총금액:"+0);
		                  System.out.println("판매수량:"+0);
		                  System.out.println("재고수량:"+0);
		                  
		                  
		                  
		                  
		                  
		                  // 2. 오라클 VO에 값 채우기
		                  vo.setCate_no(a);
		                  vo.setProduct(product.text());
		                  vo.setSpec(spec.text());
		                  vo.setImage(image.attr("src"));
		                  vo.setGift(gift.text());
		                  vo.setQuantity(50);//재고
		                  vo.setCost(pirce); //가격
		                  vo.setSell_cnt(0); //판매대수
		                  vo.setStock_cnt(0); //디폴트 필요?
		                    
		                    // 3. dao로 전송
		                    dao.computerInsert(vo);
		                    System.out.println("==========================");
		                    Thread.sleep(500);
		                    
		                    
		            }catch(Exception ex) 
		            {
		               System.out.println("for문에러");
		               ex.printStackTrace();
		               //System.out.println(ex.getMessage());
		            }
		         }
	         
	         }
	      }catch(Exception ex)
	      {
	         System.out.println(ex.getMessage());
	      }
	   }
	   
	   public static void main(String[] args) {
	      ComputerManager m=new ComputerManager();
	      m.comAllData();
	   }
	}