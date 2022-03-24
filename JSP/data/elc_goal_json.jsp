<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>
[
<%
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
    String sql = "select date_format(inputDate,'%Y-%m-%d') date, sum(eq_a+eq_b+eq_c+eq_d+eq_e) sum_eq from elc_eq group by date order by date desc limit 1";
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen2";
		String DB_USER = "root";
		String DB_PASSWORD= "oracle";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        pstmt = conn.prepareStatement(sql);	
		rs = pstmt.executeQuery();


        
        while(rs.next()){
            String sum_eq=rs.getString("sum_eq");
            
            
            
            //읽어올 값이 1행이라도 있다면
            if(rs.getRow()>1){
                out.print(",");
            }%>
            {
                "sum_eq":<%=sum_eq%>
                
                
            }
<%            
        }//while
    }catch(Exception e) {

	} finally{
		
		} 
%>
]