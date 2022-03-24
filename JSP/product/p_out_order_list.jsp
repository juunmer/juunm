<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>

{ "data" :[
<%
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
    String sql = "select p_barcode,p_code,p_class,p_name,p_count,p_size,p_price,p_locate from product";
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen2";
		String DB_USER = "root";
		String DB_PASSWORD= "oracle";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        pstmt = conn.prepareStatement(sql);	
		rs = pstmt.executeQuery();


        
        while(rs.next()){
            String p_barcode=rs.getString("p_barcode");
            String p_code=rs.getString("p_code");
            String p_class=rs.getString("p_class");
            String p_name=rs.getString("p_name");
            String p_count=rs.getString("p_count");
            String p_size=rs.getString("p_size");
            String p_price=rs.getString("p_price");
            String p_locate=rs.getString("p_locate");
            
            //읽어올 값이 1행이라도 있다면
            if(rs.getRow()>1){
                out.print(",");
            }%>
            [
            "<%=p_barcode%>",
            "<%=p_code%>",
            "<%=p_class%>",
            "<%=p_name%>",
            "<%=p_count%>",
            "<%=p_size%>",
            "<%=p_price%>",
            "<%=p_locate%>"
            ]
<%            
        }//while
    }catch(Exception e) {

	} finally{
		
		} 
%>
]
    }