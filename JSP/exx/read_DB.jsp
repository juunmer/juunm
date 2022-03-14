<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Read Database Page</title>
</head>
<body>
<%@ page import = "java.sql.*, java.util.*" %>
MySQL 데이터 읽기
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
try {
	conn = DriverManager.getConnection("jdbc:mysql://192.168.0.38/ezen1", "root", "oracle");
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select * from test");
%>
<br><br>----------------------------------------<br>
<% while(rs.next()) { %>
<br> ID: <%= rs.getString("id") %><br>
<br> Password: <%=rs.getString("password") %><br>
--------------------------------------------<br><br>
<%
} 
}catch (SQLException e) { %>
<% e.printStackTrace(); %>
<%	
} finally {
	if(rs!=null)
		try {
			rs.close();
		} catch (SQLException e) {}
	if(stmt!=null)
		try {
			stmt.close();
		} catch (SQLException e) {}
	if(conn!=null)
		try {
			conn.close();
		} catch (SQLException e) {}
}
%>
</body>
</html>