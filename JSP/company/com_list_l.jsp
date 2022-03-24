<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="gd.board.*,java.sql.*"%>

{ "data" :[
<%
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
    String sql = "select c_code,c_class,c_name,c_ceo,c_registnum,c_phonenum,c_mail,c_fax from company";
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
		String DB_URL = "jdbc:mysql://192.168.0.38:3306/ezen2";
		String DB_USER = "root";
		String DB_PASSWORD= "oracle";
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        pstmt = conn.prepareStatement(sql);	
		rs = pstmt.executeQuery();


        
        while(rs.next()){
            String c_code=rs.getString("c_code");
            String c_class=rs.getString("c_class");
            String c_name=rs.getString("c_name");
            String c_ceo=rs.getString("c_ceo");
            String c_registnum=rs.getString("c_registnum");
            String c_phonenum=rs.getString("c_phonenum");
            String c_mail=rs.getString("c_mail");
            String c_fax=rs.getString("c_fax");
            
            //읽어올 값이 1행이라도 있다면
            if(rs.getRow()>1){
                out.print(",");
            }%>
            [
            "<%=c_code%>",
            "<%=c_class%>",
            "<%=c_name%>",
            "<%=c_ceo%>",
            "<%=c_registnum%>",
            "<%=c_phonenum%>",
            "<%=c_mail%>",
            "<%=c_fax%>"
            ]
<%            
        }//while
    }catch(Exception e) {

	} finally{
		
		} 
%>
]
    }