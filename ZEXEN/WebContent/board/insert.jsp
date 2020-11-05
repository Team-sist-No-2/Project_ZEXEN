<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<!--================게시글 작성=================-->
    <section class="product_description_area">
        <div class="container">
            <h1 class="cont_tit">게시글 작성</h1>
            <form method="post" action="../board/insert_ok.do">
            	<!-- <input type="hidden" name="regdate" value="${vo.regdate }"> -->
            	<input type="hidden" name="board_no" value="">
            	<input type="hidden" name="member_id" value="${sessionScope.id }">
                <div class="board_comm board_view">
                    <div class="view_head">
                        <div class="info_head" style="padding:10px;">
                            <div class="filter-bar">
                                <div class="sorting mr-auto" style="display:inline-block; width:19%;float:left;margin-top:0;margin-right:10px !important;">
                                    <select name="selectcno" style="display: none;">
                                        <option value="1">자유 게시판</option>
                                        <option value="2">게임 게시판</option>
                                        <option value="3">컴퓨터 게시판</option>
                                    </select>
                                    <div class="nice-select" tabindex="0" style="width: 100%;height: 50px; line-height: 50px; margin-top: 0; border:1px solid #c3c3c3;">
                                        <span class="current" style="color:#222;">자유게시판</span>
                                        <ul class="list" style="margin-top:1px; width: 100%; color:#222;">
                                            <li data-value="1" class="option selected">자유게시판</li>
                                            <li data-value="2" class="option">게임게시판</li>
                                            <li data-value="3" class="option">컴퓨터게시판</li>
                                        </ul>
                                    </div>
                                </div>
                                <div style="display: inline-block; width:80%;float:left;">
                                    <div class="input-group filter-bar-search" style="margin-top:0;">
                                        <input type="text" name="subject" placeholder="제목을 입력해 주세요" style="width:100%;height: 50px; color:#222; border-color:#c3c3c3;">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="view_cont" style="padding: 10px 30px 30px;">
                        <textarea rows="10" cols="50" name="content" placeholder="내용을 입력해 주세요" style="width:100%; padding: 12px; border-color: #c3c3c3;"></textarea>
                    </div>
                    <div class="view_btn">
                        <div class="wrap_modify">
                            <a href="#" onclick="javascript:history.back()" class="btn_board btn_board2 write_btn button button--active button-contactForm" style="background: transparent; color: #222;">취소</a>
                            <input type="submit" value="등록" class="btn_board btn_board2 write_btn button button--active button-contactForm">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!--================//게시글 작성=================-->                
</body>
</html>