<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>
<%@ include file="function.jsp" %>


  <!DOCTYPE html>
  <html lang="UTF-8"> 
  <head> 
    <title>Bootstrap navibar</title> 
    <meta charset="UTF-8"> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"> 
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  </head> 

  <body> 
  <!--상단바 메뉴 -->
  <nav class="navbar navbar-expand-sm bg-dark">
    <div class="container-fluid">
      
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="/Ezen1Team/index.jsp" style="color:whitesmoke " ><b>A공장 관리시스템</b></a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" data-bs-toggle="offcanvas" data-bs-target="#demo" style="color:gold" href="./manager_index.jsp">관리자 메뉴</a>

        </li>
    
        <li class="nav-item">
          <a class="nav-link" data-bs-toggle="offcanvas" data-bs-target="#demo" style="color:gold" 
          href="./manager.jsp">관리자 홈</a>

        </li>
      

        <li class="nav-item">
          <a class="nav-link" href="#" style="color:gold" >환경설정</a>

        </li>
      </ul>

    </div>
  </nav>


  
    <meta name="viewport" >
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
   
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  



  <!--사이드바 메뉴 -->
  <div class="offcanvas offcanvas-start" id="demo">
  <div class="offcanvas-header">

  <h4 class="offcanvas-title">관리자 메뉴</h4>
      
  <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
  </div>
    <div class="accordion accordion-flush" id="accordionFlushExample"></div>
    <div class="accordion-item"></div>
    <!--div 공간 분리를 정확히 하지 않으면 사이드 메뉴바에 메인 내용이 합쳐짐-->

    <h2 class="accordion-header" id="flush-headingOne">
    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
    목록</button>
    </h2>
        
    <div id="flush-collapseOne" class="accordion-collapse collapse show" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
    <ul class="list-group">
              <ul> <a href="./manager.jsp"> 관리자 메인 페이지 </a></ul>
              <ul> <a href="./cmes_setup.jsp"> 기본 설정 관리</a></ul>
              <ul> <a href="./cmes_reset.jsp"> 설정 초기화 관리</a></ul>
              <ul> <a href="./log_delete.jsp"> 로그 기록 삭제 관리</a></ul>
              <ul> <a href="./member_register.jsp"> 회원 등록하기 </a></ul>
              <ul> <a href="./member_list.jsp"> 회원 관리 리스트</a></ul>
              <ul> <a href="./member_grade.jsp"> 회원 등급 관리</a></ul>
              <ul> <a href="./emp_manage"> 직원 관리</a></ul>
              <ul> <a href="./board_manage.jsp"> 게시판 분류 관리</a></ul>

          </ul>
        </div>
      </div>
   
  </body> 
  </html>
  
  