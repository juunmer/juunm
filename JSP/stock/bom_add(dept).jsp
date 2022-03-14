<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="javaScript.jsp" %>
<%@ include file="../dbCon.jsp" %>
<%@ include file="javaScript.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <!--bom 연결 아님!! department에 연동하여 값만 빼내는 jsp-->
  <title>HOME</title>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
  <link rel="stylesheet" href="CSS/base.css">
 
  <script type="text/javascript" lang="ko">

   </script>
<%

Statement statement = null;
      
Class.forName("com.mysql.jdbc.Driver");

String driver = "com.mysql.jdbc.Driver";

conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

statement=conn.createStatement();

String sql="select dpname from department";

pstmt=conn.prepareStatement(sql);

rs = pstmt.executeQuery();

%>
</head>
<body>
  <div style="position: relative; left: 50px; float: left;">
    <!--enctype설정시 request.getParameter사용불가 꼭 참고(form값이 null로 읽힘)-->
    <form method="post" action="./bom_add_process.jsp" name ="New" enctype="multipart/form-data" onsubmit="return check();" >
      <h2>부서 선택 </h2>
      <fieldset>
        <legend><h5>원하시는 부서선택버튼을 누르세요.</h5></legend>   
        <table >
          <%
          while(rs.next()){

          String DPname = rs.getString("dpname");
          %> 
          <tr> 
            <td><input type=
              "text" id="Dept"name="Dept" value="<%=DPname%>">
              <input type="button" value="선택" onclick="setParentText('<%=DPname%>')">
            </td>
          </tr>
          <%} %>
          
          
         
        </table>
      </fieldset>  
    </form>
  </div>
</body>
</html>