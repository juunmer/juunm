<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.ResultSet" %> 
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>

<%
Connection conn;
PreparedStatement pstmt;
ResultSet rs;
Class.forName("com.mysql.jdbc.Driver");
String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen2";
String DB_USER = "root";
String DB_PASSWORD= "oracle";
%>