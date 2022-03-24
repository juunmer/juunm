<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>


<%
request.setCharacterEncoding("utf-8");

String user_id = (String)session.getAttribute("user_id");
String pw = request.getParameter("pw");
String phone_number = request.getParameter("phone_number");
String user_email = request.getParameter("user_email");

out.print(phone_number);
out.print(pw);
out.print(user_email);

Connection conn;
PreparedStatement pstmt;
ResultSet rs;
String sql = "update user_signup set pw = ? , phone_number = ? , user_email= ? where id = ? ";

out.print(sql);
    try{
        Class.forName("com.mysql.jdbc.Driver");
        String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen2";
        String DB_USER = "root";
        String DB_PASSWORD= "oracle";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        pstmt = conn.prepareStatement(sql);	

        pstmt.setString(1,pw);
        pstmt.setString(2,phone_number);
        pstmt.setString(3,user_email);
        pstmt.setString(4,user_id);


	    int result = pstmt.executeUpdate();
if(result == 1){%> 
    <script>
    alert("수정완료")
    location.href ="myinfo.jsp";
    </script>
<%
}
else{
}

     }catch(Exception e){
        %>
        <script>
        alert("실패")
        history.back(0);
        </script>
    <%



	} finally{
		
		} 
%>
