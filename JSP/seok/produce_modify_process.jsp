<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="dbCon.jsp" %>



<%



String r=request.getParameter("nb");
String p=request.getParameter("pno");
String pproject=request.getParameter("pproject");
String pmanager=request.getParameter("pmanager");
String q=request.getParameter("pquantity");
String pdate=request.getParameter("pdate");

int pquantity = Integer.parseInt(q);
int pno = Integer.parseInt(p);
int nb = Integer.parseInt(r);



try {

  Class.forName("com.mysql.jdbc.Driver");

  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

  String sql = "update produce set pno=?, pproject=?,pmanager=?,pquantity=?,pdate=? where nb="+nb;

pstmt = conn.prepareStatement(sql);


pstmt.setInt(1, pno);
pstmt.setString(2, pproject);
pstmt.setString(3, pmanager);
pstmt.setInt(4, pquantity);
pstmt.setString(5, pdate);


pstmt.executeUpdate();


	} catch(Exception e){ 

 		out.print(e);
    }

    finally {

        response.sendRedirect("alert_complete.jsp");

        

        if(pstmt != null)

            try{pstmt.close();} catch(SQLException sqle){}

        if(conn != null)

            try{ conn.close();} catch(SQLException sqle){}

        

    }

%>
    
</body>
</html>
