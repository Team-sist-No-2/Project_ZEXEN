<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="product_description_area">
        <div class="container">
            <h1 class="cont_tit">자유 게시판</h1>
            <div class="board_comm board_view">
                <div class="view_head">
                    <h4 class="tit_view"> 4어시는 처음 해봤네..</h4>
                    <div class="info_head">
                        <dl class="writer_info">
                            <dt class="tit_info">작성자</dt>
                            <dd class="cont_info">
                                <a href="#" class="link_writer" data-rank-id="15279378">
                                    <span class="txt_writer">박가영</span>
                                </a>
                            </dd>
                        </dl>
                        <dl class="date_info">
                            <dt class="tit_info">작성일</dt>
                            <dd class="cont_info">2020.10.19 오후 08:37</dd>
                            <dt class="tit_info">조회수</dt>
                            <dd class="cont_info">75</dd>
                            <dt class="screen_out">좋아요수</dt>
                            <dd class="emph_g2">
                                <span class="img_board ico_recomm"></span>
                                0
                            </dd>
                        </dl>
                    </div>
                </div>
                <div class="view_cont">
                    <p>1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따1킬 4어시 ㅋㅋㅋㅋ 도움왕 오졌따</p>
                    <div class="btn_recomm_box">
                        <a href="" class="btn_recomm">
                            <span class="img_board"></span>좋아요<span id="gaia_recommendCount" class="num_recomm">0</span>
                        </a>
                        <a href="" class="btn_recomm">
                            <span class="img_board"></span>싫어요<span id="gaia_recommendCount" class="num_recomm">0</span>
                        </a>
                    </div>
                </div>
                <div class="view_btn">
                    <div class="wrap_modify">
                        <a href="#" class="btn_board btn_board2 write_btn button button--active button-contactForm">글쓰기</a>
                    </div>
                    <div class="wrap_page">
                        <a href="#" class="btn_list"><span class="img_board">목록</span></a>
                        <a href="#" class="btn_next"><span class="img_board">윗글</span></a>
                        <a href="#" class="btn_prev"><span class="img_board">아랫글</span></a>
                    </div>
                </div>
            </div>

            <!--================게시판 댓글 ==============-->
            <div class="view_cmt">
                <div class="cmt_head">
                    <strong class="tit_cmt">댓글 <em class="emph_g2"><span class="screen_out">총 갯수</span>9</em></strong>
                    <form action="commentWrite" id="writeCommentForm" name="writeCommentForm" method="post">
                        <fieldset class="fld_cmt" style="padding:25px">
                            <legend class="screen_out">댓글 작성 양식</legend>
                            <label for="comment" class="screen_out">댓글 작성</label>
                            <textarea id="comment" name="commentContent" class="tf_cmt" title="답글입력" cols="70" rows="2"></textarea>
                            <div class="desc_cmt">로그인 후 이용하실 수 있습니다.</div>
                            <div class="info_byte">
                                <span class="screen_out">입력된 바이트 수 : </span>
                                <span class="emph_g2" id="comment_limit">0</span> / 600 bytes (한글 300자)
                            </div>
                            <button type="submit" class="btn_register">등록</button>
                        </fieldset>
                        <input type="hidden" name="id" value="">
                        <input type="hidden" name="bbsId" value="PC002">
                        <input type="hidden" name="articleId" value="110564">
                        <input type="hidden" name="templatePath" value="/pubg/comment_list/content.htmp">
                        <input type="hidden" name="commentToken" value="yhG59nOdNLzl9Q-CHKLB1A00">
                    </form>
                </div>
                <div class="list_cmt">
                    <div class="cmt_cont " data-enc-comment-id="ysuxFeG7iBs0">
                        <div class="cont_user">
                            <a href="#" class="user_name" data-rank-id="9112168">
                                <span class="txt_writer"> hongbangjang7</span>
                            </a>
                        </div>
                        <div class="cont_cmt">
                            <p class="txt_desc">
                                아 언제고쳐주는건데요 주말이라 안하는거 같은데 댄장할
                                <span class="info_opt">
                                    <span class="txt_date"> 20.10.18
                                    </span>
                                    <a href="commentRecommend?type=R&amp;templatePath=/content.htmp&amp;articleId=110564&amp;bbsId=PC002&amp;templatePath=%2Fpubg%2Fcomment_list%2Fcontent.htmp&amp;commentId=151548" class="btn_recomm img_board">추천</a>
                                    <span id="gaia_recommendCount_151548" class="num_recomm">0</span>
                                    <a href="" class="btn_cmt btn_reply">댓글</a>
                                </span>
                            </p>
                        </div>
                    </div>
                    <!--대댓글-->
                    <div id="commentReplyForm_151548" class="cmt_reply " data-comment-id="151548" style="">
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

                    <div id="commentReplyForm_151548" class="cmt_reply " data-comment-id="151548" style="display:none">
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
                            <input type="hidden" name="commentToken" value="yhG59nOdNLzl9Q-CHKLB1A00">
                        </form>
                    </div>
                    <div class="cmt_cont " data-enc-comment-id="F3nA923_Jw10">
                        <div class="cont_user">
                            <a href="#" class="user_name" data-rank-id="17698084">
                                <span class="ico_board_tier gold1"></span>
                                <span class="txt_writer"> Another-_-Pingu
                                </span>
                            </a>
                        </div>
                        <div class="cont_cmt">
                            <p class="txt_desc">
                                보내면 뭐하냐 저번에도 이거땜에 개빡는데 일주일이 넘도록 안고쳐지던데<br>맨날 업데이트해서 이따구면 업데이트를 하지마 그냥ㅡㅡ 뭐하러 하냐? 돈벌라고? 이랄지해서 돈벌면 참좋겠다 그치?<br>무슨 유료게임이 이따구야ㅡㅡ 넥슨에서 나왔다더니 넥슨보다 돈은 더 받아먹을라하고 겜은 유지도못하고 어휴 진짜 욕만안했지 진심으로 욕 존나 밖고싶으니까 빨리 고쳐라
                                <span class="info_opt">
                                    <span class="txt_date"> 20.10.18
                                    </span>
                                    <a href="commentRecommend?type=R&amp;templatePath=/content.htmp&amp;articleId=110564&amp;bbsId=PC002&amp;templatePath=%2Fpubg%2Fcomment_list%2Fcontent.htmp&amp;commentId=151543" class="btn_recomm img_board">추천</a>
                                    <span id="gaia_recommendCount_151543" class="num_recomm">0</span>
                                    <a href="" class="btn_cmt btn_reply">댓글</a>
                                    <a href="https://article.report.game.daum.net/popup/report.daum?docurl=http%3A%2F%2Fbbs.pubg.game.daum.net%2Fgaia%2Fdo%2Fpubg%2Ffree%2Fread%3FbbsId%3DPC002%26articleId%3D110564%26commentId%3D151543&amp;commentId=151543&amp;cPageIndex=1" class="btn_cmt btn_report">신고</a>
                                </span>
                            </p>
                        </div>
                    </div>
                    <div id="commentReplyForm_151543" class="cmt_reply " data-comment-id="151543" style="display:none">
                        <form action="commentReply" method="post" class="comment_form">
                            <fieldset class="fld_reply">
                                <legend class="screen_out">댓글에 대한 답글 작성 양식</legend>
                                <label for="commentReply_151543" class="screen_out">댓글 작성</label>
                                <textarea id="commentReply_151543" name="commentContent" class="tf_cmt" title="답글입력"></textarea>
                                <div class="desc_reply">로그인 후 이용하실 수 있습니다.</div>
                                <div class="reply_opt">
                                    <span class="info_byte">
                                        <span class="screen_out">입력된 바이트 수 : </span>
                                        <span class="emph_g2" id="commentReply_limit_151543">0</span> / 600 bytes
                                    </span>
                                    <button type="submit" class="btn_cmt btn_register">등록</button>
                                    <button type="button" class="btn_cmt btn_cancel">취소</button>
                                </div>
                            </fieldset>
                            <input type="hidden" name="id" value="151543">
                            <input type="hidden" name="bbsId" value="PC002">
                            <input type="hidden" name="articleId" value="110564">
                            <input type="hidden" name="templatePath" value="/pubg/comment_list/content.htmp">
                            <input type="hidden" name="commentToken" value="yhG59nOdNLzl9Q-CHKLB1A00">
                        </form>
                    </div>
                    <div class="cmt_cont " data-enc-comment-id="AUXA9riMYUE0">
                        <div class="cont_user">
                            <a href="#" class="user_name" data-rank-id="673920">
                                <span class="ico_board_tier "></span>
                                <span class="txt_writer"> whyiiii
                                </span>
                            </a>
                        </div>
                        <div class="cont_cmt">
                            <p class="txt_desc">
                                물갈이한번 해야한다
                                <span class="info_opt">
                                    <span class="txt_date"> 20.10.18
                                    </span>
                                    <a href="commentRecommend?type=R&amp;templatePath=/content.htmp&amp;articleId=110564&amp;bbsId=PC002&amp;templatePath=%2Fpubg%2Fcomment_list%2Fcontent.htmp&amp;commentId=151511" class="btn_recomm img_board">추천</a>
                                    <span id="gaia_recommendCount_151511" class="num_recomm">0</span>
                                    <a href="" class="btn_cmt btn_reply">댓글</a>
                                    <a href="https://article.report.game.daum.net/popup/report.daum?docurl=http%3A%2F%2Fbbs.pubg.game.daum.net%2Fgaia%2Fdo%2Fpubg%2Ffree%2Fread%3FbbsId%3DPC002%26articleId%3D110564%26commentId%3D151511&amp;commentId=151511&amp;cPageIndex=1" class="btn_cmt btn_report">신고</a>
                                </span>
                            </p>
                        </div>
                    </div>
                    <div id="commentReplyForm_151511" class="cmt_reply " data-comment-id="151511" style="display:none">
                        <form action="commentReply" method="post" class="comment_form">
                            <fieldset class="fld_reply">
                                <legend class="screen_out">댓글에 대한 답글 작성 양식</legend>
                                <label for="commentReply_151511" class="screen_out">댓글 작성</label>
                                <textarea id="commentReply_151511" name="commentContent" class="tf_cmt" title="답글입력"></textarea>
                                <div class="desc_reply">로그인 후 이용하실 수 있습니다.</div>
                                <div class="reply_opt">
                                    <span class="info_byte">
                                        <span class="screen_out">입력된 바이트 수 : </span>
                                        <span class="emph_g2" id="commentReply_limit_151511">0</span> / 600 bytes
                                    </span>
                                    <button type="submit" class="btn_cmt btn_register">등록</button>
                                    <button type="button" class="btn_cmt btn_cancel">취소</button>
                                </div>
                            </fieldset>
                            <input type="hidden" name="id" value="151511">
                            <input type="hidden" name="bbsId" value="PC002">
                            <input type="hidden" name="articleId" value="110564">
                            <input type="hidden" name="templatePath" value="/pubg/comment_list/content.htmp">
                            <input type="hidden" name="commentToken" value="yhG59nOdNLzl9Q-CHKLB1A00">
                        </form>
                    </div>
                    <div class="cmt_cont " data-enc-comment-id="gHpyOSaWJ8w0">
                        <div class="cont_user">
                            <a href="#" class="user_name" data-rank-id="12818752">
                                <span class="ico_board_tier gold4"></span>
                                <span class="txt_writer"> bloodoftuseday
                                </span>
                            </a>
                        </div>
                        <div class="cont_cmt">
                            <p class="txt_desc">
                                코로나 걸려서 격리당했냐?
                                <span class="info_opt">
                                    <span class="txt_date"> 20.10.18
                                    </span>
                                    <a href="commentRecommend?type=R&amp;templatePath=/content.htmp&amp;articleId=110564&amp;bbsId=PC002&amp;templatePath=%2Fpubg%2Fcomment_list%2Fcontent.htmp&amp;commentId=151506" class="btn_recomm img_board">추천</a>
                                    <span id="gaia_recommendCount_151506" class="num_recomm">0</span>
                                    <a href="" class="btn_cmt btn_reply">댓글</a>
                                    <a href="https://article.report.game.daum.net/popup/report.daum?docurl=http%3A%2F%2Fbbs.pubg.game.daum.net%2Fgaia%2Fdo%2Fpubg%2Ffree%2Fread%3FbbsId%3DPC002%26articleId%3D110564%26commentId%3D151506&amp;commentId=151506&amp;cPageIndex=1" class="btn_cmt btn_report">신고</a>
                                </span>
                            </p>
                        </div>
                    </div>
                    <div id="commentReplyForm_151506" class="cmt_reply " data-comment-id="151506" style="display:none">
                        <form action="commentReply" method="post" class="comment_form">
                            <fieldset class="fld_reply">
                                <legend class="screen_out">댓글에 대한 답글 작성 양식</legend>
                                <label for="commentReply_151506" class="screen_out">댓글 작성</label>
                                <textarea id="commentReply_151506" name="commentContent" class="tf_cmt" title="답글입력"></textarea>
                                <div class="desc_reply">로그인 후 이용하실 수 있습니다.</div>
                                <div class="reply_opt">
                                    <span class="info_byte">
                                        <span class="screen_out">입력된 바이트 수 : </span>
                                        <span class="emph_g2" id="commentReply_limit_151506">0</span> / 600 bytes
                                    </span>
                                    <button type="submit" class="btn_cmt btn_register">등록</button>
                                    <button type="button" class="btn_cmt btn_cancel">취소</button>
                                </div>
                            </fieldset>
                            <input type="hidden" name="id" value="151506">
                            <input type="hidden" name="bbsId" value="PC002">
                            <input type="hidden" name="articleId" value="110564">
                            <input type="hidden" name="templatePath" value="/pubg/comment_list/content.htmp">
                            <input type="hidden" name="commentToken" value="yhG59nOdNLzl9Q-CHKLB1A00">
                        </form>
                    </div>
                    <div class="cmt_cont " data-enc-comment-id="eK5AYMkiuiU0">
                        <div class="cont_user">
                            <a href="#" class="user_name" data-rank-id="13647774">
                                <span class="ico_board_tier diamond3"></span>
                                <span class="txt_writer"> RV_Vinny
                                </span>
                            </a>
                        </div>
                        <div class="cont_cmt">
                            <p class="txt_desc">
                                이거 보내주면 32점 돌려줍니까
                                <span class="info_opt">
                                    <span class="txt_date"> 20.10.17
                                    </span>
                                    <a href="commentRecommend?type=R&amp;templatePath=/content.htmp&amp;articleId=110564&amp;bbsId=PC002&amp;templatePath=%2Fpubg%2Fcomment_list%2Fcontent.htmp&amp;commentId=151442" class="btn_recomm img_board">추천</a>
                                    <span id="gaia_recommendCount_151442" class="num_recomm">0</span>
                                    <a href="" class="btn_cmt btn_reply">댓글</a>
                                    <a href="https://article.report.game.daum.net/popup/report.daum?docurl=http%3A%2F%2Fbbs.pubg.game.daum.net%2Fgaia%2Fdo%2Fpubg%2Ffree%2Fread%3FbbsId%3DPC002%26articleId%3D110564%26commentId%3D151442&amp;commentId=151442&amp;cPageIndex=1" class="btn_cmt btn_report">신고</a>
                                </span>
                            </p>
                        </div>
                    </div>
                    <div id="commentReplyForm_151442" class="cmt_reply " data-comment-id="151442" style="display:none">
                        <form action="commentReply" method="post" class="comment_form">
                            <fieldset class="fld_reply">
                                <legend class="screen_out">댓글에 대한 답글 작성 양식</legend>
                                <label for="commentReply_151442" class="screen_out">댓글 작성</label>
                                <textarea id="commentReply_151442" name="commentContent" class="tf_cmt" title="답글입력"></textarea>
                                <div class="desc_reply">로그인 후 이용하실 수 있습니다.</div>
                                <div class="reply_opt">
                                    <span class="info_byte">
                                        <span class="screen_out">입력된 바이트 수 : </span>
                                        <span class="emph_g2" id="commentReply_limit_151442">0</span> / 600 bytes
                                    </span>
                                    <button type="submit" class="btn_cmt btn_register">등록</button>
                                    <button type="button" class="btn_cmt btn_cancel">취소</button>
                                </div>
                            </fieldset>
                            <input type="hidden" name="id" value="151442">
                            <input type="hidden" name="bbsId" value="PC002">
                            <input type="hidden" name="articleId" value="110564">
                            <input type="hidden" name="templatePath" value="/pubg/comment_list/content.htmp">
                            <input type="hidden" name="commentToken" value="yhG59nOdNLzl9Q-CHKLB1A00">
                        </form>
                    </div>
                    <div class="cmt_cont cmt_depth2" data-enc-comment-id="BomAw9VChrs0">
                        <div class="cont_user">
                            <span class="ico_comm ico_reply"></span>
                            <a href="#" class="user_name" data-rank-id="18659412">
                                <span class="ico_board_tier diamond1"></span>
                                <span class="txt_writer"> Cyn_Fix
                                </span>
                            </a>
                        </div>
                        <div class="cont_cmt">
                            <p class="txt_desc">
                                40점 떨어졌다 ㅅㅂ
                                <span class="info_opt">
                                    <span class="txt_date"> 20.10.19
                                    </span>
                                    <a href="https://article.report.game.daum.net/popup/report.daum?docurl=http%3A%2F%2Fbbs.pubg.game.daum.net%2Fgaia%2Fdo%2Fpubg%2Ffree%2Fread%3FbbsId%3DPC002%26articleId%3D110564%26commentId%3D151573&amp;commentId=151573&amp;cPageIndex=1" class="btn_cmt btn_report">신고</a>
                                </span>
                            </p>
                        </div>
                    </div>
                    <div id="commentReplyForm_151573" class="cmt_reply cmt_depth2" data-comment-id="151573" style="display:none">
                        <form action="commentReply" method="post" class="comment_form">
                            <fieldset class="fld_reply">
                                <legend class="screen_out">댓글에 대한 답글 작성 양식</legend>
                                <label for="commentReply_151573" class="screen_out">댓글 작성</label>
                                <textarea id="commentReply_151573" name="commentContent" class="tf_cmt" title="답글입력"></textarea>
                                <div class="desc_reply">로그인 후 이용하실 수 있습니다.</div>
                                <div class="reply_opt">
                                    <span class="info_byte">
                                        <span class="screen_out">입력된 바이트 수 : </span>
                                        <span class="emph_g2" id="commentReply_limit_151573">0</span> / 600 bytes
                                    </span>
                                    <button type="submit" class="btn_cmt btn_register">등록</button>
                                    <button type="button" class="btn_cmt btn_cancel">취소</button>
                                </div>
                            </fieldset>
                            <input type="hidden" name="id" value="151573">
                            <input type="hidden" name="bbsId" value="PC002">
                            <input type="hidden" name="articleId" value="110564">
                            <input type="hidden" name="templatePath" value="/pubg/comment_list/content.htmp">
                            <input type="hidden" name="commentToken" value="yhG59nOdNLzl9Q-CHKLB1A00">
                        </form>
                    </div>
                    <div class="cmt_cont " data-enc-comment-id="AMgekN_5oCY0">
                        <div class="cont_user">
                            <a href="#" class="user_name" data-rank-id="20866766">
                                <span class="ico_board_tier "></span>
                                <span class="txt_writer"> KitnG-
                                </span>
                            </a>
                        </div>
                        <div class="cont_cmt">
                            <p class="txt_desc">
                                아니 이문제는 하루이틀도 아니고 얘들 뭐 고등학교 동아리실에서 게임만든것도 아니고 수준왜이래
                                <span class="info_opt">
                                    <span class="txt_date"> 20.10.17
                                    </span>
                                    <a href="commentRecommend?type=R&amp;templatePath=/content.htmp&amp;articleId=110564&amp;bbsId=PC002&amp;templatePath=%2Fpubg%2Fcomment_list%2Fcontent.htmp&amp;commentId=151421" class="btn_recomm img_board">추천</a>
                                    <span id="gaia_recommendCount_151421" class="num_recomm">0</span>
                                    <a href="" class="btn_cmt btn_reply">댓글</a>
                                    <a href="https://article.report.game.daum.net/popup/report.daum?docurl=http%3A%2F%2Fbbs.pubg.game.daum.net%2Fgaia%2Fdo%2Fpubg%2Ffree%2Fread%3FbbsId%3DPC002%26articleId%3D110564%26commentId%3D151421&amp;commentId=151421&amp;cPageIndex=1" class="btn_cmt btn_report">신고</a>
                                </span>
                            </p>
                        </div>
                    </div>
                    <div id="commentReplyForm_151421" class="cmt_reply " data-comment-id="151421" style="display:none">
                        <form action="commentReply" method="post" class="comment_form">
                            <fieldset class="fld_reply">
                                <legend class="screen_out">댓글에 대한 답글 작성 양식</legend>
                                <label for="commentReply_151421" class="screen_out">댓글 작성</label>
                                <textarea id="commentReply_151421" name="commentContent" class="tf_cmt" title="답글입력"></textarea>
                                <div class="desc_reply">로그인 후 이용하실 수 있습니다.</div>
                                <div class="reply_opt">
                                    <span class="info_byte">
                                        <span class="screen_out">입력된 바이트 수 : </span>
                                        <span class="emph_g2" id="commentReply_limit_151421">0</span> / 600 bytes
                                    </span>
                                    <button type="submit" class="btn_cmt btn_register">등록</button>
                                    <button type="button" class="btn_cmt btn_cancel">취소</button>
                                </div>
                            </fieldset>
                            <input type="hidden" name="id" value="151421">
                            <input type="hidden" name="bbsId" value="PC002">
                            <input type="hidden" name="articleId" value="110564">
                            <input type="hidden" name="templatePath" value="/pubg/comment_list/content.htmp">
                            <input type="hidden" name="commentToken" value="yhG59nOdNLzl9Q-CHKLB1A00">
                        </form>
                    </div>
                    <div class="cmt_cont " data-enc-comment-id="L-zOu5ZTaNU0">
                        <div class="cont_user">
                            <a href="#" class="user_name" data-rank-id="19584261">
                                <span class="ico_board_tier silver4"></span>
                                <span class="txt_writer"> Han_yeol_93
                                </span>
                            </a>
                        </div>
                        <div class="cont_cmt">
                            <p class="txt_desc">
                                야 펍지 대변인 답글 달아라 이따구로 관리할꺼냐고 내가 질문했다
                                <span class="info_opt">
                                    <span class="txt_date"> 20.10.17
                                    </span>
                                    <a href="commentRecommend?type=R&amp;templatePath=/content.htmp&amp;articleId=110564&amp;bbsId=PC002&amp;templatePath=%2Fpubg%2Fcomment_list%2Fcontent.htmp&amp;commentId=151408" class="btn_recomm img_board">추천</a>
                                    <span id="gaia_recommendCount_151408" class="num_recomm">0</span>
                                    <a href="" class="btn_cmt btn_reply">댓글</a>
                                    <a href="https://article.report.game.daum.net/popup/report.daum?docurl=http%3A%2F%2Fbbs.pubg.game.daum.net%2Fgaia%2Fdo%2Fpubg%2Ffree%2Fread%3FbbsId%3DPC002%26articleId%3D110564%26commentId%3D151408&amp;commentId=151408&amp;cPageIndex=1" class="btn_cmt btn_report">신고</a>
                                </span>
                            </p>
                        </div>
                    </div>
                    <div id="commentReplyForm_151408" class="cmt_reply " data-comment-id="151408" style="display:none">
                        <form action="commentReply" method="post" class="comment_form">
                            <fieldset class="fld_reply">
                                <legend class="screen_out">댓글에 대한 답글 작성 양식</legend>
                                <label for="commentReply_151408" class="screen_out">댓글 작성</label>
                                <textarea id="commentReply_151408" name="commentContent" class="tf_cmt" title="답글입력"></textarea>
                                <div class="desc_reply">로그인 후 이용하실 수 있습니다.</div>
                                <div class="reply_opt">
                                    <span class="info_byte">
                                        <span class="screen_out">입력된 바이트 수 : </span>
                                        <span class="emph_g2" id="commentReply_limit_151408">0</span> / 600 bytes
                                    </span>
                                    <button type="submit" class="btn_cmt btn_register">등록</button>
                                    <button type="button" class="btn_cmt btn_cancel">취소</button>
                                </div>
                            </fieldset>
                            <input type="hidden" name="id" value="151408">
                            <input type="hidden" name="bbsId" value="PC002">
                            <input type="hidden" name="articleId" value="110564">
                            <input type="hidden" name="templatePath" value="/pubg/comment_list/content.htmp">
                            <input type="hidden" name="commentToken" value="yhG59nOdNLzl9Q-CHKLB1A00">
                        </form>
                    </div>
                    <div class="cmt_cont " data-enc-comment-id="L-zOu5ZTaNU0">
                        <div class="cont_user">
                            <a href="#" class="user_name" data-rank-id="19584261">
                                <span class="ico_board_tier silver4"></span>
                                <span class="txt_writer"> Han_yeol_93
                                </span>
                            </a>
                        </div>
                        <div class="cont_cmt">
                            <p class="txt_desc">
                                야 이따구로 관리할꺼가 ? 나는 상관없다만 티어 높은사람들은 민감한건데
                                <span class="info_opt">
                                    <span class="txt_date"> 20.10.17
                                    </span>
                                    <a href="commentRecommend?type=R&amp;templatePath=/content.htmp&amp;articleId=110564&amp;bbsId=PC002&amp;templatePath=%2Fpubg%2Fcomment_list%2Fcontent.htmp&amp;commentId=151407" class="btn_recomm img_board">추천</a>
                                    <span id="gaia_recommendCount_151407" class="num_recomm">0</span>
                                    <a href="" class="btn_cmt btn_reply">댓글</a>
                                    <a href="https://article.report.game.daum.net/popup/report.daum?docurl=http%3A%2F%2Fbbs.pubg.game.daum.net%2Fgaia%2Fdo%2Fpubg%2Ffree%2Fread%3FbbsId%3DPC002%26articleId%3D110564%26commentId%3D151407&amp;commentId=151407&amp;cPageIndex=1" class="btn_cmt btn_report">신고</a>
                                </span>
                            </p>
                        </div>
                    </div>
                    <div id="commentReplyForm_151407" class="cmt_reply " data-comment-id="151407" style="display:none">
                        <form action="commentReply" method="post" class="comment_form">
                            <fieldset class="fld_reply">
                                <legend class="screen_out">댓글에 대한 답글 작성 양식</legend>
                                <label for="commentReply_151407" class="screen_out">댓글 작성</label>
                                <textarea id="commentReply_151407" name="commentContent" class="tf_cmt" title="답글입력"></textarea>
                                <div class="desc_reply">로그인 후 이용하실 수 있습니다.</div>
                                <div class="reply_opt">
                                    <span class="info_byte">
                                        <span class="screen_out">입력된 바이트 수 : </span>
                                        <span class="emph_g2" id="commentReply_limit_151407">0</span> / 600 bytes
                                    </span>
                                    <button type="submit" class="btn_cmt btn_register">등록</button>
                                    <button type="button" class="btn_cmt btn_cancel">취소</button>
                                </div>
                            </fieldset>
                            <input type="hidden" name="id" value="151407">
                            <input type="hidden" name="bbsId" value="PC002">
                            <input type="hidden" name="articleId" value="110564">
                            <input type="hidden" name="templatePath" value="/pubg/comment_list/content.htmp">
                            <input type="hidden" name="commentToken" value="yhG59nOdNLzl9Q-CHKLB1A00">
                        </form>
                    </div>
                </div>
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