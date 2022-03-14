<%@ page contentType="text/html;charset=euc-kr" pageEncoding="EUC-KR" %>

<%@ page import="java.sql.*"%>

<html>

<head>

<title>MySQL select 예제</title>

</head>

<body>

<%

 

String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen";

// DB URL Format = "jdbc:mysql://'DB IP':'Connector Port'/'DB_Name'";

 

String DB_USER = "root";

String DB_PASSWORD= "oracle";

// DB ID/PASSWORD

 

Connection conn;

Statement stmt;

ResultSet rs = null;

String query = "select * from EMP";

try {

  Class.forName("com.mysql.jdbc.Driver");

  // Load JDBC Class

 

  conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

  // Make Connection

 

  stmt = conn.createStatement();

  rs = stmt.executeQuery(query);

  // Do Query -> ( SELECT * FROM "test" )

 

  out.print("result: </br>");

  String s;

 

  while (rs.next())

  {

   out.println(rs.getString(1));

   out.println(" ");

  

   s = rs.getString(2);

 

   out.println(s);

   out.println("<br>");

  }

  //Print result to query

 

  rs.close();

  stmt.close();

  conn.close();

 }

 catch(Exception e){

  out.print("Exception Error...");

  out.print(e.toString());

 }

 finally {

 }

%>

</body>

</html>