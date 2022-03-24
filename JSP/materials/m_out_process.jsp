<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>


<%
request.setCharacterEncoding("utf-8");

String m_barcode = request.getParameter("m_barcode");
String m_code = request.getParameter("m_code");
String m_class = request.getParameter("m_class");
String m_name = request.getParameter("m_name");
String m_count = request.getParameter("m_count");
String m_size = request.getParameter("m_size");
String m_price = request.getParameter("m_price");



Connection conn;
PreparedStatement pstmt;
ResultSet rs;
String sql = "insert into m_out(m_barcode,m_code,m_class,m_name,m_count,m_size,m_price) values (?,?,?,?,?,?,?)";
    
out.print(sql);
    try{
        Class.forName("com.mysql.jdbc.Driver");
        String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen2";
        String DB_USER = "root";
        String DB_PASSWORD= "oracle";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        pstmt = conn.prepareStatement(sql);	

        pstmt.setString(1,m_barcode);
        pstmt.setString(2,m_code);
        pstmt.setString(3,m_class);
        pstmt.setString(4,m_name);
        pstmt.setString(5,m_count);
        pstmt.setString(6,m_size);
        pstmt.setString(7,m_price);

	    int result = pstmt.executeUpdate();
if(result == 1){%> 
    <script>
    alert("출고완료")
    opener.location.reload();
    window.close();
    </script>
<%
}
else{%>
    <script>
    alert("실패")
    history.back(0);
    </script>
<%
}

     }catch(Exception e){
 

	} finally{
		
		} 
%>