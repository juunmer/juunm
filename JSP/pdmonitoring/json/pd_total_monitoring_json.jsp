<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>
[
<%
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
    String sql = "select * from pdprocesstest order by pdname";
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen3";
        String DB_USER = "root";
        String DB_PASSWORD= "oracle";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        pstmt = conn.prepareStatement(sql);	
		rs = pstmt.executeQuery();


        
        while(rs.next()){
            String pdname=rs.getString("pdname");
            String pdtarget=rs.getString("pdtarget");
			String pdnow=rs.getString("pdnow");
            
            
            //읽어올 값이 1행이라도 있다면
            if(rs.getRow()>1){
                out.print(",");
            }%>
            {
                "pdname":"<%=pdname%>",
                "pdtarget":<%=pdtarget%>,
                "pdnow":<%=pdnow%>
                
            }
<%            
        }//while
    }catch(Exception e) {

	} finally{
		
		} 
%>
]