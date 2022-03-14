<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../dbCon.jsp" %>
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

    <%
    String num = request.getParameter("num");



    try{

      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
      
      String sql="select * from storehouse where num = " + num;
      
      //out.print(sql);


      pstmt = conn.prepareStatement(sql);
        
      rs = pstmt.executeQuery();
      

    if(rs.next()){
       
%>
          
        <form name='form' method='post'action='sh_updateAction.jsp' action="return check(this)">

          <div class='col-lg-12 text-center'><span class='st'>*</span><label>창고번호</label></div>
            <div class='col-lg-12 text-center'>
              <input type='text' name="shnum" maxlength='10' size='10' style='background-color:#FFE2D5;' readonly value="<%=rs.getString("shnum")%>">
              <p class='help-block'></p>
            </div>

            <div class='col-lg-12 text-center'><span class='st'>*</span><label>표시순서</label></div>
            <div class='col-lg-12 text-center'>
              <input type='text' name="num" maxlength='10' size='10' style='background-color:#FFE2D5;' readonly value="<%=rs.getString("num")%>">
              <p class='help-block'></p>
            </div>
       
            <div class='col-lg-12 text-center'><span class='st'></span><label>창고이름</label></div>
            <div class='col-lg-12 text-center'>
              <input type='text' name="shname" maxlength='10' size='10' style='background-color:#FFE2D5;'value="<%=rs.getString("shname")%>">
              <p class='help-block'></p>
            </div>

            <div class='col-lg-12 text-center'><span class='st'></span><label>상세정보</label></div>
            <div class='col-lg-12 text-center'>
              <input type='text' name="detail" maxlength='10' size='10' style='background-color:#FFE2D5;'value="<%=rs.getString("detail")%>">
              <p class='help-block'></p>
            </div>

          <div class='col-lg-12 text-center'><label>특이사항</label></div>
    
          <div class='text-center'>
            <textarea rows='5' cols='99' name='etc' placeholder='특이사항'value="<%=rs.getString("etc")%>"></textarea>
            <p class='help-block'></p>
          </div>
    
       
 
          <div class='col-lg-12 text-center'>
            <button type='submit' class='btn btn-success'>등록</button>
            <button type='button' class='btn btn-default' onClick="location.href='storehouse.jsp'">목록</button>
    <%
            rs.close();
      }

      pstmt.close();
      conn.close();
    } catch(SQLException e) {
        out.println("DB에러"+e.toString());
    }
        %>
        
          </div>

        </form>
      </div>
    </div>
  </body>
  </html>