<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>

<% 

request.setCharacterEncoding("utf-8"); 

String num = request.getParameter("num");
String status = request.getParameter("status");
String ok = request.getParameter("ok");
String etc = request.getParameter("etc");


try{

    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

   String sql = "UPDATE status SET status=?, ok=?, etc=? WHERE num= "+num;

    //out.print(sql);

    pstmt=conn.prepareStatement(sql);

     pstmt.setString(1,status);
     pstmt.setString(2,ok);
     pstmt.setString(3,etc);
 
     out.print(sql);

     pstmt.executeUpdate();


    } catch(Exception e){ 

        out.print(e);
   }

   finally {

       response.sendRedirect("st_complete.jsp");

       

       if(pstmt != null)

           try{pstmt.close();} catch(SQLException e){}

       if(conn != null)

           try{ conn.close();} catch(SQLException e){}

       

   }

%>    
