package com.sist.vo;

/*
  		COM_NO          NOT NULL NUMBER         
		CATE_NO                  NUMBER         
		PRODUCT                  VARCHAR2(1000) 
		SPEC                     VARCHAR2(1000) 
		IMAGE                    VARCHAR2(1000) 
		DELIVERY                 VARCHAR2(1000) 
		QUANTITY        NOT NULL NUMBER         
		COST                     VARCHAR2(1000) 
		CHANGESPEC_COST          VARCHAR2(1000) 
		GIFT                     VARCHAR2(1000) 
		SELL_CNT        NOT NULL NUMBER         
		STOCK_CNT       NOT NULL NUMBER         
 */

public class ComputerVO {
   private int com_no; // 제품번호
   private int cate_no; // 카테고리
   private String product; // 제품명
   private String spec; // 스펙
   private String image; // 이미지
   private String gift; // 사은품
   private int quantity; // 개수
   private int cost; // 가격
   private int sell_cnt; //현재까지 판매대수 default 0
   private int stock_cnt; //재고수량 default 50?
   
   
   public int getCom_no() {
      return com_no;
   }
   public void setCom_no(int com_no) {
      this.com_no = com_no;
   }
   public int getCate_no() {
      return cate_no;
   }
   public void setCate_no(int cate_no) {
      this.cate_no = cate_no;
   }
   public String getProduct() {
      return product;
   }
   public void setProduct(String product) {
      this.product = product;
   }
   public String getSpec() {
      return spec;
   }
   public void setSpec(String spec) {
      this.spec = spec;
   }
   public String getImage() {
      return image;
   }
   public void setImage(String image) {
      this.image = image;
   }
   public String getGift() {
      return gift;
   }
   public void setGift(String gift) {
      this.gift = gift;
   }
   public int getQuantity() {
      return quantity;
   }
   public void setQuantity(int quantity) {
      this.quantity = quantity;
   }
   public int getCost() {
      return cost;
   }
   public void setCost(int cost) {
      this.cost = cost;
   }
   public int getSell_cnt() {
      return sell_cnt;
   }
   public void setSell_cnt(int sell_cnt) {
      this.sell_cnt = sell_cnt;
   }
   public int getStock_cnt() {
      return stock_cnt;
   }
   public void setStock_cnt(int stock_cnt) {
      this.stock_cnt = stock_cnt;
   }
   
}