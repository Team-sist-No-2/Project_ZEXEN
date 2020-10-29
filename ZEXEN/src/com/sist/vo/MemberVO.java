package com.sist.vo;
/*
 *
MEMBER_ID   VARCHAR2(20 BYTE)
PWD         VARCHAR2(20 BYTE)
NAME      VARCHAR2(34 BYTE)
EMAIL      VARCHAR2(1000 BYTE)
TEL         NUMBER
SEX         VARCHAR2(10 BYTE)
BIRTHDAY   VARCHAR2(50 BYTE)
ADDRESS1   VARCHAR2(200 BYTE)
ADDRESS2   VARCHAR2(100 BYTE)
ADMIN_TYPE   CHAR(1 BYTE)
POST      VARCHAR2(10 BYTE)
 */

public class MemberVO {
    private String member_id;
    private String pwd;
    private String name;
    private String email;
    private String tel;
    private String sex;
    private String birthday;
    private String addr1;
    private String addr2;
    private String admin_type;
    private String post;
    private String msg;
    
   public String getMsg() {
      return msg;
   }
   public void setMsg(String msg) {
      this.msg = msg;
   }
   public String getMember_id() {
      return member_id;
   }
   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }
   public String getPwd() {
      return pwd;
   }
   public void setPwd(String pwd) {
      this.pwd = pwd;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getTel() {
      return tel;
   }
   public void setTel(String tel) {
      this.tel = tel;
   }
   public String getSex() {
      return sex;
   }
   public void setSex(String sex) {
      this.sex = sex;
   }
   public String getBirthday() {
      return birthday;
   }
   public void setBirthday(String birthday) {
      this.birthday = birthday;
   }
   public String getAddr1() {
      return addr1;
   }
   public void setAddr1(String addr1) {
      this.addr1 = addr1;
   }
   public String getAddr2() {
      return addr2;
   }
   public void setAddr2(String addr2) {
      this.addr2 = addr2;
   }
   public String getAdmin_type() {
      return admin_type;
   }
   public void setAdmin_type(String admin_type) {
      this.admin_type = admin_type;
   }
   public String getPost() {
      return post;
   }
   public void setPost(String post) {
      this.post = post;
   }
   
}