<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


<%

String D = request.getParameter("pd");

try {

  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

  String sql = "delete from bom where pdcode = '" + D + "'";
  
 
  pstmt = conn.prepareStatement(sql);

  int result = pstmt.executeUpdate();
              
  try{
    pstmt.close();
    conn.close();

  } catch(Exception e){
    e.printStackTrace();
    
  }


  if(result == 1){ // 성공
		response.sendRedirect("alert_complete.jsp");

		} else{ // 실패
			out.print("오류 발생!");
		}


    
 } catch(Exception e){
			e.printStackTrace();
		}
        %>

