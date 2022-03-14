<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.ResultSet" %> 
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>





<%

String dbinfo = "jdbc:mysql://localhost:3306/shopingmall";
String idinfo = "root";
String pwdinfo = "oracle1234";


Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


%>


