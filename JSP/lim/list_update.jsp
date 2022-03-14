<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<meta name="viewport" content="width=device-width", initial-scale="1">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="/CSS/base.css" rel="stylesheet">
</head>
<body> 

    <jsp:include page="/WEB-INF/menu.jsp"/>

<div id='page-wrapper'>
    <div id='page-inner'>
      <div class='row'><div class='col-md-12'><h1 class='page-header'>분류설정관리 <small>list</small></h1></div></div>
    <div class='row'><div class='col-lg-12'><ol class='breadcrumb'><li><a href="../index.jsp">홈</a></li><b>&ensp;/&ensp;</b><li class='active'><a href="list.jsp">분류설정관리</a></li></ol></div></div>

            <%
            String num = request.getParameter("num");



            try{

              Class.forName("com.mysql.jdbc.Driver");
              conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
              
              String sql="select * from codelist where num = " + num;
              
              //out.print(sql);


              pstmt = conn.prepareStatement(sql);
                
              rs = pstmt.executeQuery();
              

            if(rs.next()){
               
        %>

        <form name='form' method='post'action='list_updateAction.jsp' action="return check(this)">
          
          <input type='hidden' name="num" value=<%=num%>>

        <div class='col-lg-12 text-center'><span class='st'>*</span><label>분류코드#1:</label></div>
        
          <div class='col-lg-12 text-center'>
            <input type='text' name="m1" maxlength='10' size='10' style='background-color:#FFE2D5;' value="<%=rs.getString("m1")%>">
            <p class='help-block'></p>
          </div>
      
        <div class='col-lg-12 text-center'><span class='st'>*</span><label>분류코드#2:</label></div>
        
          <div class='col-lg-12 text-center'>
            <input type='text' name="m2" maxlength='10' size='10' style='background-color:#FFE2D5;' value="<%=rs.getString("m2")%>">
            <p class='help-block'></p>
          </div>
      
        <div class='col-lg-12 text-center'><span class='st'>*</span><label>분류코드#3:</label></div>
        
          <div class='col-lg-12 text-center'>
            <input type='text' name="m3" maxlength='10' size='10' style='background-color:#FFE2D5;' value="<%=rs.getString("m3")%>">
            <p class='help-block'></p>
          </div>
       
        <div class='col-lg-12 text-center'><span class='st'>*</span><label>분류코드#4:</label></div>
       
          <div class='col-lg-12 text-center'>
            <input type='text' name="m4" maxlength='10' size='10' style='background-color:#FFE2D5;' value="<%=rs.getString("m4")%>">
            <p class='help-block'></p>
          </div>
       
        <div class='col-lg-12 text-center'><span class='st'>*</span><label>분류코드#5:</label></div>
     
          <div class='col-lg-12 text-center'>
            <input type='text' name="m5" maxlength='10' size='10' style='background-color:#FFE2D5;' value="<%=rs.getString("m5")%>">
            <p class='help-block'></p>
          </div>
      
   <div class='col-lg-12 text-center'><span class='st'>*</span><label>제목:</label></div>
       
          <div class='col-lg-12 text-center'>
            <input type='text' name='title'maxlength='100' size='100' style='background-color:#FFE2D5;' value="<%=rs.getString("title")%>">
            <p class='help-block'></p>
          </div>
   
 <div class='col-lg-12 text-center'><span class='st'>*</span><label>작성자:</label></div>
        
          <div class='col-lg-12 text-center'>
            <input type='text' name='user' maxlength='10' size='10' style='background-color:#FFE2D5;' value="<%=rs.getString("user")%>">
            <p class='help-block'></p>
          </div>
     
     <div class='col-lg-12 text-center'><label>특이사항:</label></div>
       
          <div class='col-lg-12 text-center'>
            <textarea rows='5' cols='99' name='etc' placeholder='특이사항' value="<%=rs.getString("etc")%>"></textarea>
            <p class='help-block'></p>
          </div>
     
        <div class='row'>
          <div class='col-lg-12 text-center'>
            <button type='submit' class='btn btn-success'>수정</button>
            <button type='button' class='btn btn-default' onClick="location.href='list.jsp'">목록</button>
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
        </div>
        </form>
      </div>
    </div>
  </body>
  </html>