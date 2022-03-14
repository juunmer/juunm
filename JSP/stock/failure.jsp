
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>


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

    //팝업창 함수 function addproduct(){
		//window.open("./addproduct.jsp", "재고관리 추가", "width=500, height=800, top=150, left=200")
   //}
    </script>
    
</head>

<body>
  <!-- 상단,사이드 메뉴바 불러오기-->
  <jsp:include page="/WEB-INF/menu.jsp"/>

   <!-- 이하 하단내용 작성-->
  <h2 class="text" style="text-indent: 30px;" ><b> 제품 재고 현황</b></h2>
  
  <nav class="navbar navbar-expand-md" style=" background-color:lightgray">
       
      <form method ="get" name="findproduct" action="product_find.jsp" style="text-indent: 30px;" >
        
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
        <label for="Mname" ></label>분류 : </label>
        <select name="Type" style="width:110px";>
          <option value=""> 분류 선택</option>
          <option value="1">일반 제품</option>
          <option value="2">외주 제품</option>
          <option value="3">부품</option>
          <option value="4">비품</option>
          <option value="5">장비/테스트</option>
          <option value="6">기타</option>
        </select>&emsp; &emsp;




        <button class="btn btn-success" style="float:inline-end">조회</button>
      </form>
      </nav>
      <br>
      
      <div style="overflow: scroll; ">
       <table border="1" style="width: 1260px; text-indent: 30px;">
         <tr>
          <td>A</td>
          <td>B</td>
          <td>C</td>
          <td>D</td>
          <td>E</td>
       </tr>
       <c:forEach var = "item" items ="${list }">
       <tr>
          <td width="200px">임시</td>
          <td>${item.A }</td>
          <td>${item.B }</td>
          <td>${item.C }</td>
          <td>${item.D }</td>
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