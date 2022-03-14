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
    <h2 class="text" style="text-indent: 30px;" ><b> 발주 리스트</b></h2>
  
    <nav class="navbar navbar-expand-md" style=" background-color:lightgray">
         
        <form method ="get" name="order" action="orderlist.jsp" style="text-indent: 30px;" >
          
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
            <td>고객사</td>
            <td>수량</td>
            <td>판매가</td>
            <td>주문일자</td>
            <td>주소</td>
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

</body>
</html>