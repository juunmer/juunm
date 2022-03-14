<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="dbCon.jsp" %>


<%

String D = request.getParameter("nb");

int deletecode = Integer.parseInt(D);

//out.print(deletecode);

try {

  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

  String sql = "delete from produce where nb = " + deletecode;
  
 
  pstmt = conn.prepareStatement(sql);

  pstmt.executeUpdate();


	} catch(Exception e){ 

 		out.print(e);
    }

    finally {

        response.sendRedirect("alert_complete_close.jsp");

        

        if(pstmt != null)

            try{pstmt.close();} catch(SQLException sqle){}

        if(conn != null)

            try{ conn.close();} catch(SQLException sqle){}

        

    }

%>


 
</body>
</html>
