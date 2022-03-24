<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>
[
<%
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
    String sql = "select sum(p_count) p_count,date_format(p_out_date,'%Y-%m-%d') as date from p_out group by date_format(p_out_date,'%Y-%m-%d') order by date";
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen2";
		String DB_USER = "root";
		String DB_PASSWORD= "oracle";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        pstmt = conn.prepareStatement(sql);	
		rs = pstmt.executeQuery();


        
        while(rs.next()){
            String p_count=rs.getString("p_count");
            String date=rs.getString("date");
            
            
            //읽어올 값이 1행이라도 있다면
            if(rs.getRow()>1){
                out.print(",");
            }%>
            {
                "p_count":<%=p_count%>,
                "date":"<%=date%>"
                
            }
<%            
        }//while
    }catch(Exception e) {

	} finally{
		
		} 
%>
]