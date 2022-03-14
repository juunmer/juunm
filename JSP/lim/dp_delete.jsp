<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


<%

String num = request.getParameter("num");

int deletecode = Integer.parseInt(num);

//out.print(deletecode);

try{

  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

  String sql = "delete from department where num = " + deletecode;
  
 
  pstmt = conn.prepareStatement(sql);


  //out.print(sql);


  pstmt.executeUpdate();


  } catch(SQLException e) {
      e.printStackTrace();

  } finally {


 if(pstmt != null)

     try{pstmt.close();} catch(SQLException e){}

 if(conn != null)

     try{ conn.close();} catch(SQLException e){}

 
  }

        %>
        
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
        <script>
          alert("완료되었습니다.");
            location.href="department.jsp"
        </script>
        </head>
        <body>
        
        </body>
        </html>