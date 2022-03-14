<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


<%

String email = request.getParameter("email");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String date = request.getParameter("date");
String phone = request.getParameter("phone");
String grade = request.getParameter("grade");
String dept = request.getParameter("dept");
String warehouse = request.getParameter("warehouse");


try {

  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);


  String sql= "update user set (id, pw, phone, email, grade, dept, warehouse ) values ('"+id+"','"+pw+"','"+phone+"', '"+email+"', '"+grade+"', '"+dept+"', '"+warehouse+"');";
	
  out.print(sql);

pstmt = conn.prepareStatement(sql);



int result = pstmt.executeUpdate();
		 
		try{
      pstmt.close();
			conn.close();
			

		} catch(Exception e){
			e.printStackTrace();
		}



    if(result == 1){ // 성공
		response.sendRedirect("alert_complete_close.jsp");

		} else{ // 실패
			out.print("입력 실패");
		}


    
 } catch(Exception e){
			e.printStackTrace();
		}
%>

