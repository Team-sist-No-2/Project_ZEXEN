<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
 $(function(){
	if(${sessionScope.id==null}){
		$("#msg").click(function(){
			var result = confirm('로그인 후 입력해주세요'); 
			if(result) { //yes 
				location.replace('../member/login.do'); 
			} 
			else { 
				//no 
			} 	
		});	
	}else{
		
	}
		
}); 

 //댓글 글자수 카운트 출력
 $(function() {
     $('#msg').keyup(function() {
         bytesHandler(this);
     });
 });

 function getTextLength(str) {
     var len = 0;

     for (var i = 0; i < str.length; i++) {
         if (escape(str.charAt(i)).length == 6) {
             len++;
         }
         len++;
     }
     return len;
 }
function bytesHandler(obj) {
     var text = $(obj).val();
     $('#comment_limit').text(getTextLength(text));
 }

//댓글 글자수 제한 및 팝업
        $(document).ready(function(){
            $('#msg').on('keyup',function(){
                if($(this).val().length > 300){
                    alert("글자수는 300자로 이내로 제한됩니다.");
                    $(this).val($(this).val().substring(0,300));
                }
            });
        });
//대댓글 버튼 클릭시 대댓글 입력창 출력

$("#btn_reply_reply").click(function(){
  $("#commentReplyForm").hide();
});
</script>
</head>
<body>
	<section class="product_description_area">
        <div class="container">
            <h1 class="cont_tit"><a href="../board/main.do" title="자유게시판 목록으로 이동" style="color:#222">자유 게시판</a></h1>
            <div class="board_comm board_view">
                <div class="view_head">
                    <h4 class="tit_view">${vo.subject }</h4>
                    <div class="info_head">
                        <dl class="writer_info">
                            <dt class="tit_info">작성자</dt>
                            <dd class="cont_info">
                                <a href="#" class="link_writer" data-rank-id="15279378">
                                    <span class="txt_writer">${vo.member_id }</span>
                                </a>
                            </dd>
                        </dl>
                        <dl class="date_info">
                            <dt class="tit_info">작성일</dt>
                            <dd class="cont_info">
                            	<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/>
                            </dd>
                            <dt class="tit_info">조회수</dt>
                            <dd class="cont_info">${vo.hit }</dd>
                            <dt class="screen_out">좋아요수</dt>
                            <dd class="emph_g2">
                                <span class="img_board ico_recomm"></span>
                                ${vo.like_cnt }
                            </dd>
                        </dl>
                    </div>
                </div>
                <div class="view_cont">
                    <p>${vo.content }</p>
                    <div class="btn_recomm_box">
                        <a href="" class="btn_recomm" id="like_btn">
                            <span class="img_board"></span>좋아요<span id="like_out" class="num_recomm">${vo.like_cnt }</span>
                        </a>
                        <a href="" class="btn_recomm">
                            <span class="img_board"></span>싫어요<span id="gaia_recommendCount" class="num_recomm">${vo.hate_cnt }</span>
                        </a>
                    </div>
                </div>
                <div class="view_btn">
                    <div class="wrap_modify">
                    	<a href="../board/insert.do" class="btn_board btn_board2 write_btn button button--active button-contactForm" style="color:#222;background-color:transparent;">삭제</a>
                        <a href="../board/insert.do" class="btn_board btn_board2 write_btn button button--active button-contactForm">글쓰기</a>
                    </div>
                    <div class="wrap_page">
                        <a href="../board/main.do" class="btn_list"><span class="img_board">목록</span></a>
                        <a href="../board/detail.do?board_no=${vo.board_no+1 }" class="btn_next"><span class="img_board">윗글</span></a>
                        <a href="../board/detail.do?board_no=${vo.board_no-1 }" class="btn_prev"><span class="img_board">아랫글</span></a>
                    </div>
                </div>
            </div>

            <!--================게시판 댓글 ==============-->
            <div class="view_cmt">
            	<!--댓글 작성-->
            	<div class="cmt_head">
            		<c:if test="${vo.replyCount>0 }">
	                    <strong class="tit_cmt">댓글 <em class="emph_g2"><span class="screen_out">총 갯수</span>${vo.replyCount }</em>
	                    </strong>
                    </c:if>
                    
	                     <form action="../board/reply_insert.do" id="reply_form" method="post">
		                        <fieldset class="fld_cmt" style="padding:25px">
		                            <legend class="screen_out">댓글 작성 양식</legend>
		                            <label for="comment" class="screen_out">댓글 작성</label>
		                            <input type="hidden" name="board_no" value="${vo.board_no}">
		                            <c:if test="${sessionScope.id==null }">
			                            <textarea id="msg" name="msg" class="tf_cmt" title="답글입력" cols="70" rows="2"></textarea>
		                            </c:if>
		                            
									<c:if test="${sessionScope.id!=null }">
			                            <textarea id="msg" name="msg" class="tf_cmt" title="답글입력" cols="70" rows="2" ></textarea>
		                            <!-- <div class="desc_cmt">로그인 후 이용하실 수 있습니다.</div> -->
		                            <div class="info_byte">
		                                <span class="screen_out">입력된 바이트 수 : </span>
		                                <span class="emph_g2" id="comment_limit">0</span> / 600 bytes (한글 300자)
		                            </div>
		                            </c:if>
		                            <button type="submit" class="btn_register">등록</button>
		                        </fieldset>
	                    </form>
                </div>
                <!--//댓글 작성-->
                				
	            <!--댓글 리스트--> 
	            <c:forEach items="${rList }" var="rvo">  
                <div class="list_cmt">
                    <div class="cmt_cont " data-enc-comment-id="ysuxFeG7iBs0">
                        <div class="cont_user">
                            <a href="#" class="user_name" data-rank-id="9112168">
                                <span class="txt_writer">${rvo.id}</span>
                            </a>
                        </div>
                        <div class="cont_cmt">
                            <p class="txt_desc">
                                ${rvo.msg }
                                <span class="info_opt">
                                    <span class="txt_date"> ${rvo.dbday }
                                    </span>
                                    <a href="commentRecommend?type=R&amp;templatePath=/content.htmp&amp;articleId=110564&amp;bbsId=PC002&amp;templatePath=%2Fpubg%2Fcomment_list%2Fcontent.htmp&amp;commentId=151548" class="btn_recomm img_board">추천</a>
                                    <span id="gaia_recommendCount_151548" class="num_recomm">0</span>
                                    
                                    <c:if test="${sessionScope.id==rvo.id }">
	                                    <a href="" class="btn_cmt btn_reply">수정</a>
	                                    <a href="" class="btn_cmt btn_reply">삭제</a>
                                    </c:if>
                                    <a href="" class="btn_cmt btn_reply" id="btn_reply_reply">댓글</a>
                                </span>
                            </p>
                        </div>
                    </div>
                    <!--대댓글-->
                    <div id="commentReplyForm" class="cmt_reply" >
                        <form action="commentReply" method="post" class="comment_form">
                            <fieldset class="fld_reply">
                                <legend class="screen_out">댓글에 대한 답글 작성 양식</legend>
                                <label for="commentReply_151548" class="screen_out">댓글 작성</label>
                                <textarea id="commentReply_151548" name="commentContent" class="tf_cmt" title="답글입력"></textarea>
                                <div class="desc_reply">로그인 후 이용하실 수 있습니다.</div>
                                <div class="reply_opt">
                                    <span class="info_byte">
                                        <span class="screen_out">입력된 바이트 수 : </span>
                                        <span class="emph_g2" id="commentReply_limit_151548">0</span> / 600 bytes
                                    </span>
                                    <button type="submit" class="btn_cmt btn_register">등록</button>
                                    <button type="button" class="btn_cmt btn_cancel">취소</button>
                                </div>
                            </fieldset>
                            <input type="hidden" name="id" value="151548">
                            <input type="hidden" name="bbsId" value="PC002">
                            <input type="hidden" name="articleId" value="110564">
                            <input type="hidden" name="templatePath" value="/pubg/comment_list/content.htmp">
                            <input type="hidden" name="commentToken" value="G-TUjwC6IEwx9H5uszrxJg00">
                        </form>
                    </div>
                    <!--//대댓글-->
                    </div>
                </c:forEach>
                <!--댓글 리스트--> 
                <div class="foot_board">
                    <div class="wrap_paging">
                        <span class="screen_out">현재페이지</span>
                        <em class="link_page">1</em>
                    </div>
                </div>
            </div>
            <!--================게시판 댓글 ==============-->
        </div>
    </section>
</body>
</html>