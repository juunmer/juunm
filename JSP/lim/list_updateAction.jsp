<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>

<% 

request.setCharacterEncoding("utf-8"); 

String num = request.getParameter("num");
String m1 = request.getParameter("m1");
String m2 = request.getParameter("m2");
String m3 = request.getParameter("m3");
String m4 = request.getParameter("m4");
String m5 = request.getParameter("m5");
String title = request.getParameter("title");
String user = request.getParameter("user");
String etc = request.getParameter("etc");


try{

    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

   String sql = "UPDATE codelist SET m1=?, m2=?, m3=?, m4=?, m5=?, title=?, user=?, etc=? WHERE num= "+num;
    //String sql = "UPDATE codelist SET m2='sss' WHERE num= "+num;

    //out.print(sql);

    pstmt=conn.prepareStatement(sql);

     pstmt.setString(1,m1);
     pstmt.setString(2,m2);
     pstmt.setString(3,m3);
     pstmt.setString(4,m4);
     pstmt.setString(5,m5);
     pstmt.setString(6,title);
	 pstmt.setString(7,user);
     pstmt.setString(8,etc);
 
     out.print(sql);

     pstmt.executeUpdate();


    } catch(Exception e){ 

        out.print(e);
   }

   finally {

       response.sendRedirect("list_complete.jsp");

       

       if(pstmt != null)

           try{pstmt.close();} catch(SQLException e){}

       if(conn != null)

           try{ conn.close();} catch(SQLException e){}

       

   }

%>    
