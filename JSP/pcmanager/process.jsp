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
<h2 class="text" style="text-indent: 30px;" ><b> 공정별 생산</b></h2>

<!--조회 폼-->
<nav class="navbar navbar-expand-md" style=" background-color:lightgray">
  <form method ="get" name="findproduct" action="inandout.jsp" style="text-indent: 30px;" > 

      
  <ul class="nav navbar-nav navbar-right">
    <button class="btn btn-primary" type="button" onclick="addin();">발주서</button>&emsp;
    
  </ul>
  <br class="nav navbar-nav navbar-right">
    <button class="btn btn-primary" type="button" onclick="openChild();">공정별 생산현황</button>&emsp;
    
  <br><br>
</nav>
  <br>
  
  <!--조회 결과창-->
  <div class="container">
    <div class="row">
      <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">   
        <thead>
          <tr>    
            <th style="background-color: #eeeeee; text-align: center;">제품명</th>
            <th style="background-color: #eeeeee; text-align: center;">제작기간</th>
            <th style="background-color: #eeeeee; text-align: center;">발주량</th>
            <th style="background-color: #eeeeee; text-align: center;">공정번호</th>
          </tr>
        </thead> 
  
        
        <%
        int serial=1;
  
       // while(rs.next()){
  
        //PDcode>> 삭제,수정할 때 값 넘기기위해 선언된 변수
       
        %> 
  
        <thead>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
              
        </thead>
        <% //} %>
   
      </table>
    </div>
  </div>
</body>
</html>