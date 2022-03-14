<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="/CSS/base.css" rel="stylesheet">
</head>
<body> 

  <jsp:include page="/WEB-INF/menu.jsp"/>

<div id='page-wrapper'>
    <div id='page-inner'>
      <div class='col-md-12'><h1 class='page-header'>분류설정관리 <small>codelist</small></h1></div>
        <div class='col-lg-12'><ol class='breadcrumb'><li><a href="../index.jsp">홈</a></li><b>&ensp;/&ensp;</b><li class='active'>분류설정관리</li></ol></div>
          
        <form name='form' method='post'action='list_writeAction.jsp' action="return check(this)">
        <div class='col-lg-12 text-center'><span class='st'>*</span><label>분류코드#1:</label></div>
          <div class='col-lg-12 text-center'>
            <input type='text' name="m1" maxlength='10' size='10' style='background-color:#FFE2D5;'>
            <p class='help-block'></p>
          </div>
  
        <div class='col-lg-12 text-center'><span class='st'></span><label>분류코드#2:</label></div>
          <div class='col-lg-12 text-center'>
            <input type='text' name="m2" maxlength='10' size='10' style='background-color:#FFE2D5;'>
            <p class='help-block'></p>
          </div>

        <div class='col-lg-12 text-center'><span class='st'>*</span><label>분류코드#3:</label></div>
          <div class='col-lg-12 text-center'>
            <input type='text' name="m3" maxlength='10' size='10' style='background-color:#FFE2D5;'>
            <p class='help-block'></p>
          </div>

        <div class='col-lg-12 text-center'><span class='st'>*</span><label>분류코드#4:</label></div>
          <div class='col-lg-12 text-center'>
            <input type='text' name="m4" maxlength='10' size='10' style='background-color:#FFE2D5;'>
            <p class='help-block'></p>
          </div>

        <div class='col-lg-12 text-center'><span class='st'>*</span><label>분류코드#5:</label></div>
          <div class='col-lg-12 text-center'>
            <input type='text' name="m5" maxlength='10' size='10' style='background-color:#FFE2D5;'>
            <p class='help-block'></p>
          </div>
        
        <div class='col-lg-12 text-center'><span class='st'>*</span><label>제목:</label></div>
          <div class='col-lg-12 text-center'>
            <input type='text' name='title'maxlength='100' size='100' style='background-color:#FFE2D5;'>
            <p class='help-block'></p>
          </div>
      
        <div class='col-lg-12 text-center'><span class='st'>*</span><label>작성자:</label></div>
          <div class='col-lg-12 text-center'>
            <input type='text' name='user' maxlength='10' size='10' style='background-color:#FFE2D5;'>
            <p class='help-block'></p>
          </div>
       
        <div class='col-lg-12 text-center'><label>특이사항:</label></div>
          <div class='col-lg-12 text-center'>
            <textarea rows='5' cols='99' name='etc' placeholder='특이사항'></textarea>
            <p class='help-block'></p>
          </div>
        
        <div class='row'>
          <div class='col-lg-12 text-center'>
            <button type='submit' class='btn btn-success'>등록</button>
            <button type='button' class='btn btn-default' onClick="location.href='list.jsp'">목록</button>
          </div>
        </div>
        </form>
      </div>
    </div>
  </body>
  </html>