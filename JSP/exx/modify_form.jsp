<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Read Database</title>
</head>
<body>
<%@ page import = "java.sql.*, java.util.*" %>
MySQL 데이터를 읽고 수정하기
<form name="form" method="post" action="modify_DB.jsp">
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
	conn = DriverManager.getConnection("jdbc:mysql://192.168.0.38/ezen", "root", "oracle");
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select * from test");
	%>
	<%while(rs.next()) {%>
	<br><br> ID: <input type="text" name="id" value="<%= rs.getString("id") %>">
	<br><br>Password: <input type="text" name="password" value="<%=rs.getString("password") %>">
	<%
}

}
catch (SQLException e) { %>
SQLException
<%
} finally {
	if(rs!= null)
		try {
			rs.close();
		} catch(SQLException e) {}
	
	if(stmt!= null)
		try {
			stmt.close();
		} catch(SQLException e) {}
	
	if(conn!= null)
		try {
			conn.close();
		} catch(SQLException e) {}
}
%>
<input type="submit" name="formbutton1" value="수정하기">
</form>
</body>
</html>