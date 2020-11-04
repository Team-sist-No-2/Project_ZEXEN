package com.sist.vo;

public class BasketVO {
	   public int getComputer_count() {
		return computer_count;
	}
	public void setComputer_count(int computer_count) {
		this.computer_count = computer_count;
	}
	public int getBasket_no() {
		return basket_no;
	}
	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
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
	private int basket_no;
	   private int game_no;
	   private int com_no;
	   private String id;
	   private int cate;
	   private int computer_count;
}
