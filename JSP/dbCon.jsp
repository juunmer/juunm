<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.ResultSet" %> 
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>





<%

// IP 주소                                 | 바로 밑에 있는건 데이터 베이스 
String dbinfo = "jdbc:mysql://127.0.0.1/kh";

// 아이디 비번 
String idinfo = "root";
String pwdinfo = "root";


Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


%>


