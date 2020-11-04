<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<section class="cart_area">
      <div class="container">
          <div class="cart_inner">
          
          <input type="button" class="btn btn-sm btn-primary" id="allBtn"
    		value="게임 목록"/>&nbsp;&nbsp;
    		<input type="button" class="btn btn-sm btn-primary" id="allBtn"
    		value="컴퓨터 목록"/>
    		
              <div class="table-responsive">
                  <table class="table">
                      <thead>

                          <tr>
                              <th scope="col">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              		제품</th>
                              <th scope="col"></th>
                              <th scope="col"></th>
                              <th scope="col">가격</th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr>
                              <td>
                                  <div class="media">
                                      <div class="d-flex">
                                      <input type="checkbox" value="${vo.no }" class="cb" name=cb>
                                          <img src="${vo.poster }" alt="">
                                      </div>
                                      <div class="media-body">
                                          <p> GAME_NAME / COMPUTER_NAME</p>
                                      </div>
                                  </div>
                              </td>
                              <td>
                                 
                              </td>
                              <td>
                                  <div class="product_count">
                                  
                                      
                                  </div>
                              </td>
                              <td>
                                  <h5>$720.00</h5>
                              </td>
                          </tr>

                          <tr>
                              <td>

                              </td>
                              <td>

                              </td>
                              <td>
                                  <h5>총가격</h5>
                              </td>
                              <td>
                                  <h5>$2160.00</h5>
                              </td>
                          </tr>
                          
                          
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
  </section>
  <!--================End Cart Area =================-->


</body>
</html>