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
   public int getCwish_no() {
		return cwish_no;
	}
	public void setCwish_no(int cwish_no) {
		this.cwish_no = cwish_no;
	}
	public int getCbasket_no() {
		return cbasket_no;
	}
	public void setCbasket_no(int cbasket_no) {
		this.cbasket_no = cbasket_no;
	}
private int com_no; // �젣�뭹踰덊샇
   private int cate_no; // 移댄뀒怨좊━
   private String product; // �젣�뭹紐�
   private String spec; // �뒪�럺
   private String image; // �씠誘몄�
   private String gift; // �궗���뭹
   private int quantity; // 媛쒖닔
   private int cost; // 媛�寃�
   private int sell_cnt; //�쁽�옱源뚯� �뙋留ㅻ��닔 default 0
   private int stock_cnt; //�옱怨좎닔�웾 default 50?
   private int hit;
   private int cwish_no;
   private int cbasket_no;
   
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
   public int getHit() {
	  return hit;
   }
   public void setHit(int hit) {
	  this.hit = hit;
   }
   
}