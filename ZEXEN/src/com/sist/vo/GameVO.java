package com.sist.vo;

import java.sql.Date;

/*
 *  game_no NUMBER,
    category VARCHAR2(50) CONSTRAINT game_cate_nn NOT NULL,
    name VARCHAR2(150) CONSTRAINT game_name_nn NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    
    developer VARCHAR2(300),
    content CLOB,
    spec VARCHAR2(1000),
    min_spec VARCHAR2(1000),
    recom_spec VARCHAR2(1000),
    poster CLOB,
    
    like_cnt NUMBER DEFAULT 0,
    hate_cnt NUMBER DEFAULT 0,
    
    price VARCHAR2(300),
    tag VARCHAR2(500),
    movie VARCHAR2(500),
    CONSTRAINT game_no_pk PRIMARY KEY(game_no)
 */
public class GameVO {
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSell_cnt() {
		return sell_cnt;
	}
	public void setSell_cnt(int sell_cnt) {
		this.sell_cnt = sell_cnt;
	}
	public int getGame_no() {
		return game_no;
	}
	public void setGame_no(int game_no) {
		this.game_no = game_no;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRel_day() {
		return rel_day;
	}
	public void setRel_day(Date rel_day) {
		this.rel_day = rel_day;
	}
	public String getDeveloper() {
		return developer;
	}
	public void setDeveloper(String developer) {
		this.developer = developer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getMin_spec() {
		return min_spec;
	}
	public void setMin_spec(String min_spec) {
		this.min_spec = min_spec;
	}
	public String getRecom_spec() {
		return recom_spec;
	}
	public void setRecom_spec(String recom_spec) {
		this.recom_spec = recom_spec;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public int getLike_cnt() {
		return like_cnt;
	}
	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}
	public int getHate_cnt() {
		return hate_cnt;
	}
	public void setHate_cnt(int hate_cnt) {
		this.hate_cnt = hate_cnt;
	}

	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getMovie() {
		return movie;
	}
	public void setMovie(String movie) {
		this.movie = movie;
	}
	private int game_no;
	private int category;
	private String name;
	private Date rel_day; //디폴트 SYSDATE
    private String developer;
    private String content;
    private String min_spec;
    private String recom_spec;
    private String poster;
    private int like_cnt; //디폴트 0
    private int hate_cnt; //디폴트 0
    private int price;	  //디폴트 0, jsp에서 if(pirce=0) 출력="무료"
    private String tag;
    private String movie;
    private int sell_cnt; //디폴트 0
}
