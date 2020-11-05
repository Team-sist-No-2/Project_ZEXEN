<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a.link_subject:hover{text-decoration:underline;}
</style>
<script type="text/javascript">
$(function() {
	$('.page-item').click(function(){
		let cate=cate_no;
		let page=$(this).attr("page")
		
		
		if(cate==0)
		{
		$.ajax({
				type:'post',
				url:'../board/list.do',
				data: {page:page}, //페이지 넘길 때 카테고리, 선언된 정렬 기준으로 페이지 넘기기
				success:function(result)
				{
					$('#tagin').html(result);
				}
			})
		}
		
		if(cate!=0)
		{
		$.ajax({
				type:'post',
				url:'../board/catelist.do',
				data: {page:page,cate_no:cate}, //페이지 넘길 때 카테고리, 선언된 정렬 기준으로 페이지 넘기기
				success:function(result)
				{
					$('#tagin').html(result);
				}
			})
		}
		
		
		
	})
});
</script>
</head>
<body>
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
                            <tbody>
                            <c:forEach var="vo" items="${list }">
                                <tr class="tr_emph">
                                    <td class="">
	                                    <c:choose>
	                                    	<c:when test="${vo.board_cate_no == 1}">자유</c:when>
	                                    	<c:when test="${vo.board_cate_no == 2}">게임</c:when>
	                                    	<c:when test="${vo.board_cate_no == 3}">컴퓨터</c:when>
	                                    </c:choose>
                                    </td>
                                    <td>
                                        <a href="../board/detail.do?board_no=${vo.board_no }" class="link_subject">${vo.subject }</a>
                                        <c:if test="${vo.replyCount>0 }">
								         	<span class="num_cmt emph_g2"><span class="screen_out">댓글 수</span>(${vo.replyCount })</span>
								        </c:if>
                                        <c:if test="${today==vo.dbday}">
                                        	<span class="img_board ico_new"  style="border:none;">새글</span>
                                        </c:if>
                                    </td>
                                    <td>${vo.member_id }</td>
                                    <td class="cell_date">${vo.dbday }</td>
                                    <td>${vo.hit }</td>
                                </tr> 
                             </c:forEach>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
                            </tbody>
                        </table>
                    </div>
                    <!--pagination-->
                    <nav class="blog-pagination justify-content-center d-flex" style="padding-bottom: 0px">
                    	<%-- 
                    	<div><a href="#">이전</a>
                    	${curpage } page / ${totalpage } pages
                    	<a href="#">다음</a></div>
                     --%>	
                        <ul class="pagination">
                          
                          <c:if test="${curpage>BLOCK }">
                              <li class="page-item" page="${startPage-1 }">
                                  <a class="page-link" aria-label="Previous">
                                    &lt;
                                  </a>
                              </li>
                          </c:if>
                              
                              <c:forEach var="i" begin="${startPage }" end="${endPage }">
	                              <c:if test="${i==curpage }">
	                              <li class="page-item active" page="${i }">
	                                  <a class="page-link">${i }</a>
	                              </li>
	                              </c:if>
	                              <c:if test="${i!=curpage }">
	                                 <li class="page-item" page="${i }">
	                                  <a class="page-link">${i }</a>
	                              </li>
	                              </c:if>
                              </c:forEach>
                              
                           <c:if test="${endPage<totalpage }">
                              <li class="page-item" page="${endPage+1 }">
                                  <a class="page-link" aria-label="Next">
                                      &gt;
                                  </a>
                              </li>
                           </c:if>
                            
                          </ul>
                    </nav>
</body>
</html>