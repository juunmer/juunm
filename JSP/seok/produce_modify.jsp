<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="dbCon.jsp" %>






<%


String nb=request.getParameter("nb");

String D = request.getParameter("nb");


  int findcode = Integer.parseInt(D);
  String driver = "com.mysql.jdbc.Driver";

  try {
    Class.forName(driver);
  } 
    catch (ClassNotFoundException e) {
    e.printStackTrace();
  }

  Statement statement = null;
  ResultSet resultSet = null;

  try{
    conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
    statement=conn.createStatement();


  String sql="select * from produce where nb = " + findcode;
  resultSet = statement.executeQuery(sql);

  %>

  <table>
  <%
  while(resultSet.next()){
  
  
  %>







<!DOCTYPE html>

<head>
<Title>추가</Title>
</head>
<body>

  

  
    <form action="produce_modify_process.jsp" name="popupForm" method="post" >
       <input type="text" name="nb" value="<%=nb%>" /><br/>  
    프로젝트번호 : <input type="text" name="pno" value="<%=resultSet.getString("pno")%>" /> <br/>  
    프로젝트이름 : <input type="text" name="pproject" value="<%=resultSet.getString("pproject")%>"/><br/>
    담당자 : <input type="text" name="pmanager" value="<%=resultSet.getString("pmanager")%>"/><br/>
    납품수량 : <input type="text" name="pquantity" value="<%=resultSet.getString("pquantity")%>"/><br/>
    일자 : <input type="text" name="pdate" value="<%=resultSet.getString("pdate")%>"/><br/>
    
    <button type="submit">수정</button>
  


  </form>




  <%
}conn.close();
  } catch (Exception e) {
    e.printStackTrace();
    out.print("망함");
  }
%>

</body>
</html>

