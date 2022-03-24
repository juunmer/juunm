<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.ResultSet" %> 
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>

<%

String dbinfo = "jdbc:oracle:thin:@192.168.0.38:3306:orcl";
String idinfo = "root";
String pwdinfo = "oracle";

%>


