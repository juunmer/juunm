<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


    <% 

	request.setCharacterEncoding("utf-8"); 

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
 	
 	 String sql= "insert into codelist(m1, m2, m3, m4, m5, title, user, etc) values (?,?,?,?,?,?,?,?)";

 	 pstmt=conn.prepareStatement(sql);
	 pstmt.setString(1,m1);
	 pstmt.setString(2,m2);
     pstmt.setString(3,m3);
     pstmt.setString(4,m4);
     pstmt.setString(5,m5);
     pstmt.setString(6,title);
     pstmt.setString(7,user);
	 pstmt.setString(8,etc);
    

	 pstmt.executeUpdate();


	} catch(Exception e){ 

 		out.print(e);
    }

    finally {

        response.sendRedirect("list_complete.jsp");

        

        if(pstmt != null)

            try{pstmt.close();} catch(SQLException sqle){}

        if(conn != null)

            try{ conn.close();} catch(SQLException sqle){}

        

    }

%>
    
