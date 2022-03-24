<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db.jsp" %>

<!DOCTYPE html>
<html lang ="KO">

<head>

<title>게시판 글쓰기</title>

</head>

<body>

    

<%
    String user_id = null;
    if (session.getAttribute("user_id") != null) {
        user_id = (String) session.getAttribute("user_id");
    }
    request.setCharacterEncoding("utf-8");
    String board_title = request.getParameter("board_title");
    String board_content = request.getParameter("board_content");
    String board_user_id = request.getParameter("user_id");
    
    
    String sql="insert into board (board_title,board_content,user_id) values(?,?,?)";
    
    
    try {
    
      conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1,board_title);
      pstmt.setString(2,board_content);
      pstmt.setString(3,user_id);
        
        int result = pstmt.executeUpdate();
        
    
    if(result == 1){ // 성공
        %>
        
        <script type="text/javascript">
        alert("글쓰기 성공.");
        document.location.href='list.jsp'
        </script>
        <%
        
    } else{ // 실패
        %>
        <script type="text/javascript">
        alert("글쓰기에 실패.");
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