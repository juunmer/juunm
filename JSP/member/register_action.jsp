<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<% request.setCharacterEncoding("UTF-8");%>
<%@ include file="../dbCon.jsp" %>

<% 
   String id = request.getParameter("id");
   String pw= request.getParameter("pw");
   String phone = request.getParameter("phone");
   String email = request.getParameter("email");
	 String grade = request.getParameter("grade");
	 String dept = request.getParameter("dept");
	 String warehouse = request.getParameter("warehouse");
	 String NUM = request.getParameter("NUM");


   try{
 	 
   
 	 Class.forName("com.mysql.jdbc.Driver");
 	 conn=DriverManager.getConnection(dbinfo, idinfo, pwdinfo);
		

    String sql= "insert into user(id, pw, phone, email, grade, dept, warehouse ) values ('"+id+"','"+pw+"','"+phone+"', '"+email+"', '"+grade+"', '"+dept+"', '"+warehouse+"');";
	
		

 	  pstmt=conn.prepareStatement(sql);
 	  pstmt.executeUpdate();
		
		
	 out.print("<script>alert('회원 가입이 정상적으로 완료되었습니다.');</script>");
	 out.print("<script>location.href = document.referrer;</script>");
	

  //response.sendRedirect("join.jsp"); 

	}catch(Exception e){ 
		e.printStackTrace();
		out.println("회원 가입에 실패하였습니다.");
    //response.sendRedirect("join_fail.jsp"); 업데이트 안 되었을 경우 노출할 페이지
	}finally{
		if(pstmt != null) 
			try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) 
			try{conn.close();}catch(SQLException sqle){}
	}


 %>
