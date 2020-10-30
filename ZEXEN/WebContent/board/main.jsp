<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>커뮤니티 게시판</title>
</head>
<body>

	<!--================게시판=================-->
    <section class="product_description_area">
        <div class="container">
            <h1 class="cont_tit">게시판</h1>
            <!--탭-->
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">전체</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">자유</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">게임</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">컴퓨터</a>
                </li>
                <li style="float:right"><span class="info_count">총 <em>88880</em>개의 글이 있습니다.</span></li>
            </ul>
            <!--//탭-->
            <!--탭 컨텐츠-->
            <div class="tab-content" id="myTabContent">
                <!--탭1 전체게시판-->
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <div class="table-responsive">
                        <table class="tbl_board">
                            <caption class="ir_caption screen_out">게시판 목록</caption>
                            <colgroup>
                                <col class="col_cate">
                                <col class="col_tit">
                                <col class="col_writer">
                                <col class="col_date">
                                <col class="col_view">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">구분</th>
                                    <th scope="col" class="cell_tit">제목</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">작성일</th>
                                    <th scope="col">조회수</th>
                                </tr>
                            </thead>
                            <c:forEach var="vo" items="${list }">
                            <tbody>
                                <tr class="tr_emph">
                                    <td class="">
	                                    <c:choose>
	                                    	<c:when test="${vo.board_cate_no == 0}">자유</c:when>
	                                    	<c:when test="${vo.board_cate_no == 1}">게임</c:when>
	                                    	<c:when test="${vo.board_cate_no == 2}">게시판</c:when>
	                                    </c:choose>
                                    </td>
                                    <td>
                                        <a href="../board/detail.do?board_no=${vo.board_no }" class="link_subject">${vo.subject }</a>
                                        <span class="num_cmt emph_g2"><span class="screen_out">댓글 수</span>[9]</span>
                                        <span class="img_board ico_new">새글</span>
                                    </td>
                                    <td>${vo.member_id }</td>
                                    <td class="cell_date"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/> </td>
                                    <td>${vo.hit }</td>
                                </tr>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
                            </tbody>
                            </c:forEach>
                        </table>
                    </div>
                    <!--pagination-->
                    <nav class="blog-pagination justify-content-center d-flex" style="padding-bottom: 0px">
                        <ul class="pagination">
                            <li class="page-item">
                                <a href="#" class="page-link" aria-label="Previous">
                                    <span aria-hidden="true">
                                        <span class="lnr lnr-chevron-left"></span>
                                    </span>
                                </a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link">01</a>
                            </li>
                            <li class="page-item active">
                                <a href="#" class="page-link">02</a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link">03</a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link">04</a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link">05</a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link" aria-label="Next">
                                    <span aria-hidden="true">
                                        <span class="lnr lnr-chevron-right"></span>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <!--//pagination-->
                    <div class="form-group text-center text-md-right mt-3">
                        <!--검색-->
                        <form name="searchForm" method="get" action="list" class="frm_search">
                            <input type="hidden" id="searchKey" name="searchKey" value="subjectNcontent">
                            <input type="hidden" id="bbsId" name="bbsId" value="PC002">
                            <input type="hidden" id="objCate1" name="objCate1" value="215">
                            <div class="filter-bar" style="float:left; background: transparent">
                                <div class="sorting mr-auto" style="display:inline-block; float:left">
                                    <select style="display: none;">
                                        <option value="1">제목</option>
                                        <option value="1">제목+내용</option>
                                        <option value="1">작성자</option>
                                    </select>
                                    <div class="nice-select" tabindex="0" style="width:120px;">
                                        <span class="current">제목</span>
                                        <ul class="list">
                                            <li data-value="1" class="option selected">제목</li>
                                            <li data-value="1" class="option">제목+내용</li>
                                            <li data-value="1" class="option">작성자</li>
                                        </ul>
                                    </div>
                                </div>
                                <div style="display: inline-block; float:left">
                                    <div class="input-group filter-bar-search">
                                        <input type="text" placeholder="Search">
                                        <div class="input-group-append">
                                            <button type="button"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!--//검색-->
                        <button type="submit" class="button button--active button-contactForm">글쓰기</button>
                    </div>
                </div>
                <!--//탭1 전체게시판-->
			</div>
		</div>
	</section>                
</body>
</html>