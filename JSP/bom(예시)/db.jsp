<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<%@ page import="java.sql.*"%>

<html>

<head>

<title>MySQL select 예제</title>

</head>

<body>

<%

String p_type = request.getParameter("p_type");
String p_name = request.getParameter("p_name");
String p_size = request.getParameter("p_size");

 out.println(p_type);
 out.println(p_name);
 out.println(p_size);
%>

</body>

</html>