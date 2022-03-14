<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
   <title>HOME</title>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
  <link rel="stylesheet" href="CSS/base.css">
  </head>

  <body>

    <jsp:include page="/WEB-INF/menu.jsp"/>

<!-- Header -->
<header class="w3-container w3-theme w3-padding" id="myHeader">
  <i onclick="w3_open()" class="fa fa-bars w3-xlarge w3-button w3-theme"></i> 
  <div class="w3-center">
  <h4>환영합니다.</h4>
  <h1 class="w3-xxxlarge w3-animate-bottom">Ezen 3 Team 입니다.</h1>
    <div class="w3-padding-32">
      <button class="w3-btn w3-xlarge w3-dark-grey w3-hover-light-grey" onclick="document.getElementById('login').style.display='block'" style="font-weight:900;">Login</button>
    </div>
  </div>
</header>

<!--login-->
<div id="login" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-top">
      <header class="w3-container w3-theme-l1"> 
        <span onclick="document.getElementById('login').style.display='none'" class="w3-button w3-display-topright"><a href="index.jsp">×</a></span>
        <h3>로그인</h3>
      </header>
      <div class="w3-padding">
        <form action="login_action.jsp" name ="login" method="post">
		<table>
    		<tr>
    			<td>아이디</td> 
    			<td><input type="text" name="id" maxlength="20" value=qwert></td>
    		</tr>
    		<tr>
    			<td>비밀번호</td> 
    			<td><input type="password" name="pw"  maxlength="20" value=1111></td>
    		</tr>
    	</table>
		<br>
		<input type="submit" value="로그인"> <input type="button" value="cancel" onclick="location.href='index.jsp'">
		</form>
      </div>
    </div>
</div>

<!--main-->
<div class="w3-row-padding w3-center w3-margin-top">
    <div class="w3-third">
      <div class="w3-card w3-container" style="min-height:460px">
        <br>
      <h3>자재관리</h3><br>
      <i class="fa fa-desktop w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
        <ui>
            <li><a href="./stock/bom.jsp">BOM 관리</a></li>
            <li><a href="./stock/inandout.jsp">자재 입/출고 관리</a></li>
            <li><a href="./stock/etcout.jsp">자재 기타출고</a></li>
            <li><a href="./stock/order.jsp">자재 발주 확인관리</a></li>
            <li><a href="./stock/failure.jsp">자재 불량처리 관리</a></li>
            <li><a href="./stock/return.jsp">자재 반납 관리</a></li>
        </ui>
        <br>
        <br>
      <h3>생산관리</h3><br>
      <i class="fa fa-desktop w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
        <ui>
            <li><a href="./pdmanager/total_monitoring.jsp">통합 모니터링</a></li>
            <li><a href="./SHH/shh.jsp">제품별 생산관리</a></li>
            <li><a href="./pcmanager/process.jsp">공정별 생산관리</a></li>
            <li><a href="./linemanager/line.jsp">라인별 생산관리</a></li>
        </ui>
      </div>
    </div>
    
    <div class="w3-third">
      <div class="w3-card w3-container" style="min-height:460px">
        <br>
      <h3>상품관리</h3><br>
      <i class="fa fa-css3 w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
        <ui>
            <li>고객사 주문 리스트</li>
            <li>상품 등록</li>
            <li>판매 제품 리스트</li>
            <li>제품 출고 목록(예정/완료)</li>
        </ui>
        <br>
        <br>

      <h3>설정관리</h3>
          <ui>
            <li><a href="./lim/list.jsp">분류설정관리</a></li>
            <li>QR코드설정관리</li>
            <li>QR코드엑셀관리</li>
            <li>품목연계QR코드설정관리</li>
            <li><a href="./lim/status.jsp">상태설정관리</a></li>
            <li><a href="./lim/department.jsp">부서설정관리</a></li>
            <li><a href="./lim/storehouse.jsp">창고설정관리</a></li>
          </ui>
      </div>
    </div>
    
    <div class="w3-third">
      <div class="w3-card w3-container" style="min-height:460px">
        <br>
      <h3>매입/매출관리</h3><br>
      <i class="fa fa-diamond w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
        <ui>
            <li>월간 매입현황</li>
            <li>월간 매출현황</li>
            <li>수익 현황/예측</li>
        </ui>

        <br>
        <br>

      <h3>회원/등록관리</h3><br>
      <i class="fa fa-diamond w3-margin-bottom w3-text-theme" style="font-size:120px"></i>
        <ui>
         
            <li><a href="./member/manager.jsp">관리자 메인 페이지</a></li>
            <li><a href="./member/member_register.jsp">회원 등록하기</a></li>
            <li><a href="./member_grade.jsp">회원 등급관리</a></li>
            <li><a href="./member/board.jsp">게시판 분류 관리</a></li>
        </ui>
   





    </div>
    
    <br>
    <br>

    </body>
    </html>