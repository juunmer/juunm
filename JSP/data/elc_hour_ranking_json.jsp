<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>
[
<%
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
    String sql = "(SELECT inputDate,date_format(inputDate,'%H:00:00') date, (eq_a + eq_b + eq_c + eq_d + eq_e) sum_eq FROM elc_eq order by inputDate desc limit 10) order by sum_eq desc";
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen2";
        String DB_USER = "root";
        String DB_PASSWORD= "oracle";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        pstmt = conn.prepareStatement(sql);	
		rs = pstmt.executeQuery();


        
        while(rs.next()){
            String use_hour=rs.getString("date");
            String sum_eq=rs.getString("sum_eq");
            
            
            //읽어올 값이 1행이라도 있다면
            if(rs.getRow()>1){
                out.print(",");
            }%>
            {
                "use_hour":"<%=use_hour%>",
                "sum_eq":<%=sum_eq%>
                
            }
<%            
        }//while
    }catch(Exception e) {

	} finally{
		
		} 
%>
]