<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>
<% 
String ID = request.getParameter("pd");
out.print(ID);

int id = Integer.parseInt(ID);
try {

  Class.forName("com.mysql.jdbc.Driver");

  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

String sql = "update bom set pdcode = concat(pdcode , '-', id) where id = " + id;

pstmt = conn.prepareStatement(sql);


int result = pstmt.executeUpdate();
		 
		try{
      pstmt.close();
			conn.close();
			

		} catch(Exception e){
			e.printStackTrace();
			out.print("오류1");
		}



    if(result == 1){ // 성공
		response.sendRedirect("alert_complete_close.jsp");

		} else{ // 실패
			out.print("입력 실패");
		}


    
 } catch(Exception e){
			e.printStackTrace();
			out.print("망함");
		}
%>

