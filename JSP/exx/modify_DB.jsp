<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Datebase</title>
</head>
<body>
<%@ page import= "java.sql.*, java.util.*" %>
<%
request.setCharacterEncoding("UTF-8");

String ID = request.getParameter("id");
String PW = request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
int updateCount = 0;

try {
	conn = DriverManager.getConnection("jdbc:mysql://192.168.0.38/ezen", "root", "oracle");
	stmt = conn.createStatement();
	updateCount = stmt.executeUpdate("update test set password = '"+PW+"' where id='"+ID+"'");
%>
<%} finally {
	if(stmt != null)
		try{
			stmt.close();
		} catch (Exception e) {}
	
	if(rs != null)
		try {
			rs.close();
		} catch (Exception e) {}
	
	if(conn != null)
		try {
			conn.close();
		} catch (Exception e) {}
	
}
%>
<% if(updateCount > 0) { %>
데이터가 수정되었습니다.
<%} else { %>
동일한 아이디가 존재하지 않습니다.
<% } %>

</body>
</html>