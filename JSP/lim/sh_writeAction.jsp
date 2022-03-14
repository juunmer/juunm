<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


    <% 

	request.setCharacterEncoding("utf-8"); 

	String shnum = request.getParameter("shnum");
    String shname = request.getParameter("shname");
    String detail = request.getParameter("detail");
    String etc = request.getParameter("etc");

	try{

 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
 	
 	 String sql= "insert into storehouse(shnum, shname, detail, etc) values (?,?,?,?)";

 	 pstmt=conn.prepareStatement(sql);
	 pstmt.setString(1,shnum);
	 pstmt.setString(2,shname);
     pstmt.setString(3,detail);
	 pstmt.setString(4,etc);
    

	 pstmt.executeUpdate();


	} catch(Exception e){ 

 		out.print(e);
    }

    finally {

        response.sendRedirect("sh_complete.jsp");

        

        if(pstmt != null)

            try{pstmt.close();} catch(SQLException sqle){}

        if(conn != null)

            try{ conn.close();} catch(SQLException sqle){}

        

    }

%>
    
