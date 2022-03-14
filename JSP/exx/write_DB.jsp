<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write Database Page</title>
</head>
<body>
<%@ page import = "java.sql.*, java.util.*" %>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;
PreparedStatement pstmt = null;

StringBuffer sql = new StringBuffer();

try {
	conn = DriverManager.getConnection("jdbc:mysql://192.168.0.38/ezen1", "root", "oracle");
	pstmt = conn.prepareStatement("insert into test (name, d-day) values(?,?) ");
	pstmt.setString(1, name);
	pstmt.setString(2, d-day);
	
	
	pstmt.executeUpdate();
	
} catch (SQLException e) {
	e.printStackTrace();
} finally {

	if(pstmt != null)
		try {
			pstmt.close();
		} catch (Exception e) {}
	if(conn != null)
		try {
			conn.close();
		} catch (Exception e) {}
}
%>
id, password 가 입력되었습니다.
</body>
</html>