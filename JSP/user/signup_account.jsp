<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang ="KO">

<head>

<title>회원가입</title>

</head>

<body>

<%

 

    String DB_URL = "jdbc:mysql://192.168.0.38/ezen2";
    
    // DB URL Format = "jdbc:mysql://'DB IP':'Connector Port'/'DB_Name'";
    
     
    
    String DB_USER = "root";
    
    String DB_PASSWORD= "oracle";
    
    // DB ID/PASSWORD
    
     
    
    Connection conn;
    
    PreparedStatement stmt;
    
    ResultSet rs = null;
    
    request.setCharacterEncoding("utf-8");

    String name = request.getParameter("user_name");
    String position = request.getParameter("user_position");
    String id = request.getParameter("user_id");
    String pw = request.getParameter("user_pw");
    String brith = request.getParameter("user_brith");
    String account = request.getParameter("user_account");
    String jumin_number = brith+ "-" +account;
    String phone = request.getParameter("user_phone");
    String phone1 = request.getParameter("user_firstphone");
    String phone2 = request.getParameter("user_secondphone");
    String phone_number = phone+ "-" + phone1 + "-" + phone2;
    String eid = request.getParameter("email_id");
    String domain = request.getParameter("email_domain");
    String user_email = eid+"@"+domain;
    
    
    String sql="insert into user_signup (name,position,id,pw,jumin_number,phone_number,user_email) values(?,?,?,?,?,?,?)";
    
    
    try {
    
      Class.forName("com.mysql.jdbc.Driver");
    
      // Load JDBC Class
    
     
    
      conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    
      // Make Connection
    
    
    
      stmt = conn.prepareStatement(sql);
    
    stmt.setString(1,name);
    stmt.setString(2,position);
    stmt.setString(3,id);
    stmt.setString(4,pw);
    stmt.setString(5,jumin_number);
    stmt.setString(6,phone_number);
    stmt.setString(7,user_email);
    
    
    
    int result = stmt.executeUpdate();
    
    
    if(result == 1){ // 성공
        %>
        
        <script type="text/javascript">
        alert("회원가입되었습니다.");
        document.location.href='./login.jsp'
        </script>
        <%
        
    } else{ // 실패
        %>
        <script type="text/javascript">
        alert("실패했습니다.");
        history.back();
        </script>
        
        <%
            }
    
    
      //stmt.close();
    
      //conn.close();
    
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