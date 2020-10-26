<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
<div class="row">
<c:forEach var="vo" items="${list }"> 
        <div class="col-sm-6 col-lg-6 mb-4 mb-lg-0" style="margin-bottom: 10px !important; display: flex;" >
            <div class="categories_post" style="display: flex; align-items: center;">
            
                   	<img class="card-img rounded-0" style="align-items: center;"  src="${vo.list_poster }" alt="">
                
                <div class="categories_details" style="background: rgba(34, 34, 34, 0.3);">
                    <div class="categories_text">
                        <a href="../game/detail.do?game_no=${vo.game_no}">
                            <h5 style="font-weight: 800" >

						     <c:choose>
					           <c:when test="${fn:length(vo.name) > 30}">
					            <c:out value="${fn:substring(vo.name,0,29)}"/>....
					           </c:when>
					           <c:otherwise>
					            <c:out value="${vo.name}"/>

					           </c:otherwise> 
					          </c:choose>

							</h5>
                        </a>
                        <div class="border_line"></div>
                        <c:forTokens var="tag" items="${vo.tag }" delims="," begin="0" end="2">
               							${tag } 
         				</c:forTokens>
										
						<c:choose>
					         <c:when test = "${vo.price== 0}">
					            	<h6 style="color: white">
       								무료
									</h6>
					         </c:when>
					         <c:when test = "${vo.price != 0}">
						            <h6 style="color: white">
       								<fmt:formatNumber value="${vo.price }" pattern="#,###"/> ₩
									</h6>
					         </c:when>
					    </c:choose>
								    
                    </div>
                </div>
            </div>
        </div>
   </c:forEach> 				        
</div>






          
</body>
</html>