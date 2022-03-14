<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


    <% 

	request.setCharacterEncoding("utf-8"); 

	String status = request.getParameter("status");
    String ok = request.getParameter("ok");
    String etc = request.getParameter("etc");


	try{

 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
 	
 	 String sql= "insert into status(status, ok, etc) values (?,?,?)";

 	 pstmt=conn.prepareStatement(sql);
	 pstmt.setString(1,status);
	 pstmt.setString(2,ok);
	 pstmt.setString(3,etc);
    

	 pstmt.executeUpdate();


	} catch(Exception e){ 

 		out.print(e);
    }

    finally {

        response.sendRedirect("st_complete.jsp");

        

        if(pstmt != null)

            try{pstmt.close();} catch(SQLException sqle){}

        if(conn != null)

            try{ conn.close();} catch(SQLException sqle){}

        

    }

%>
    
