<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>


<%
request.setCharacterEncoding("utf-8");

String p_barcode = request.getParameter("p_barcode");
String p_code = request.getParameter("p_code");
String p_class = request.getParameter("p_class");
String p_name = request.getParameter("p_name");
String p_count = request.getParameter("p_count");
String p_size = request.getParameter("p_size");
String p_price = request.getParameter("p_price");



Connection conn;
PreparedStatement pstmt;
ResultSet rs;
String sql = "insert into p_in(p_barcode,p_code,p_class,p_name,p_count,p_size,p_price) values (?,?,?,?,?,?,?)";
    
out.print(sql);
    try{
        Class.forName("com.mysql.jdbc.Driver");
        String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen2";
        String DB_USER = "root";
        String DB_PASSWORD= "oracle";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        pstmt = conn.prepareStatement(sql);	

        pstmt.setString(1,p_barcode);
        pstmt.setString(2,p_code);
        pstmt.setString(3,p_class);
        pstmt.setString(4,p_name);
        pstmt.setString(5,p_count);
        pstmt.setString(6,p_size);
        pstmt.setString(7,p_price);

	    int result = pstmt.executeUpdate();
if(result == 1){%> 
    <script>
    alert("입고완료")
    opener.location.reload();
    window.close();
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
