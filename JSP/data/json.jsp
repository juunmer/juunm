<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>
[
<%
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
    String sql = "select * from cal_test";
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen2";
		String DB_USER = "root";
		String DB_PASSWORD= "oracle";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        pstmt = conn.prepareStatement(sql);	
		rs = pstmt.executeQuery();


        
        while(rs.next()){
            String month_c=rs.getString("month");
            String eq_a=rs.getString("eq_a");
            String eq_b=rs.getString("eq_b");
            String eq_c=rs.getString("eq_c");
            
            //읽어올 값이 1행이라도 있다면
            if(rs.getRow()>1){
                out.print(",");
            }%>
            {
                "month_c":<%=month_c%>,
                "eq_a":<%=eq_a%>,
                "eq_b":<%=eq_b%>,
                "eq_c":<%=eq_c%>
            }
<%            
        }//while
    }catch(Exception e) {

	} finally{
		
		} 
%>
]