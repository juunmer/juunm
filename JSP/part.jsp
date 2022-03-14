<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>

    <jsp:include page="/WEB-INF/menu.jsp"/>
    <h2 class="text" style="text-indent: 30px;" ><b>입/출고 현황</b></h2>
  
    <nav class="navbar navbar-expand-md" style=" background-color:lightgray">
         
        <form method ="get" name="part" action="partlist.jsp" style="text-indent: 30px;" >
          
          <!--날짜-->
          <label for="Mname" ></label>조회 날짜: </label>
          <input type="date" id="date-start" name="date-start">
          <b>~</b>
          <input type="date" id="date-end" name="date-end">  &emsp;  
          
          <!--키워드-->
          <label for="Mname" ></label>조회 키워드: </label>
          <input type="text" id="keyword" name="keyword" size = 20px placeholder="키워드 입력" >
          &emsp; <!--이거 띄어쓰기-->
          
          <!--담당자 근데 이건 사원리스트에서 불러오는 식으로 해도 될듯...?-->
          <label for="Mname" ></label>담당자 : </label>
          <input type="text" id="emp" name="emp" size = 20px placeholder="사원 입력/선택?" >
  
          <br> &emsp;
          <!--유형-->
          <label for="Mname" ></label>유형 : </label>
          <select name="Type" style="width:110px";>
            <option value=""> 유형 선택</option>
            <option value="1">일반 제품</option>
            <option value="2">외주 제품</option>
            <option value="3">부품</option>
            <option value="1">비품</option>
            <option value="2">테스트</option>
            <option value="3">장비/기자재</option>
          </select>&emsp; &emsp;
  
          
           지급 여부:
           <input type="radio" id="ok" name="hobby" value="study">지급   
           <input type="radio" id="game" name="hobby" value="game">미지급
           <input type="radio" id="climb" name="hobby" value="climb">일부 지급
           <input type="radio" id="fish" name="hobby" value="fish">채무
  
          <button class="btn btn-success" style="float:inline-end">조회</button>
        </form>
        </nav>
        <br>
        
        <div style="overflow: scroll; ">
         <table border="1" style="width: 1260px; text-indent: 30px;">
           <tr>
            <td>No.</td>
            <td>Code</td>
            <td>품명</td>
            <td>전재고</td>
            <td>입고량</td>
            <td>출고량</td>
            <td>현재고</td>
            <td>날짜</td>
            <td>상태</td>
         </tr>
         <c:forEach var = "item" items ="${list }">
         <tr>
            <td width="200px">임시</td>
            <td>${item.A }</td>
            <td>${item.B }</td>
            <td>${item.C }</td>
            <td>${item.D }</td>
            <td>${item.E }</td>
            <td>${item.F }</td>
            <td>${item.G }</td>
            <td>${item.I }</td>
         </tr>
         </c:forEach>
         </table>
        </div>

        <nav class="navbar navbar-expand-sm bg-dark" style="position:absolute; bottom:0; width:100%; height:70px;">
          <div class="container-fluid">
            
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="#" style="color:whitesmoke " ><b>아무말..</b></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-bs-toggle="offcanvas" data-bs-target="#demo" style="color:gold"  href="#">아무말2</a>
      
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#" style="color:gold" >환경설정</a>
      
              </li>
            </ul>
      
            <form class="d-flex">
  
              <button class="btn btn-primary" type="button" onclick="addproduct();">추가</button>&emsp;
              <button class="btn btn-primary" type="button">수정</button>&emsp;
              <button class="btn btn-primary" type="button">삭제</button>
            </form>
          </div>    
        </nav>
</body>
</html>