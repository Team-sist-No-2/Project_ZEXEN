package com.sist.vo;
/*
 * WISH_NO NOT NULL NUMBER       
GAME_NO          NUMBER       
COM_NO           NUMBER       
ID               VARCHAR2(20) 
CATE             NUMBER     
 */
public class WishVO {
   private int wish_no;
   private int game_no;
   private int com_no;
   private String id;
   private int cate;
   private int news_no;
   public int getNews_no() {
      return news_no;
   }
   public void setNews_no(int news_no) {
      this.news_no = news_no;
   }
   public int getWish_no() {
      return wish_no;
   }
   public void setWish_no(int wish_no) {
      this.wish_no = wish_no;
   }
   public int getGame_no() {
      return game_no;
   }
   public void setGame_no(int game_no) {
      this.game_no = game_no;
   }
   public int getCom_no() {
      return com_no;
   }
   public void setCom_no(int com_no) {
      this.com_no = com_no;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public int getCate() {
      return cate;
   }
   public void setCate(int cate) {
      this.cate = cate;
   }
   
}