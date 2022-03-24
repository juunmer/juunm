<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="java.sql.DriverManager" %> 
<%@page import="java.sql.ResultSet" %> 
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.SQLException" %>





<%

    
    String DB_URL = "jdbc:mysql://localhost/ezen"; 
    
    String DB_USER = "root";
    
    String DB_PASSWORD= "1004";
    
    Connection conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
    
    PreparedStatement stmt;
    
    ResultSet rs = null;
    
    request.setCharacterEncoding("utf-8");
    



%>


