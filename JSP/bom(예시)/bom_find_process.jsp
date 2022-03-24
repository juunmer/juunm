<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%> 
<%@ page import="java.sql.*"%>
<%@ include file="../dbCon.jsp" %>


<%

String dstart = request.getParameter("dstart");
String dend = request.getParameter("dend");
String category = request.getParameter("category");
String type = request.getParameter("type");
String pdname = request.getParameter("pdname");
String keyword = request.getParameter("keyword");


SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date to = fm.parse(dstart);
Date to = fm.parse(dend);
int pdcode = Integer.parseInt(P);

try {

  Class.forName("com.mysql.jdbc.Driver");

  conn = DriverManager.getConnection(dbinfo, idinfo, pwdinfo);

String sql = "select pdcode from bom where between ";

pstmt = conn.prepareStatement(sql);

pstmt.setString(1, null);
pstmt.setString(2, category);
pstmt.setString(3, pdname);
pstmt.setInt(4, count);
pstmt.setInt(5, sprice);
pstmt.setString(6, tax);
pstmt.setInt(7, rprice);

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

