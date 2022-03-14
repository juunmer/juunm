<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.ResultSet" %> 
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>





<%


String dbinfo = "jdbc:mysql://192.168.0.38/ezen3";


String idinfo = "root";
String pwdinfo = "oracle";


Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


%>


