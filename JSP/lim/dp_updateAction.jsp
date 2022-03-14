<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../dbCon.jsp" %>

<% 

request.setCharacterEncoding("utf-8"); 

String num = request.getParameter("num");
String dpcode = request.getParameter("dpcode");
String[] menu = request.getParameterValues("menu"); //체크박스 값을 배열로 받기
String menus = ""; // 다수의 값을 받기
String dpname = request.getParameter("dpname");
String etc = request.getParameter("etc");

// 다중 체크박스의 값을 풀어서 받음
    for(int i=0; i < menu.length; i++){
       // out.print(menu[i]);
        menus += menu[i];
        menus += ",";
    }

try{

    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

   String sql = "UPDATE department SET dpcode=?, dpname=?, menu=?, etc=? WHERE num= "+num;
    

    //out.print(sql);

    pstmt=conn.prepareStatement(sql);

    pstmt.setString(1,dpcode);
    pstmt.setString(2,dpname);
    pstmt.setString(3,menus);
    pstmt.setString(4,etc);

    pstmt.executeUpdate();


    } catch(Exception e){ 

        out.print(e);
   }

   finally {

       response.sendRedirect("dp_complete.jsp");

       

       if(pstmt != null)

           try{pstmt.close();} catch(SQLException e){}

       if(conn != null)

           try{ conn.close();} catch(SQLException e){}

       

   }

%>    
