<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>
<%@ include file="javaScript.jsp" %>

<!--참고사이트 http://www.gemmy.org/main -->
<!DOCTYPE html>
<html lang="ko">
<head>
<title>HOME</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/factorystyle.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<script src="./jquery-3.6.0.min.js"></script>
<script type="text/javaScript">

</script>

</head>

<body>
<!-- 상단,사이드 메뉴바 불러오기-->
<jsp:include page="/WEB-INF/menu.jsp"/>

<!--제목-->
<h2 class="text" style="text-indent: 30px;" ><b> 자재 입출고 관리</b></h2>

<!--조회 폼-->
<nav class="navbar navbar-expand-md" style=" background-color:lightgray">
  <form method ="get" name="findproduct" action="inandout.jsp" style="text-indent: 30px;" >
    
    <label for="Mname" ></label>조회 날짜: </label>
    <input type="date" id="date-start" name="date-start">
    <b>~</b>
    <input type="date" id="date-end" name="date-end">  &emsp;  

    <label for="Mname" ></label>분류 : </label>
    <select name="Type" style="width:110px";>
      <option value=""> 분류 선택</option>
      <option value="normal">일반 제품</option>
      <option value="out">외주 제품</option>
      <option value="part">부품</option>
      <option value="Fix">비품</option>
      <option value="test">테스트</option>
      <option value="equip">장비</option>
    </select>&emsp;

    <select name="Type" style="width:110px";>
      <option value="name">규격</option>
      <option value="num">품명</option>
      <option value="num">코드</option>
      <option value="num">창고</option>
    </select>

    <input type="text" id="keyword" name="keyword" size = 20px placeholder="키워드 입력" >&emsp;
    <button class="btn btn-success" style="float:inline-end">조회</button>
  </form>&emsp;&emsp;
      
  <ul class="nav navbar-nav navbar-right">
    <button class="btn btn-primary" type="button" onclick="addin();">입고등록</button>&emsp;
    
  </ul>

</nav>
  <br>
  
  <!--조회 결과창-->
  <div class="container">
    <div class="row">
      <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">   
        <thead>
          <tr>
            <th style="background-color: #eeeeee; text-align: center;">자재번호</th>
            <th style="background-color: #eeeeee; text-align: center;">자재명</th>
            <th style="background-color: #eeeeee; text-align: center;">분류</th>
            <th style="background-color: #eeeeee; text-align: center;">출고량</th>
            <th style="background-color: #eeeeee; text-align: center;">입고량</th>
            <th style="background-color: #eeeeee; text-align: center;">현재고</th>
            <th style="background-color: #eeeeee; text-align: center;">보관창고</th>
            <th style="background-color: #eeeeee; text-align: center;">등록일자</th>
          </tr>
        </thead> 
  
        
        <%
        int serial=1;
  
       // while(rs.next()){
  
        //PDcode>> 삭제,수정할 때 값 넘기기위해 선언된 변수
       
        %> 
  
        <thead>
          <td> 1</td>
          <td>2</td>
          <td>3</td>
              
          <!--bom 정보보는 실행문 + 말풍선 삽입-->
          <td>4
            <div style="font-size: 20px; color:blue; display:inline; cursor: pointer;" onclick="bom_update()" data-bs-toggle="tooltip" title="정보 수정하기">
            <i class="fas fa-info-circle"></i></div>
          
          <!--bom 삭제하는 실행문 + 말풍선 삽입-->
          <div style="font-size: 20px; color:red; display:inline; cursor: pointer; "data-bs-toggle="tooltip"  title="삭제하기" onclick="bom_delete()">
            <i class="far fa-times-circle"></i>
          </div></td>
          <td>5</td>
        </thead>
        <% //} %>
   
      </table>
    </div>
  </div>
</body>
</html>