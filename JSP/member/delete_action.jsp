<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


<%

String num = request.getParameter("num");




try {

  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);



  String sql = "delete from user where num = ?";
  
  pstmt = conn.prepareStatement(sql);

  int result = pstmt.executeUpdate();
              
  try{
    pstmt.close();
    conn.close();

  } catch(Exception e){
    e.printStackTrace();
    
  }


  if(result == 1){ // 성공하는 경우 1을 반환
		response.sendRedirect("alert_close.jsp");
    //처리 완료 경고창을 알려줌

		} else{ // try 실패하는 경우 0을 반환
			out.print("오류 발생!");
      
		}


    
 } catch(Exception e){
			e.printStackTrace();
		}
        %>

