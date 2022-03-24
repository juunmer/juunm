<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>
[
<%
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
    String sql = "select date_format(inputDate,'%Y') as date , sum(eq_a) eq_a,sum(eq_b) eq_b,sum(eq_c) eq_c,sum(eq_d) eq_d,sum(eq_e) eq_e,sum(eq_a+eq_b+eq_c+eq_d+eq_e) sum_eq from elc_eq group by date";
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen2";
		String DB_USER = "root";
		String DB_PASSWORD= "oracle";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        pstmt = conn.prepareStatement(sql);	
		rs = pstmt.executeQuery();


        
        while(rs.next()){
            String date=rs.getString("date");
            String eq_a=rs.getString("eq_a");
            String eq_b=rs.getString("eq_b");
            String eq_c=rs.getString("eq_c");
            String eq_d=rs.getString("eq_d");
            String eq_e=rs.getString("eq_e");
            String sum_eq=rs.getString("sum_eq");
            
            //읽어올 값이 1행이라도 있다면
            if(rs.getRow()>1){
                out.print(",");
            }%>
            {
                "date":"<%=date%>",
                "eq_a":"<%=eq_a%>",
                "eq_b":"<%=eq_b%>",
                "eq_c":"<%=eq_c%>",
                "eq_d":"<%=eq_d%>",
                "eq_e":"<%=eq_e%>",
                "sum_eq":"<%=sum_eq%>"
            }
<%            
        }//while
    }catch(Exception e) {

	} finally{
		
		} 
%>
]