package com.sist.vo;
/*
BOARD_NO      NOT NULL NUMBER        게시판번호
MEMBER_ID     NOT NULL VARCHAR2(10)  회원아이디
SUBJECT       NOT NULL VARCHAR2(20)  제목
CONTENT       NOT NULL VARCHAR2(1000)  내용
REGDATE                DATE           작성일
HIT           NOT NULL NUMBER         조회수
LIKE_CNT               NUMBER         좋아요
HATE_CNT               NUMBER         싫어요
FILE_NAME              VARCHAR2(50)   파일이름
FILE_SIZE              NUMBER         파일사이즈
BOARD_CATE_NO NOT NULL NUMBER         카테고리종류
 */

import java.util.Date;

public class BoardVO {
	private int board_no;	//게시판번호
	private String member_id;	//회원아이디
	private String subject;;	//제목	
	private String content;	//내용
	private Date regdate; //작성일
	private int hit;	//조회수
	private int like_cnt;	//좋아요
	private int hate_cnt;	//싫어요수
	private String file_name;	//파일이름
	private int file_size;	//파일사이즈
	private int board_cate_no;	//카테고리종류
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
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
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public int getBoard_cate_no() {
		return board_cate_no;
	}
	public void setBoard_cate_no(int board_cate_no) {
		this.board_cate_no = board_cate_no;
	}
	
	
	
}
