<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link href="/CSS/base.css" rel="stylesheet">
</head>
<body> 

  <jsp:include page="/WEB-INF/menu.jsp"/>

<div id='page-wrapper'>
    <div id='page-inner'>
      <div class='row'><div class='col-md-12'><h1 class='page-header'>창고설정관리 <small>storehouse</small></h1></div></div>
    <div class='row'><div class='col-lg-12'><ol class='breadcrumb'><li><a href="../index.jsp">홈</a></li><b>&ensp;/&ensp;</b><li class='active'>창고설정관리</li></ol></div></div>
          
        <form name='form' method='post'action='sh_writeAction.jsp' action="return check(this)">

          <div class='col-lg-12 text-center'><span class='st'>*</span><label>창고번호</label></div>
            <div class='col-lg-12 text-center'>
              <input type='text' name="shnum" maxlength='10' size='10' style='background-color:#FFE2D5;'>
              <p class='help-block'></p>
            </div>

            <div class='col-lg-12 text-center'><label>표시순서</label></div>
            <div class='col-lg-12 text-center'>
              <input type='text' name="num" maxlength='10' size='10' style='background-color:#FFE2D5;' readonly value="">
              <p class='help-block'></p>
            </div>
       
            <div class='col-lg-12 text-center'><span class='st'>*</span><label>창고이름</label></div>
            <div class='col-lg-12 text-center'>
              <input type='text' name="shname" maxlength='10' size='10' style='background-color:#FFE2D5;'>
              <p class='help-block'></p>
            </div>

            <div class='col-lg-12 text-center'><label>상세정보</label></div>
            <div class='col-lg-12 text-center'>
              <input type='text' name="detail" maxlength='30' size='30' style='background-color:#FFE2D5;'>
              <p class='help-block'></p>
            </div>

          <div class='col-lg-12 text-center'><label>특이사항</label></div>
    
          <div class='text-center'>
            <textarea rows='5' cols='99' name='etc' placeholder='특이사항'></textarea>
            <p class='help-block'></p>
          </div>
 
          <div class='col-lg-12 text-center'>
            <button type='submit' class='btn btn-success'>등록</button>
            <button type='button' class='btn btn-default' onClick="location.href='storehouse.jsp'">목록</button>
          </div>

        </form>
      </div>
    </div>
  </body>
  </html>