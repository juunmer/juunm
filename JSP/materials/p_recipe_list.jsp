<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>


<%
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
    String sql = "select m_barcode,m_code,m_class,m_name,m_count,m_size,m_price,m_locate from materials";
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen2";
        String DB_USER = "root";
        String DB_PASSWORD= "oracle";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        pstmt = conn.prepareStatement(sql);	
		rs = pstmt.executeQuery();


        
        while(rs.next()){
            String m_barcode=rs.getString("m_barcode");
            String m_code=rs.getString("m_code");
            String m_class=rs.getString("m_class");
            String m_name=rs.getString("m_name");
            String m_count=rs.getString("m_count");
            String m_size=rs.getString("m_size");
            String m_price=rs.getString("m_price");
            String m_locate=rs.getString("m_locate");
            
            //읽어올 값이 1행이라도 있다면
            if(rs.getRow()>1){
                out.print(",");
            }
        %>
            [
                "<%=m_barcode%>",
                "<%=m_code%>",
                "<%=m_class%>",
                "<%=m_name%>",
                "<%=m_count%>",
                "<%=m_size%>",
                "<%=m_price%>",
                "<%=m_locate%>"
            ]
<%            
        }//while
    }catch(Exception e) {

	} finally{
		
		} 
%>